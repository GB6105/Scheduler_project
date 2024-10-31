<%@ page language = "java" contentType = "text/html" pageEncoding ="utf-8"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.time.LocalDate" %>
<%@ page session = "true" %>

<%
    request.setCharacterEncoding("utf-8");
    var day = request.getParameter("day");

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
                    <%-- 자스로 일정 데베 받아서 직접 import --%>
                    <%-- 일정 추가 버튼 --%>
                    <div class = "todoListContent" id = "addTodoList">
                        <div class = "index" id = "addIndex" onclick = "f()">+</div>
                        <input class = "timeDisplay" id = "inputTime" placeholder = "00:00"></input>
                        <input class = "todoDisplay" id = "inputTodo" placeholder ="일정을 입력하세요"></input>
                    </div>
                    
                    <%-- 일정출력 --%>
                    <div class = "todoListContent">
                        <div class = "index">1</div>
                        <div class = "timeDisplay" id = "time">10:00</div>
                        <div class = "todoDisplay" id = "todo">거래처 미팅</div>
                    </div>


                </div>

            </div>
        </div>
</body>