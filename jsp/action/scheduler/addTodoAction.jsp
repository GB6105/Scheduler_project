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

    //날짜 데이터 불러오기
    String timeValue = request.getParameter("time");
    String contentValue  = request.getParameter("content");
    String fullDateValue = request.getParameter("fullDate");
    String totalTimeValue = fullDateValue + " " + timeValue;

    //날짜 문자열 분해
    String date[] = fullDateValue.split("-");
    
    if(!"".equals(timeValue) && !"".equals(contentValue)){
        Class.forName("org.mariadb.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105");

        //일정 추가하기
        String addTodoSql = "INSERT INTO todolist (user_id,time,content) VALUES (?,?,?)";
        PreparedStatement query = connect.prepareStatement(addTodoSql);
        query.setString(1,loginId);
        query.setString(2,totalTimeValue);
        query.setString(3,contentValue);
        query.executeUpdate();

        out.println("<script>alert('일정이 추가되었습니다.'); location.href = '/scheduler_project/jsp/page/listPopUpPage.jsp?year=" + date[0] + "&month=" + date[1] + "&day=" +date[2]+ "'; </script>");

    }else{
        out.println("<script>alert('값을 입력해주세요');</script>");
        out.println("<script>location.href = '/scheduler_project/jsp/page/listPopUpPage.jsp?year=" + date[0] + "&month=" + date[1] + "&day=" +date[2]+ "'; </script>");
    }
%>