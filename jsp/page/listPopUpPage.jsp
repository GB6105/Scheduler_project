<%@ page language = "java" contentType = "text/html" pageEncoding ="utf-8"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.time.LocalDate" %>
<%@ page session = "true" %>

<%
    request.setCharacterEncoding("utf-8");
    String loginId = (String)session.getAttribute("user_id");

    String day = request.getParameter("day");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String yearMonth = year+"-"+month+"-"+day;

    String time = "";
    String content = "";

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105");

    //해당 날짜 일정 가져오기
    String sql = "SELECT DATE_FORMAT(time,'%H:%i') AS time,content FROM todolist WHERE user_id = ? AND DATE(time) = ? ORDER BY time ASC";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,loginId);
    query.setString(2,yearMonth);
    
    ResultSet todoListResult = query.executeQuery();


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
    <div class = "modal" id = "todoList">
        <div id= "popupContainer">
            <div id = "popupHeader"><%=day%>일</div>

            <div id = "todoListUp">
                <div id = "listHeader">
                    나의 일정
                </div>
                <div id = "listBody">

                    <%-- 일정 추가 버튼 --%>
                    <div class = "todoListContent" id = "addTodoList">
                        <div class = "index" id = "addIndex" >+</div>
                        <input class = "timeDisplay" name = "inputTime" id = "inputTime" placeholder = "00:00"></input>
                        <input class = "todoDisplay" name = "inputTodo" id = "inputTodo" placeholder ="일정을 입력하세요"></input>
                    </div>
                    <%  
                        var idx = 1;
                        while(todoListResult.next()){
                            String timeValue = todoListResult.getString("time");
                            String contentValue = todoListResult.getString("content");
                    %>
                        <div class = "todoListContent">
                            <div class = "index"><%=idx%></div>
                            <div class = "timeDisplay" id = "time"><%=timeValue%></div>
                            <div class = "todoDisplay" id = "todo"><%=contentValue%></div>
                        </div>
                        
                    <% 
                        idx += 1;
                        } 
                    %>
                    
                </div>

            </div>
        </div>

    <script src = "/scheduler_project/js/scheduler/scheduler.js"></script>
    <script src = "/scheduler_project/js/scheduler/contentAction.js"></script>
    <script>
        console.log("<%=loginId%>")
        console.log("<%=yearMonth%>")
        console.log("<%=time%>")
        console.log("<%=content%>")
        
    </script>
</body>
</html>