<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Com.BuildingManagementSystem.Data.DeliveryRecord"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.DeliveryPersonDao"%>
<%@page import="Com.BuildingManagementSystem.Data.DeliveryPerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("guardLogged") == null) {
        response.sendRedirect("guardLogin.jsp");
        return;
    }
    DeliveryPersonDao dpd = new DeliveryPersonDao();
    DeliveryPerson dp = null;
    String phoneNum = null;
    int isNullError = 0;
    int dpi = 0;
    boolean isInserted = false;
    if (request.getParameter("phoneNum") != null) {
        phoneNum = request.getParameter("phoneNum");
        if (!phoneNum.isEmpty()) {
            dp = dpd.dpDetails(phoneNum);
            if (dp == null) {
                isNullError = 1;
            } else {
                isNullError = 2;
                dpi = dp.getId();
            }

        } else {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter phone number."));
        }
    }
    if (request.getParameter("insertData") != null) {
        ResultSet rs = null;
        Integer companyId = null;
        String vehicleNum = null;
        String name = request.getParameter("name");
        String phoneNo = request.getParameter("phoneN");
        vehicleNum = request.getParameter("vehicleNum");
        String companyName = request.getParameter("company").toLowerCase();
        if (name.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Name."));
        } else {
            if (!companyName.isEmpty()) {
                rs = dpd.getCompanyName(companyName);
                if (!rs.isBeforeFirst()) {
                    if (dpd.insertCompany(companyName)) {
                        rs = dpd.getCompanyName(companyName);
                        while (rs.next()) {
                            companyId = rs.getInt("id");
                        }
                    }
                }
                while (rs.next()) {
                    companyId = rs.getInt("id");
                }
            }

            DeliveryPerson dp1 = new DeliveryPerson(companyId, name, phoneNo, vehicleNum);
            if (dpd.insertDetails(dp1)) {
                isNullError = 2;
                isInserted = true;
                dp = dpd.dpDetails(phoneNo);
                dpi = dp.getId();
            }
        }
    }

    if (request.getParameter("insertRecord") != null) {
        String roomNo = request.getParameter("roomNo");
        String upstair = request.getParameter("upstairs");
        int id = Integer.parseInt(request.getParameter("did"));
        DeliveryRecord dr = new DeliveryRecord(id, Integer.parseInt(roomNo), Boolean.parseBoolean(upstair));
        if (dpd.insertRecord(dr)) {
            out.println(ResidentDao.htmlAndCss("success", "Inserted Record Successsfully"));
            isNullError = 3;
        }
    }
    if (request.getParameter("exit") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        if (dpd.updateExitTime(id)) {
            out.println(ResidentDao.htmlAndCss("success", "Exit Done"));
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
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/forBootstarp.css"/>
    </head>
    <body>
        <div class="container-fluid mt-4">
            <div class="mb-3">
                <input type="name" class="form-control border border-dark" aria-describedby="emailHelp" id="value" placeholder="Enter name or vehicle Number or phone number to search delivery person record">
            </div>
            <button id="search" class="btn btn-primary border border-dark">Search</button>
        </div>

        <div class="container-sm mt-5">
            <button type="button" class="btn btn-primary border border-dark" data-bs-toggle="modal" data-bs-target="#makeEntryModal">Make Delivery person's or worker's entry</button>
        </div>

        <div class="modal fade" id="makeEntryModal" tabindex="-1" aria-labelledby="addResident" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addResident">Make Entry</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Enter Phone Number of Worker</label>
                                <input type="name" class="form-control"  aria-describedby="emailHelp" name="phoneNum" id="phone_num" >
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <%
            if (isNullError == 1) {%>
        <div class="container-sm mt-3">
            <h5>This Worker's/Delivery person's data does't exit so enter his/her data.</h5>
            <form method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Enter Name of Worker/Delivery Person</label>
                    <input type="text" class="form-control border border-dark"  aria-describedby="emailHelp" name="name" placeholder="Name">
                </div>
                <input type="hidden" value="<%=phoneNum%>" name="phoneN">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Enter Company of Worker/Delivery Person</label>
                    <input type="text" class="form-control border border-dark"  aria-describedby="emailHelp" name="company" list="companyList" placeholder="Company">
                    <datalist id="companyList">
                        <%
                            ArrayList<String> companyList = dpd.getAllCompany();
                            for (String company : companyList) {
                        %>
                        <option value="<%= company%>">
                            <% }%>
                    </datalist>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Enter vehicle Number of Worker/Delivery Person</label>
                    <input type="text" class="form-control border border-dark"  aria-describedby="emailHelp" name="vehicleNum" placeholder="Vehicle Number">
                </div>
                <button type="submit" class="btn btn-primary border border-dark" name="insertData">Submit</button>
            </form>
        </div>
        <%} else if (isNullError == 2) {
            out.println("<div class='container-sm mt-3'>");
            if (isInserted) {
                out.println("<h5>Recored Inserted</h5>");
            } else {
                out.println("<h5>Record already Exist</h5>");
            }
        %>

        <p>Now only Enter Room Number :</p>
        <form method="POST">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Enter Room Number of Resident</label>
                <input type="name" class="form-control border border-dark"  aria-describedby="emailHelp" name="roomNo" id="roomInput">
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline1" name="upstairs" class="custom-control-input" value="true">
                <label class="custom-control-label" for="customRadioInline1">Went Upstairs</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="customRadioInline2" name="upstairs" class="custom-control-input" value="false">
                <label class="custom-control-label" for="customRadioInline2">Kept Parcel at Reception</label>
            </div>
            <input type="hidden" name="did" value="<%=dpi%>">
            <button type="submit" class="btn btn-primary mt-2 border border-dark" name="insertRecord">Submit</button>
        </form>
    </div>
    <% }%>
    <div id="main" class="container-sm mt-4"></div>

    <div class="container-sm d-flex">
        <%
            Date currentDate = new Date(System.currentTimeMillis());
            ArrayList<DeliveryRecord> drList = dpd.getRecord(currentDate);
            for (DeliveryRecord dr : drList) {
                DeliveryPerson dp2 = dpd.dpDetails(dr.getDid());
                String company = dpd.getCompanyName(dp2.getCompanyId());
        %>
        <div class="card mx-2" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title"><%=dp2.getName()%></h5>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><b>Phone Num:</b><%=dp2.getPhoneNum()%> </li>
                <li class="list-group-item"><b>Vehicle Num:</b><%=dp2.getVehicleNum()%></li>
                <li class="list-group-item"><b>Company Name:</b><%=company%></li>
                <li class="list-group-item"><b>Entry Timing:</b><%=dr.getEnrty_time()%></li>                </ul>
            <div class="card-body">
                <form method="POST">
                    <input type="hidden" value="<%=dr.getId()%>" name="id">
                    <button type="submit" class="btn btn-danger" name="exit">Mark Out/Exit</button>
                </form>
            </div>
        </div>
        <% }%>
    </div>
    <script>
        if (document.getElementById("roomInput") != null)
        {
            var roomNo = document.getElementById("roomInput");
            roomNo.addEventListener("change", () => {
                document.getElementById("main").innerHTML = "";
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("main").innerHTML = this.responseText;
                    }
                }
                xhttp.open("GET", "UnavaibilityDetails.jsp?roomNo=" + roomNo.value, true);
                xhttp.send();
            }
            )
        }


        var searchBtn = document.getElementById("search");
        searchBtn.addEventListener("click", () => {
            var val = document.getElementById("value").value;
            document.getElementById("main").innerHTML = "";
            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200)
                {
                    document.getElementById("main").innerHTML = this.responseText;
                }
            }
            xhttp.open("GET", "deliveryPersonRecord.jsp?value=" + val, true);
            xhttp.send();
        }
        )
    </script>
    <script src="js/script.js"></script>

</body>
</html>
