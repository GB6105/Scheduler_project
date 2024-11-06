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

    String targetIdx = request.getParameter("idx");
    String fullDateValue = request.getParameter("date");

    String date[] = fullDateValue.split("-");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105");

    String deleteSql = "DELETE FROM todolist WHERE user_id =? AND idx = ? ";
    PreparedStatement query = connect.prepareStatement(deleteSql);
    query.setString(1,loginId);
    query.setString(2,targetIdx);
    query.executeUpdate();

    out.println("<script>alert('일정이 삭제되었습니다.'); location.href = '/scheduler_project/jsp/page/listPopUpPage.jsp?year=" + date[0] + "&month=" + date[1] + "&day=" +date[2]+ "'; </script>");


%>