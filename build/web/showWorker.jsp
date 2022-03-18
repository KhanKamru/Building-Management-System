<%@page import="java.util.ArrayList"%>
<%@page import="Com.BuildingManagementSystem.Data.Worker"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.WorkerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    WorkerDao wd = new WorkerDao();
    ArrayList<Worker> workerList = null;
    if (request.getParameter("id") == null) {
        workerList=wd.showAllWorker();
    }
    else{
        String value = request.getParameter("id");
        workerList=wd.fetchWorkerDetails(value);
    }
    if(!workerList.isEmpty())
    {
%>
<div class="mb-3">
    <input type="text" class="form-control border border-dark" id="worker" placeholder="Search Worker by their Phone Number or name or role">
</div>

<button class="btn btn-primary border border-dark" id="findWorker" onclick="findWorker()">Find</button>
<h4>Worker List:</h4>
<table class='table table-striped table-bordered border-dark'>
    <thead>
        <tr>
            <th scope="col">Sr.No</th>
            <th scope="col">Name</th>
            <th scope="col">Work</th>
            <th scope="col">Phone No.</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
        <% 
            
            int count = 1;
            for (Worker worker : workerList) {%>
        <tr>
            <td><%=count%></td>
            <td><%=worker.getName()%></td>
            <td><%=worker.getRole()%></td>
            <td><%= worker.getPhone()%></td>
            <td>
                <a href="adminDashboard.jsp?workerId=<%=worker.getWid()%>" class="btn btn-danger border border-dark">Delete</a>
                <a href="updateWorker.jsp?id=<%=worker.getWid()%>" id="worUpdateBtn" class="btn btn-warning border border-dark">Update</a>
                <a href="specificWorker.jsp?id=<%=worker.getWid()%>"  class="btn btn-info border border-dark">More Details</a>
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

