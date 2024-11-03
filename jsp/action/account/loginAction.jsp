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
    //입력한 정보 받아오기
    String input_id = request.getParameter("valueID");
    String input_pw = request.getParameter("valuePW");

    //날짜 받아오기
    String yearValue = request.getParameter("year");
    String monthValue = request.getParameter("month");

    //통신 연결 부
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105");

    //DB에서 정보받아오기
    String sql = "SELECT position_idx,dept_idx FROM user WHERE id = ? AND pw =?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,input_id);
    query.setString(2,input_pw);
    
    ResultSet result = query.executeQuery();

    
    if(result.next()){//결과가 반환되는 경우(해당 정보 존재)

        //세션에 현재 로그인 유저 정보 저장
        String userPos = result.getString("position_idx");
        String userDept = result.getString("dept_idx");
        session.setAttribute("user_id",input_id);
        session.setAttribute("user_pos_idx",userPos);
        session.setAttribute("user_dept_idx",userDept);

        //메인 페이지로 이동
        out.println("<script>alert('로그인에 성공하였습니다'); location.href = '/scheduler_project/jsp/page/schedulerMain.jsp?year=" + yearValue + "&month=" + monthValue + "'; </script>");
        out.flush();
        
    }else{// 결과가 반환되지 않는 경우(해당 정보 부재)
        //로그인 실패시 index로 이동
        out.println("<script>alert('존재하지 않는 계정입니다. ID와 PW를 확인해주세요');location.href = '/scheduler_project/index.html';</script>");
        out.flush();
    }

    String from_session_id  = (String)session.getAttribute("user_id");

%>