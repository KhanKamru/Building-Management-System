<%@page import="Com.BuildingManagementSystem.Data.Worker"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.WorkerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    WorkerDao wd = new WorkerDao();
    Worker worker = wd.workerDetails(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update workers details</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
    <center><h6 class="mt-5">Update Worker's Details<h6></center>
                <div class="container-sm mt-5">
                    <form action="updateWorker" method="POST" enctype="multipart/form-data">
                        <p class="text-info">If you don't want to update profile don't upload anything it will be same.</p>
                        <div class="form-group mt-2">
                            <label for="exampleInputEmail">Change Worker work :</label>
                            <input type="text" class="form-control mt-2 border border-dark"  aria-describedby="emailHelp" placeholder="work" name="work" value="<%=worker.getRole()%>">
                        </div>
                        <div class="form-group mt-2">
                            <label for="exampleInputPassword">Change Worker Name:</label>
                            <input type="text" class="form-control mt-2 border border-dark" placeholder="Name" name="name" value="<%=worker.getName()%>" >
                        </div>
                        <div class="form-group mt-2">
                            <label for="exampleInputPassword">Change Worker Phone Number :</label>
                            <input type="text" class="form-control mt-2 border border-dark" placeholder="Phone Number" name="phoneNum" value="<%=worker.getPhone()%>">
                        </div>
                        <div class="form-group mt-2">
                            <label for="exampleInputPassword">Enter Worker Photo :</label>
                            <input type="file" class="form-control mt-2" name="profile">
                        </div> 
                        <input type="hidden" value="<%=id%>" name="id">
                        <button type="submit" class="btn btn-primary mt-2 mb-3 border border-dark">Submit</button>
                    </form>
                        <a href="adminDashboard.jsp">Go to Dashboard</a>
                </div>
                </body>
                </html>
