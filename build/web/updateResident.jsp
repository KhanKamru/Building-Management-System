<%@page import="Com.BuildingManagementSystem.Data.Resident"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ResidentDao rd = new ResidentDao();
    Resident resident = rd.residentDetails(id, "id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update details of Resident</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
    <center><h6 class="mt-5">Update Residents's Details<h6></center>

                <div class="container-sm mt-5">
                    <form action="updateResident" method="POST">
                        <div class="form-group mt-2">
                            <label for="exampleInputEmail">Change Resident Room Number:</label>
                            <input type="text" class="form-control mt-2 border border-dark"  aria-describedby="emailHelp" placeholder="Room Number" name="roomNum" value="<%=resident.getRoomNum()%>">
                        </div>
                        <div class="form-group mt-2">
                            <label for="exampleInputPassword">Change Residents Name:</label>
                            <input type="text" class="form-control mt-2 border border-dark" placeholder="Name" name="name" value="<%=resident.getName()%>">
                        </div>
                        <div class="form-group mt-2">
                            <label for="exampleInputPassword">Change Residents Phone Number :</label>
                            <input type="text" class="form-control mt-2 border border-dark" placeholder="Phone Number" name="phoneNum" value="<%=resident.getPhoneNum()%>">
                        </div>
                        <input type="hidden" value="<%=id%>" name="id">
                        <button type="submit" class="btn btn-primary mt-2 mb-3 border border-dark">Submit</button>
                    </form>
                    <a href="adminDashboard.jsp">Go to Dashboard</a>
                </div>
                </body>
                </html>
