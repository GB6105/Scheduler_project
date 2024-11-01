<%@ page language = "java" contentType = "text/html" pageEncoding = "utf-8" %>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.time.LocalDate" %>
<%@ page import = "java.io.PrintWriter" %>


<%@ page session = "true"%>

<%-- 백엔드 통신 부분 --%>
<%
    request.setCharacterEncoding("utf-8");
    String input_id = request.getParameter("valueID");
    String input_pw = request.getParameter("valuePW");
    

    //통신 연결 부
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105");

    String sql = "SELECT position_idx,dept_idx FROM user WHERE id = ? AND pw =?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,input_id);
    query.setString(2,input_pw);
    
    ResultSet result = query.executeQuery();

    if(result.next()){

        String userPos = result.getString("position_idx");
        String userDept = result.getString("dept_idx");
        session.setAttribute("user_id",input_id);
        session.setAttribute("user_pos_idx",userPos);
        session.setAttribute("user_dept_idx",userDept);

        out.println("<script>alert('로그인에 성공하였습니다'); location.href = '/scheduler_project/jsp/page/schedulerMain.jsp'; </script>");
        out.flush();
    }else{
        out.println("<script>alert('존재하지 않는 계정입니다. ID와 PW를 확인해주세요');location.href = '/scheduler_project/index.html';</script>");
    }

    // String sql1 = "SELECT pw,position_idx,dept_idx FROM user WHERE id = ?";
    // String result_PW = "";
    // if(result.next()){
    //     result_PW = result.getString("pw");
    //     result_position = result.getString("position_idx");
    //     result_dept = result.getString("dept_idx");
    // }

    // if(result_PW.equals(input_pw)){// 맞을 경우 세션에 다음 정보를 저장
    //     session.setAttribute("user_id",input_id); // 접속자 id
    //     session.setAttribute("user_position",result_position); // 접속자 직책 -> 팀장 접속시 기능 이용 가능
    //     session.setAttribute("user_dept",result_dept);  // 접속자 부서 -> 팀장 접속시 기능 이용 가능
    // }
    String from_session_id  = (String)session.getAttribute("user_id");

%>

<script>
    //컴퓨터 시간 받아오기
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    month += 1;
    console.log(year);
    console.log(month+1);

    console.log("<%=from_session_id%>");
    console.log("<%=input_id%>");
    console.log("<%=input_pw%>");
    <%-- console.log("<%=result_position%>");
    console.log("<%=result_dept%>"); --%>



<%-- 
    if("<%=result_PW%>" === "<%=input_pw%>"){
        alert("로그인에 성공하였습니다!")
        location.href = "/scheduler_project/jsp/page/schedulerMain.jsp?year="+year+"&month="+month;
    }else if("<%=result_PW%>" == ""){
        alert("존재하지 않는 계정입니다")
        location.href = "/scheduler_project/index.html"
    }else if("<%=result_PW%>" !== null){
        alert("PW를 확인해주세요!")
        location.href = "/scheduler_project/index.html"
    } --%>


</>