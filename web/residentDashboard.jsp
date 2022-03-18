<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Com.BuildingManagementSystem.Data.Notice"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page import="Com.BuildingManagementSystem.Data.Resident"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Resident resident = (Resident) session.getAttribute("resident");
    if (resident == null) {
        response.sendRedirect("residentLogin.jsp");
        return;
    }
    ResidentDao rd = new ResidentDao();
    ArrayList<Notice> noticeList = rd.allNotice();
    ArrayList<Notice> sNotices = rd.specifiNotices(resident.getRoomNum());
    Date currentDate = new Date(System.currentTimeMillis());
    rd.deleteUnavaibility(resident.getRoomNum(), currentDate);
    if (request.getParameter("change") != null) {
        boolean emptyError = false;
        String pass = request.getParameter("pass");
        String cPass = request.getParameter("cpass");
        if (pass.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Password"));
            emptyError = true;
        }
        if (pass.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Confirm Password"));
            emptyError = true;
        }
        if (emptyError == false) {
            if (pass.equals(cPass)) {
                if (rd.updatePassword(pass, resident.getRid())) {
                    out.println(ResidentDao.htmlAndCss("success", "Password Changed"));
                }
            } else {
                out.println(ResidentDao.htmlAndCss("warning", "Password and confirm password must be same"));
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <title>Your Dashboard</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/forBootstarp.css"/>
    </head>
    <body>
        <div class="container-sm mx-auto mt-4">
            <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-primary mx-3 border border-dark" data-bs-toggle="modal" data-bs-target="#complaintModal">DO Complaint</button>
                <button type="button" class="btn btn-primary mx-3 border border-dark" data-bs-toggle="modal"  data-bs-target="#unavaibility">Post about Unavaibility</button>
                <button type="button" class="btn btn-primary mx-3 border border-dark" id="search">See Delivery boy details</button>
                <button type="button" class="btn btn-primary mx-3 border border-dark" data-bs-toggle="modal" data-bs-target="#credentialModal">Change Password</button>
            </div>
        </div>
        <div id="main" class="mt-4 mx-auto" style="width:80%;"></div>                   
        <!<!-- Notice Section -->

        <div class="container-sm mt-5">
            <h5>Specially Notice for You</h5>

            <%
                if (sNotices.isEmpty()) {
                    out.println("<p class='mt-2'>No Notice For You</p>");
                }
                for (Notice notice : sNotices) {%>
            <div class="card">
                <div class="card-header">
                    <%= notice.getHeading()%>
                </div>
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <p>
                            <%= notice.getBody()%>
                            <a href="residentDashboard.jsp"></a>
                        </p>
                        <footer class="blockquote-footer">
                            <%= notice.getnTime()%>
                        </footer>
                    </blockquote>
                </div>
            </div>
            <% }%>
        </div>



        <div class="container-sm mt-5">
            <h5>Notice for All Resident</h5>
            <%
                if (noticeList.isEmpty()) {
                    out.println("<p class='mt-2'>No Notice</p>");
                }
                for (Notice notice : noticeList) {%>
            <div class="card">
                <div class="card-header">
                    <%= notice.getHeading()%>
                </div>
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <p>
                            <%= notice.getBody()%>
                            <a href="residentDashboard.jsp"></a>
                        </p>
                        <footer class="blockquote-footer">
                            <%= notice.getnTime()%>
                        </footer>
                    </blockquote>
                </div>
            </div>
            <% }%>
        </div>


        <!<!-- complaint-modal -->
        <div class="modal fade" id="complaintModal" tabindex="-1" aria-labelledby="complaint" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="complaint">Complaint</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="complaint" method="POST">
                            <div class="form-group">
                                <label for="exampleInputEmail">Write Complaint</label>
                                <textarea class="form-control" id="floatingTextarea2" style="height: 100px" name="complaint"></textarea>
                            </div>
                            <input type="hidden" value="<%=resident.getRid()%>" name="id">
                            <button type="submit" class="btn btn-primary mt-2">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div> 


        <!<!-- change-modal -->
        <div class="modal fade" id="credentialModal" tabindex="-1" aria-labelledby="complaint" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="credential">Change Password</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form  method="POST">
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Enter New Password:</label>
                                <input type="password" class="form-control mt-1" placeholder="Password" name="pass">
                            </div>
                            <div class="form-group mt2">
                                <label for="exampleInputEmail">Enter Confirm Password:</label>
                                <input type="password" class="form-control mt-1" placeholder="Confirm Password" name="cpass">
                            </div>
                            <button type="submit" class="btn btn-primary mt-2" name="change">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>                             


        <!-- unavaibility Modal -->
        <div class="modal fade" id="unavaibility" tabindex="-1" aria-labelledby="unavailable" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="unavailable">Unavaibility</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="unavaibility" method="POST">
                            <input type="hidden" value="<%=resident.getRid()%>" name="uid">
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Input date from which you will not be available</label>
                                <input type="date" class="form-control mt-1" placeholder="Name" name="from">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Input date to which you will not be available</label>
                                <input type="date" class="form-control mt-1" placeholder="Name" name="to">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Any Message for Guard(Optional)</label>
                                <textarea class="form-control mt-1" id="floatingTextarea2" style="height: 100px" name="msg"></textarea>
                            </div>
                            <input type="hidden" value="<%=resident.getRoomNum()%>" name="roomNo">
                            <button type="submit" class="btn btn-primary mt-2">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var searchBtn = document.getElementById("search");
            searchBtn.addEventListener("click", () => {
                document.getElementById("main").innerHTML = " ";
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("main").innerHTML = this.responseText;
                    }
                }
                xhttp.open("GET", "dpDetails.jsp?roomNum=" +<%=resident.getRoomNum()%>, true);
                xhttp.send();
            }
            )
        </script>
        <<script src="js/script.js"></script>
    </body>
</html>
