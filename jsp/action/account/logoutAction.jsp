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

    session.removeAttribute("user_id");
    session.removeAttribute("user_pos_idx");
    session.removeAttribute("user_dept_idx");

    out.println("<script>alert('로그아웃되었습니다. 안녕히가십시오');</script>");
    out.println("<script>location.href = '/scheduler_project/index.html'; </script>");

%>