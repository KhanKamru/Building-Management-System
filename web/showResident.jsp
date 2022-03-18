<%@page import="Com.BuildingManagementSystem.Data.Resident"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Resident> residentList = null;
    ResidentDao rd = new ResidentDao();
    if (request.getParameter("id")==null) {
        residentList = rd.showAllResidents();
    } else {
        Object id = (Object)request.getParameter("id");
        residentList = rd.fetchResidedntDetails(id);
    }
    if(!residentList.isEmpty()){
%>
<div class="mb-3">
    <input type="text" class="form-control border border-dark" id="resident" placeholder="Search Resident by their Room Number or name or phone number" >
</div>
<button class="btn btn-primary border border-dark mt-2" id="findResident" onclick="findResident()">Find</button>
<h4>Residents List:</h4>
<table class='table table-striped table-bordered border-dark'>
    <thead>
        <tr>
            <th scope="col">Sr.No</th>
            <th scope="col">Room No.</th>
            <th scope="col">Name</th>
            <th scope="col">Phone No.</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            int count = 1;
            for (Resident resident : residentList) {%>
        <tr>
            <td><%= count%></td>
            <td><%=resident.getRoomNum()%></td>
            <td><%=resident.getName()%></td>
            <td><%=resident.getPhoneNum()%></td>
            <td>
                <a href="adminDashboard.jsp?residentId=<%=resident.getRid()%>" class="btn btn-danger border border-dark">Delete</a>
                <a href="updateResident.jsp?id=<%=resident.getRid()%>" id="resUpdateBtn" class="btn btn-warning border border-dark">Update</a>
            </td>
            <%
                    count++;
                    out.println("</tr>");
                }
            %>
    </tbody>
</table>
<% }
else{
out.println("<h5>No Result Found</h5>");
}%>
