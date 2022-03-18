<%@page import="Com.BuildingManagementSystem.Data.Resident"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean allForMonth = false;
    boolean allForRoomNo = false;

    ResidentDao rd = new ResidentDao();
    int roomNum = 0;
    String month = null;
    ResultSet rs = null;
    if (!request.getParameter("month").equals("all")) {
        month = request.getParameter("month");
    } else {
        allForMonth = true;
    }
    if (!request.getParameter("roomNo").equals("All")) {
        roomNum = Integer.parseInt(request.getParameter("roomNo"));

    } else {
        allForRoomNo = true;
    }
    out.println("<h4>Result:</h4>");
    if (allForMonth && allForRoomNo) {
        out.println("<p class='text text-info'>Both values can't be all</p>");
    } else if (!allForMonth && allForRoomNo) {
        rs = rd.pendingMaintenance(month);
        if(!rs.isBeforeFirst()){out.println("No Result founud");}
        int count = 1;%>
<table class='table table-striped table-bordered border-dark'>
    <thead>
        <tr>
            <th scope="col">Sr.No</th>
            <th scope="col">Name</th>
            <th scope="col">Room No.</th>
            <th scope="col">Phone No.</th>
            <th scope="col">Payment in <%=month%></th>
        </tr>
    </thead>
    <tbody><%
        while (rs.next()) {
            Resident resident = rd.residentDetails(rs.getInt("room_no"), "room_no");%>
        <tr>
            <td><%=count%></td>
            <td><%=resident.getName()%></td>
            <td><%=resident.getRoomNum()%></td>
            <td><%=resident.getPhoneNum()%></td>
            <% String value = (rs.getBoolean(month)) ? "Paid" : "Not Paid";%>
            <td><%=value%></td>
        </tr>
        <%   count++;
            }
            out.println("</tbody></table>");
        } else if (!allForRoomNo && allForMonth) {
            rs = rd.pendingMaintenance(roomNum);
            if(!rs.isBeforeFirst()){out.println("No Result founud");}
            Resident resident = rd.residentDetails(roomNum, "room_no");
            int count = 1;
            String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};%>
    <b>Name :</b> <%= resident.getName()%> ,&nbsp;&nbsp;
    <b>Room No :</b> <%= resident.getRoomNum()%> ,&nbsp;&nbsp;
    <b>Phone Number :</b> <%= resident.getPhoneNum()%>&nbsp;&nbsp;
    <table class='table table-striped table-bordered border-dark mt-3'>
        <thead>
            <tr>
                <th scope="col">Sr.No</th>
                <th scope="col">Month</th>
                <th scope="col">Payment</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
                    for (int i = 0; i < months.length; i++) {
            %>
            <tr>
                <td><%=count%></td>
                <td><%=months[i]%></td>
                <% String value = (rs.getBoolean(months[i].toLowerCase())) ? "Paid" : "Not Paid";%>
                <td><%=value%></td>
            </tr>
            <%count++;
                    }
                }
                out.println("</tbody></table>");
            } else if (!allForMonth && !allForRoomNo) {
                rs = rd.pendingMaintenance(month, roomNum);
                if(!rs.isBeforeFirst()){out.println("No Result founud");}

                Resident resident = rd.residentDetails(roomNum, "room_no");%>
        <table class='table table-striped table-bordered border-dark'>
            <thead>
                <tr>
                    <th scope="col">Name:</th>
                    <th scope="col">Room No:</th>
                    <th scope="col">Phone No:</th>
                    <th scope="col">Payment in <%=month%></th>

                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {%>
                <tr>
                    <td><%= resident.getName()%></td>
                    <td><%= resident.getRoomNum()%></td>
                    <td><%= resident.getPhoneNum()%></td>
                    <% String value = (rs.getBoolean(month)) ? "Paid" : "Not Paid";%>
                    <td><%=value%></td>
                </tr>
                <%}
                        out.println("</tbody></table>");
                    }
                %>