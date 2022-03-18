<%-- 
    Document   : showComplaint
    Created on : 01-Mar-2022, 8:30:27 pm
    Author     : kamru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
 ResidentDao rd=new ResidentDao();
 ResultSet rs=rd.allComplaints();
 if(!rs.isBeforeFirst()){
 out.println("<h5>No Complaint Found</h5>");

    }
 while(rs.next())
 {
%>
<div class="card" style="width: 18rem;">
  <div class="card-body">
      <h5 class="card-title">Complaint From <%= rs.getString("name")%></h5>
      <p class="card-text"><%=rs.getString(1)%>. . .</p>
    <a href="specificComplaint.jsp?id=<%=rs.getInt("id")%>" class="btn btn-primary">View More</a>
  </div>
</div>
    <% }%>

