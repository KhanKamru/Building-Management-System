<%@page import="Com.BuildingManagementSystem.Data.Worker"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.WorkerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    WorkerDao wd = new WorkerDao();
    int id = Integer.parseInt(request.getParameter("id"));
    Worker worker = wd.workerDetails(id);
%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Know about <%= worker.getName()%></title>
    </head>
    <body>

        <div class="container mt-4 mx-auto">
            <div class="row">
                <div class="col">
                    <img src='img/<%=worker.getProfile()%>' class="rounded float-start me-2" alt="Profile Pic" width="500" height="500">
                </div>
                <div class="col mt-4"> 
                    <b>Name : </b><p><%=worker.getName()%></p>
                    <b>Phone Number : </b><p><%=worker.getPhone()%></p>
                    <b>Role : </b><p><%=worker.getRole()%></p>
                </div>
            </div>
                <div class="mx-auto mt-5" style="width:max-content">
                <a href="adminDashboard.jsp">Go to Dashboard</a>
            </div>
        </div>
    </body>
</html>