<%@ page language="java" %>
<%
    String currYear = request.getParameter("currYear");
    if (currYear != null) {
        session.setAttribute("year", Integer.parseInt(currYear));
    }
%>
