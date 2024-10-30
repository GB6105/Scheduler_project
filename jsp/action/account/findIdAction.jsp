<%@ page language ="java" contentType = "text/html" pageEncoding ="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %> 

<%
    request.setCharacterEncoding("utf-8");
    String emailValue = request.getParameter("email");
    String domainValue = request.getParameter("domain");
    String emailAddressValue = emailValue + domainValue;
    try{
        Class.forName("org.mariadb.jdbc.Driver");

        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105"); //db에 연결하는 부분

        String sql = "SELECT id FROM user WHERE email = ?";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1,emailAddressValue);


        ResultSet result= query.executeQuery();
        String find_id = "";
        if(result.next()){
            find_id = result.getString("id");
        }
        
    }catch(Exception e){
        errorMessage = "예상치 못한 에러가 발생했습니다. 관리자에게 문의하십시오" + e.getMessage();

    }
%>

<script>
    if("<%=find_id%>"){
        console.log("<%=find_id%>")
        alert("회원님의 id는 " + "<%=find_id%>" + "입니다.")
        location.href = "/scheduler_project/index.html"
    }else{
        alert("입력하신 정보에 해당하는 id를 찾을 수 없습니다.\n 회원가입을 진행해주세요")
        location.href = "/scheduelr_project/html/account/findIdPage.html"
    }
    
    
</script>
