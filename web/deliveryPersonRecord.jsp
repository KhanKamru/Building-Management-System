<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page import="Com.BuildingManagementSystem.Data.DeliveryRecord"%>
<%@page import="Com.BuildingManagementSystem.Data.DeliveryPerson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.DeliveryPersonDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean emptyError = false;
    String value = request.getParameter("value");
    if (value.isEmpty()) {
        out.println("Please Enter Value");
        emptyError = true;
    }
    if (emptyError == false) {
        DeliveryPersonDao dpd = new DeliveryPersonDao();
        ArrayList<DeliveryPerson> dpList = dpd.getAllDeliveryPersons(value);
        ArrayList<DeliveryRecord> drList = null;
        if (dpList.isEmpty()) {
            out.println("No Result Found.");
        }
        for (DeliveryPerson dp : dpList) {
            drList = dpd.getRecord(dp.getId(), "did");
            String company = dpd.getCompanyName(dp.getCompanyId());
%>
<h5 class="mt-3">Details of Delivery Person and Worker</h5>
<b>Name :</b> <%= dp.getName()%> ,&nbsp;&nbsp;
<b>Phone Number :</b> <%= dp.getPhoneNum()%>&nbsp;&nbsp;
<b>Vehicle Number :</b> <%= dp.getVehicleNum()%> ,&nbsp;&nbsp;
<b>Company :</b> <%=company%>
<table class='table table-striped table-bordered border-dark'>
    <thead>
        <tr>
            <th scope="col">Sr.No</th>
            <th scope="col">Room No.</th>
            <th scope="col">Entry Date and Time</th>
            <th scope="col">Exit Date and Time</th>
            <th scope="col">Place</th>
        </tr>
    </thead>
    <tbody>

        <%
                    int count = 1;
                    for (DeliveryRecord dr : drList) {
                        String month = (dr.isUpstairs()) ? "Went upstairs" : "kept parcel at reception";
                        out.println("<tr>");
                        out.println("<td>" + count + "</td>");
                        out.println("<td>" + dr.getRoom_num() + "</td>");
                        out.println("<td>" + dr.getEnrty_time() + "</td>");
                        out.println("<td>" + dr.getExit_time() + "</td>");
                        out.println("<td>" + month + "</td>");
                        out.println("</tr>");
                        count++;
                    }
                    out.println("</tbody></table>");
                }
            }
        %>