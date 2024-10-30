<%@ page language ="java" contentType = "text/html" pageEncoding ="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.*, java.io.*" %>
<%-- 백엔드 통신 --%>
<%
    request.setCharacterEncoding("utf-8"); //받아온 값에 대한 인코딩 설정 안하면 유니코드 된다)
    String idValue = request.getParameter("id");  ///request는 이전 페이지를 의미함
    String pwValue = request.getParameter("pw");
    String nameValue = request.getParameter("name");
    String deptValue = request.getParameter("department");
    String positionValue = request.getParameter("position");
    String emailValue = request.getParameter("email");
    String domainValue = request.getParameter("domain");
    String emailAddressValue = emailValue + domainValue;
    
    String errorMessage = "";//에러메시지를 위한 저장
    
    //DB 찾아오기
    Class.forName("org.mariadb.jdbc.Driver"); //이게 오류나면 db가 설치가 안됫거나, 꺼져있거나 커넥터파일이 잘못됫거나
    try{
        Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/scheduler","GB","6105"); //db에 연결하는 부분

        String sql ="INSERT INTO user (id, pw, name, dept_idx, position_idx, email) VALUES (?,?,?,?,?,?)"; // 

        PreparedStatement query = connect.prepareStatement(sql);
        query.setString(1,idValue);
        query.setString(2,pwValue);
        query.setString(3,nameValue);
        query.setString(4,deptValue);
        query.setString(5,positionValue);
        query.setString(6,emailAddressValue);

        query.executeUpdate();
    }catch(SQLException e){
        errorMessage = "해당 정보로 가입된 계정이 이미 존재합니다." + e.getMessage();
    }catch(Exception e ){
        errorMessage = "예상치 못한 에러가 발생했습니다. 관리자에게 문의하십시오" + e.getMessage();
    }
%>

<%-- 프론트 엔드 레이아웃 (위 데이터를 사용한) --%>

<script>

    <% if (!errorMessage.isEmpty()){ %>
        alert("<%=errorMessage%>")
<%  }  else{%>
        console.log("<%=idValue%>")
        console.log("<%=pwValue%>") 

        alert("회원가입이 성공하였습니다!,로그인하여 주세요")
        location.href ="/scheduler_project/index.html"
<%    } %>
</script>
