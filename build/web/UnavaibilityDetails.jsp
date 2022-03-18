<%@page import="Com.BuildingManagementSystem.Data.Unavaibility"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int roomNo = Integer.parseInt(request.getParameter("roomNo"));
    ResidentDao rd=new ResidentDao();
    Unavaibility un= rd.unavaibilityChecking(roomNo);
%>
<p>This resident is not available from <%=un.getFromDate()%> to <%=un.getToDate() %><br>
    <b>Message From him/her:</b><%=un.getMsg() %>
</p>
