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

    String timeValue = (String)session.getAttribute("time");
    String contentValue  = (String)session.getAttribute("content");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105");

    String addTodoSql = "INSERT INTO todolist (user_id,time,content) VALUES (?,?,?)";
    PreparedStatement query = connect.prepareStatement(addTodoSql);
    query.setString(1,loginId);
    query.setString(2,timeValue);
    query.setStrint(3,contentValue);
    query.executeUpdate();

    //listPopUpPage.jsp에서 년도 월 날짜 데이터 여기로 끌어와야함 그래야 넣을 수 있음
    //현재까지 선언된 timeValue는 시/분 밖에 없음 -> 년도-월-날짜-시간으로 만들어줘야함
    // 어차피 jsp에서 변수로 선언된거 그거 이용해도 될듯 -> 어떻게 넘기느냐가 중요함


    location.herf = "/scheduler_project/jsp/page/listPopUpPage.jsp?&year=" + <%=currYear%>+"&month="+<%=currMonth%>&day=<%=day%>"
%>