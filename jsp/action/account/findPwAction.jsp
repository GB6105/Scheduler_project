<%@ page language ="java" contentType = "text/html" pageEncoding ="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %> 

<%
    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("id");
    String emailValue = request.getParameter("email");
    String domainValue = request.getParameter("domain");
    String emailAddressValue = emailValue + domainValue;
    String errorMessage = "";//에러메시지를 위한 저장
    String find_pw = "";

    try{
        Class.forName("org.mariadb.jdbc.Driver");

        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105"); //db에 연결하는 부분

        String sql = "SELECT pw FROM user WHERE email = ?";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1,emailAddressValue);

        ResultSet result= query.executeQuery();
        
        if(result.next()){
            find_pw = result.getString("pw");
        }
        
    }catch(Exception e){
        errorMessage = "예상치 못한 에러가 발생했습니다. 관리자에게 문의하십시오" + e.getMessage();
    }
%>

<script>
    if("<%=find_pw%>"){
        console.log("<%=find_pw%>")
        alert("회원님의 pw는 " + "<%=find_pw%>" + "입니다.")
        location.href = "/scheduler_project/index.html"
    }else{
        alert("입력하신 정보에 해당하는 id를 찾을 수 없습니다.\n 회원가입을 진행해주세요")
        location.href = "/scheduler_project/html/account/findIdPage.html"
    }

</script>
