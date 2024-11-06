<%@ page language = "java" contentType = "text/html" pageEncoding ="utf-8"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.time.LocalDate" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>

<%@ page session = "true" %>


<%
    request.setCharacterEncoding("utf-8");

    // 세션값 불러오기
    String loginId = (String)session.getAttribute("user_id");
    String loginPositionIdx = (String)session.getAttribute("user_pos_idx"); //인덱스 값으로 받아옴
    String loginDeptIdx = (String)session.getAttribute("user_dept_idx");

    // 개인정보 표시를 위한 변수 설정
    String userId ="";
    String userEmail = "";
    String userName = "";
    String userPosition = "";
    String userDept = "";
    String errorMessage = "";

    // 로그인 시 받아오는 날짜 데이터(변경가능 변수)
    String currYear = request.getParameter("year");
    String currMonth = request.getParameter("month");
    String yearMonth = currYear + "-" + currMonth;
    String fullDate = yearMonth + "-" +"01";

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105");

    //개인정보 받아오기
    String sql = "SELECT id,name,email,p.posit_name,d.dept_name FROM user AS u JOIN posit AS p ON u.position_idx = p.idx JOIN department AS d ON u.dept_idx = d.idx WHERE id = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,loginId);
    
    ResultSet infoResult = query.executeQuery();

    if(infoResult.next()){
        userId = infoResult.getString("id");
        userName = infoResult.getString("name");
        userEmail = infoResult.getString("email");
        userPosition = infoResult.getString("p.posit_name");
        userDept = infoResult.getString("d.dept_name");
    }
    
%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" type = "text/css" href = "/scheduler_project/css/scheduler/scheduler.css">
    <link rel = "stylesheet" type = "text/css" href = "/scheduler_project/css/account/signUpPage.css">
    <link rel = "stylesheet" type = "text/css" href = "/scheduler_project/css/account/accountElement.css">
    <title>Document</title>

</head>
<body>
    <nav id = "leftSideMenu">
        <button class = "sideMenuButton" id = "menuUnfoldButton" onclick =showSideMenu(event)></button>
    </nav>

    <nav id = "sideMenuUnfolded">
        <button class = "sideMenuButton" id = "menuFoldButton" onclick =hideSideMenu(event)></button>
        <div id = "profileImg"></div>
        <article id = "profileContainer">
            <div class = "infoContainer" id = "displayID" ><%=loginId%></div>
            <div class = "infoContainer" id = "displayEmail"><%=userEmail%></div>
            <div class = "infoContainer" id = "displayName"><%=userName%></div>
            <div class = "infoContainer" id = "displayDepartment">부서: <%=userDept%></div>
            <div class = "infoContainer" id = "displayPosition">직책: <%=userPosition%></div>
            <button id = "infoFixButton" onclick = showFixInfoPopup(event)>정보 수정</button>
        </article>
        <button id = "resignButton">회원 탈퇴</button>
    </nav>

    <article id = "scheduler">
        <div id = "header">
            <div id = "yearAndMonthDisplay">
                <div id = "yearContainer">
                    <button type = "button" class = "changeYearButton" id = "lastYearButton" onclick = "prevYear(event)"></button>
                    <div id = "displayYear"><%=currYear%></div>
                    <button type = "button" class = "changeYearButton" id = "nextYearButton" onclick = "nextYear(event)"></button>
                </div>
                <div id = "monthContainer"><%=currMonth%>월</div>
            </div>
            <div id = "monthList">
                <%-- 백엔드 통신 이용해서 월 변경 버튼 생성 --%>
                <% 
                    var i = 1;
                    for(i = 1; i<13; i++){
                    var fiexdYear = currYear;
                    var targetMonth = i;
                %>
                    <button type = "button" id = "monthChangeButton" 
                        onclick = "location.href = '/scheduler_project/jsp/page/schedulerMain.jsp?year='+<%=fiexdYear%>+'&month='+<%=targetMonth%>">
                        <%= i%>
                    </button>
                <% } %>
            </div>
        </div>
        <div id = "schedulerMainFrame">

            <%  if("1".equals(loginPositionIdx)){           
                    String sql1 = "WITH RECURSIVE T AS (SELECT 1 AS NUM UNION ALL SELECT NUM + 1 FROM T WHERE NUM < DAY(LAST_DAY(?))) SELECT NUM, IFNULL(B.CNT, 0) AS CNT FROM T LEFT OUTER JOIN ( SELECT COUNT(*) AS CNT, DAY(time) AS DATE FROM todolist WHERE user_id = ? AND DATE_FORMAT(time, '%Y-%m') = ? GROUP BY DAY(time)) B ON NUM = B.DATE ORDER BY NUM";
                    PreparedStatement query1 = connect.prepareStatement(sql1);
                    query1.setString(1,fullDate);
                    query1.setString(2,loginId);
                    query1.setString(3,yearMonth);

                    ResultSet result = query1.executeQuery();

                    while(result.next()){
                        String day = result.getString("NUM");                                            
                        String count = result.getString("CNT");
            %>
                <div class="importDayContainer" onclick="window.open(`/scheduler_project/jsp/page/listPopUpPage.jsp?&year=<%=currYear%>&month=<%=currMonth%>&day=<%=day%>`, '_blank', 'width=500,height=500');">
                    <%=day%>
                    <div id = "totalTodo"><%=count%></div>
                </div>
            <%  
                    }
                }else if("2".equals(loginDeptIdx)){
                    String sql2 = "WITH RECURSIVE T AS (SELECT 1 AS NUM UNION ALL SELECT NUM + 1 FROM T WHERE NUM < DAY(LAST_DAY(?)) ) SELECT T.NUM, IFNULL(B.CNT, 0) AS CNT FROM T LEFT OUTER JOIN (SELECT COUNT(*) AS CNT, DAY(time) AS DATE FROM todolist JOIN user ON todolist.user_id = user.id WHERE user.position_idx = ?  AND DATE_FORMAT(time, '%Y-%m') = ? GROUP BY DAY(time) ) B ON T.NUM = B.DATE ORDER BY T.NUM;";
                    PreparedStatement query2 = connect.prepareStatement(sql2);
                    query2.setString(1,fullDate);
                    query2.setString(2,loginId);
                    query2.setString(3,yearMonth);

                    ResultSet result = query2.executeQuery();

                    while(result.next()){
                        String day = result.getString("NUM");                                            
                        String count = result.getString("CNT");
            %>
                <div class="importDayContainer" onclick="window.open(`/scheduler_project/jsp/page/listPopUpPage.jsp?&year=<%=currYear%>&month=<%=currMonth%>&day=<%=day%>`, '_blank', 'width=500,height=500,top=100,left=100');">
                    <%=day%>
                    <div id = "totalTodo"><%=count%></div>
                </div>
            <% 
                   }
                }
            %>

        </div>
    </article>
   
    <%-- 개인 정보 수정 모달 --%>
    <div class = "modal" id = "infoFix">
        <div id = "bodyFrame">
            <form id = "inputForm">
                <input class = "inputContainer" id = "inputId" placeholder = "ID를 입력해주세요(2~10글자)">
                <input class = "inputContainer" id = "inputPw" placeholder = "비밀번호를 입력해주세요(8~16글자)">
                <input class = "inputContainer" id = "inputName" placeholder = "이름을 입력해주세요">
                <div id = "deptAndPosition">
                    <select class = "select" id = "departmentSelect">
                        <option value = ""> 부서</option>
                        <option value = "manageTeam"> 경영</option>
                        <option value = "designTeam"> 디자인</option>
                    </select>
                    <select class = "select" id = "positionSelect">
                        <option value ="">직책</option>
                        <option value = "leader">팀장</option>
                        <option value = "member">팀원</option>
                    </select>
                </div>
                
                <div id = "email">
                    <input class = "inputContainer" id = "inputEmail">@
                    <select class = "select" id = "domainSelect">
                        <option value = "">선택하세요</option>
                        <option value = "@google.com">google.com</option>
                        <option value = "@naver.com">naver.com</option>
                    </select>
                </div>
                <button type = "submit" id = "confrimButton">Confirm</button>
    
            </form>
            
        </div>
        <button id = "returnButton" onclick = hideFixInfoPopup(event)>돌아가기</button>
    </div>
    <nav id = "rightSideMenu"></nav>

    <%-- 스크립트 스파게티 --%>
    <script src = "/scheduler_project/js/scheduler/scheduler.js"></script>
    <script>
        console.log("<%=loginId%>")
        console.log("<%=loginPositionIdx%>")
        console.log("<%=userPosition%>")
        console.log("<%=currYear%>")
        console.log("<%=currMonth%>")
        <%-- console.log("<%=M%>") --%>

        function prevYear(event){
            var yearMinus = <%=currYear%> - 1;
            location.href = "/scheduler_project/jsp/page/schedulerMain.jsp?year="+yearMinus+"&month="+<%=currMonth%>;
        }

        function nextYear(event){
            var yearPlus= <%=currYear%> + 1;
            location.href = "/scheduler_project/jsp/page/schedulerMain.jsp?year="+yearPlus+"&month="+<%=currMonth%>;
        }
    </script>

</body>
</html>