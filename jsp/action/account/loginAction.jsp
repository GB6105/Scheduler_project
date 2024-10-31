<%@ page language = "java" contentType = "text/html" pageEncoding = "utf-8" %>

<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.time.LocalDate" %>
<%@ page session = "true"%>

<%-- 백엔드 통신 부분 --%>
<%
    request.setCharacterEncoding("utf-8");
    String input_id = request.getParameter("valueID");
    String input_pw = request.getParameter("valuePW");
    String result_position = "";
    String result_dept = "";


    //통신 연결 부
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105");

    String sql1 = "SELECT pw,position_idx,dept_idx FROM user WHERE id = ?";
    PreparedStatement query = connect.prepareStatement(sql1);
    query.setString(1,input_id);

    ResultSet result = query.executeQuery();
    String result_PW = "";
    if(result.next()){
        result_PW = result.getString("pw");
        result_position = result.getString("position_idx");
        result_dept = result.getString("dept_idx");
    }

    if(result_PW.equals(input_pw)){// 맞을 경우 세션에 다음 정보를 저장
        session.setAttribute("user_id",input_id); // 접속자 id
        session.setAttribute("user_position",result_position); // 접속자 직책 -> 팀장 접속시 기능 이용 가능
        session.setAttribute("user_dept",result_dept);  // 접속자 부서 -> 팀장 접속시 기능 이용 가능
    }
    String from_session_id  = (String)session.getAttribute("user_id");


    //접속 당시 시간 (날짜 및 연도 저장)
    // LocalDate now = LocalDate.now(); // 접속당시 시간 저장

    // int year = now.getYear();
    // int month = now.getMonthValue();

    // session.setAttribute("year",year);
    // session.setAttribute("month",month);

    // int currYear = (int)session.getAttribute("year");
    // int currMonth = (int)session.getAttribute("month");

%>

<script>
    //컴퓨터 시간 받아오기
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();

    console.log("<%=from_session_id%>");
    console.log("<%=input_id%>");
    console.log("<%=input_pw%>");
    console.log("<%=result_position%>");
    console.log("<%=result_dept%>");


    console.log(year);
    console.log(month+1);


    if("<%=result_PW%>" === "<%=input_pw%>"){
        alert("로그인에 성공하였습니다!")
        location.href = "/scheduler_project/jsp/page/schedulerMain.jsp?year="+year+"&month="+month;
    }else if("<%=result_PW%>" == ""){
        alert("존재하지 않는 계정입니다")
        location.href = "/scheduler_project/index.html"
    }else if("<%=result_PW%>" !== null){
        alert("PW를 확인해주세요!")
        location.href = "/scheduler_project/index.html"
    }


</script>