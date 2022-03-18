<%@page import="Com.BuildingManagementSystem.Data.DeliveryPerson"%>
<%@page import="Com.BuildingManagementSystem.Data.DeliveryRecord"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.DeliveryPersonDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int roomNum=Integer.parseInt(request.getParameter("roomNum"));
    DeliveryPersonDao dpd=new DeliveryPersonDao();
    ArrayList<DeliveryRecord> drList=dpd.getRecord(roomNum, "room_no");
    if(!drList.isEmpty())
    {
    %>
    <h5>This is details of delivery boy and worker those who came to your home</h5>
    <table class='table table-striped table-bordered border-dark'>
    <thead>
        <tr>
            <th scope="col">Sr.No</th>
            <th scope="col">Name</th>
            <th scope="col">Phone No.</th>
            <th scope="col">Vehicle Num</th>
            <th scope="col">Company</th>
            <th scope="col">Entry Date and Time</th>
            <th scope="col">Exit Date and Time</th>
            <th scope="col">Place</th>
        </tr>
    </thead>
    <tbody>
    <%
       int count=1;
    for(DeliveryRecord dr : drList)
    {
    
        DeliveryPerson dp=dpd.dpDetails(dr.getDid());
        String company=dpd.getCompanyName(dp.getCompanyId());
        %>
        <tr>
            <td><%=count%></td>
            <td><%=dp.getName() %></td>
            <td><%=dp.getPhoneNum()%></td>
            <td><%=dp.getVehicleNum()%></td>
            <td><%=company%></td>
            <td><%=dr.getEnrty_time()%></td>
            <td><%=dr.getExit_time()%></td><%
            if(dr.isUpstairs())
            {
                out.println("<td>went upstairs for parcel</td>");
            }
            else{
                out.println("<td>kept parcel at reception</td>");
        }
        out.println("</tr>");
        count++;
    }
%>
    </tbody>
</table>
    <% }
else{
out.println("<p>No Record Found</p>");
}%>
