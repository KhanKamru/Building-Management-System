<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.WorkerDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("logged") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
    WorkerDao wd = new WorkerDao();
    ResidentDao rd = new ResidentDao();
    if (request.getParameter("workerId") != null) {
        int id = Integer.parseInt(request.getParameter("workerId"));
        if (wd.deleteWorker(id)) {
            out.println(ResidentDao.htmlAndCss("success", "Deleted successfully"));
        }
    }
    if (request.getParameter("residentId") != null) {
        int id = Integer.parseInt(request.getParameter("residentId"));
        if (rd.deleteResident(id)) {
            out.println(ResidentDao.htmlAndCss("success", "Deleted successfully"));
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/forBootstarp.css"/>
        <title>Your Dashboard</title>
    </head>
    <body>
        <div class="container mt-3 mx-auto" style="width:75%">
            <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-primary mx-3 border border-dark" data-bs-toggle="modal" data-bs-target="#addResidentModal">Add resident</button>
                <button type="button" class="btn btn-primary mx-3 border border-dark" data-bs-toggle="modal"  data-bs-target="#publishNoticeModal">Publish Notice</button>                
                <button type="button" class="btn btn-primary mx-3 border border-dark" data-bs-toggle="modal"  data-bs-target="#addWorkerModal">Add worker</button>
                <button type="button" class="btn btn-primary mx-3 border border-dark" id="workerBtn">See Worker</button>
                <button type="button" class="btn btn-primary mx-3 border border-dark" id="residentBtn">See Resident</button>
                <button type="button" class="btn btn-primary mx-3 border border-dark" id="complaintBtn">Complaint</button>
                <button type="button" class="btn btn-primary mx-3 border border-dark" data-bs-toggle="modal" data-bs-target="#addManintenanceModal">Add Maintenance details</button>
            </div>
        </div>
        <div id="main" class="container-sm mt-4"></div>
        <div class="container-sm mt-5">
            <div class="form-group mt-2">
                <label for="exampleInputEmail">Search For Pending Maintenance</label>
                <input type="text" class="form-control mt-2 border border-dark"  placeholder="Enter Room Number" id="roomNum" list="preDefined">
                <datalist id="preDefined"><option value="All"></datalist>
            </div>
            <select class="form-select mt-2 border border-dark" aria-label="Default select example" id="month">
                <option selected>Open this select menu</option>
                <option value="all">All</option>
                <option value="january">January</option>
                <option value="february">February</option>
                <option value="march">March</option>
                <option value="april">April</option>
                <option value="may">May</option>
                <option value="june">June</option>
                <option value="july">July</option>
                <option value="august">August</option>
                <option value="september">September</option>
                <option value="october">October</option>
                <option value="november">November</option>
                <option value="december">December</option>
            </select>                 
            <input type="button" value="Search" id="maintDetail" class="btn btn-primary mt-2 border border-dark">
        </div>
        <!--Resident Modal -->
        <div class="modal fade" id="addResidentModal" tabindex="-1" aria-labelledby="addResident" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addResident">Add Resident</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="text-info">Password for residents will be Galaxy+Room number.Eg.Galaxy101.</p>
                        <form action="addResident" method="POST">
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Enter Resident Room Number:</label>
                                <input type="text" class="form-control mt-2"  aria-describedby="emailHelp" placeholder="Room Number" name="roomNum">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Residents Name:</label>
                                <input type="text" class="form-control mt-2" placeholder="Name" name="name">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Residents Phone Number :</label>
                                <input type="text" class="form-control mt-2" placeholder="Phone Number" name="phoneNum">
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>    


        <!--Worker Modal -->
        <div class="modal fade" id="addWorkerModal" tabindex="-1" aria-labelledby="addWorker" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addWorker">Add Worker</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="addWorker" method="POST" enctype="multipart/form-data">
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Enter Worker work :</label>
                                <input type="text" class="form-control mt-2"  aria-describedby="emailHelp" placeholder="work" name="work">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Worker Name:</label>
                                <input type="text" class="form-control mt-2" placeholder="Name" name="name">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Worker Phone Number :</label>
                                <input type="text" class="form-control mt-2" placeholder="Phone Number" name="phoneNum">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Worker Photo :</label>
                                <input type="file" class="form-control" placeholder="Phone Number" name="profile">
                            </div>                           
                            <button type="submit" class="btn btn-primary mt-2">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--maintenance Modal -->
        <div class="modal fade" id="addManintenanceModal" tabindex="-1" aria-labelledby="addMantenance" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addMantenance">Add Maintenance Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="addMaintenance" method="POST">
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Enter Room Number :</label>
                                <input type="text" class="form-control mt-2"  aria-describedby="emailHelp" placeholder="Room Number" name="roomNum">
                            </div>
                            <select class="form-select mt-2" aria-label="Default select example" name="column">
                                <option selected>Select Month</option>
                                <option value="january">January</option>
                                <option value="february">February</option>
                                <option value="march">March</option>
                                <option value="april">April</option>
                                <option value="may">May</option>
                                <option value="june">June</option>
                                <option value="july">July</option>
                                <option value="august">August</option>
                                <option value="september">September</option>
                                <option value="october">October</option>
                                <option value="november">November</option>
                                <option value="december">December</option>

                            </select>                 
                            <button type="submit" class="btn btn-primary mt-2">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Notice Modal -->
        <div class="modal fade" id="publishNoticeModal" tabindex="-1" aria-labelledby="publishNotice" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="publishNotice">Publish Notice</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="publishNotice" method="POST">
                            <p class="text-info">If you want to publish notice for any Specific resident then enter their room number or else notice will be publish for all resident.</p>
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Enter Room Number:</label>
                                <input type="text" class="form-control mt-2"  aria-describedby="emailHelp" placeholder="Room Num" name="roomNum">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Enter Title For Notice</label>
                                <input type="text" class="form-control mt-2"  aria-describedby="emailHelp" placeholder="Title" name="title">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Notice</label>
                                <textarea class="form-control mt-2" placeholder="Notice" name="notice"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>      
        <!<!-- worker Modal -->
        <div class="modal fade" id="addManintenanceModal" tabindex="-1" aria-labelledby="addWorker" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addWorker">Add Worker</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="addWorker" method="POST">
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail">Enter Worker work :</label>
                                <input type="text" class="form-control mt-2"  aria-describedby="emailHelp" placeholder="work" name="work">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Worker Name:</label>
                                <input type="text" class="form-control mt-2" placeholder="Name" name="name">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Worker Phone Number :</label>
                                <input type="text" class="form-control mt-2" placeholder="Phone Number" name="phoneNum">
                            </div>
                            <div class="form-group mt-2">
                                <label for="exampleInputPassword">Enter Worker Photo :</label>
                                <input type="file" class="form-control mt-2" placeholder="Phone Number" name="profile">
                            </div>                           
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
            var workerBtn = document.getElementById("workerBtn");
            var residentBtn = document.getElementById("residentBtn");
            var complaintBtn = document.getElementById("complaintBtn");
            var maintBtn = document.getElementById("maintDetail");

            residentBtn.addEventListener("click", () => {
                document.getElementById("main").innerHTML = "";
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 3)
                    {
                        document.getElementById("main").innerHTML = '<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>';
                    }
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("main").innerHTML = this.responseText;
                    }

                }
                xhttp.open("POST", "showResident.jsp", true);
                xhttp.send();
            }
            )

            workerBtn.addEventListener("click", () => {
                document.getElementById("main").innerHTML = "";
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 3)
                    {
                        document.getElementById("main").innerHTML = '<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>';
                    }
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("main").innerHTML = this.responseText;
                    }
                }
                xhttp.open("POST", "showWorker.jsp", true);
                xhttp.send();
            })

            complaintBtn.addEventListener("click", () => {
                document.getElementById("main").innerHTML = "";
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 3)
                    {
                        document.getElementById("main").innerHTML = '<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>';
                    }
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("main").innerHTML = this.responseText;
                    }

                }

                xhttp.open("POST", "showComplaint.jsp", true);
                xhttp.send();
            })


            const findResident = () => {
                var val = document.getElementById("resident").value;
                document.getElementById("main").innerHTML = "";
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 3)
                    {
                        document.getElementById("main").innerHTML = '<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>';
                    }
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("main").innerHTML = this.responseText;
                        console.log("fun")
                    }
                }
                console.log("fun")
                xhttp.open("GET", "showResident.jsp?id=" + val, true);
                xhttp.send();
            }

            const findWorker = () => {
                var val = document.getElementById("worker").value;
                console.log(val)
                document.getElementById("main").innerHTML = "";
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 3)
                    {
                        document.getElementById("main").innerHTML = '<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>';
                    }
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("main").innerHTML = this.responseText;
                        console.log("fun")
                    }
                }
                console.log("fun")
                xhttp.open("GET", "showWorker.jsp?id=" + val, true);
                xhttp.send();
            }
            maintBtn.addEventListener("click", () => {
                document.getElementById("main").innerHTML = "";
                var roomNo = document.getElementById("roomNum").value;
                var month = document.getElementById("month").value;
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 3)
                    {
                        document.getElementById("main").innerHTML = '<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>';
                    }
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("main").innerHTML = this.responseText;
                    }

                }

                xhttp.open("GET", "maintenanceDetails.jsp?month=" + month + "&roomNo=" + roomNo, true);
                xhttp.send();
            })

        </script>
        <script src="js/script.js"></script>

    </body>
</html>
