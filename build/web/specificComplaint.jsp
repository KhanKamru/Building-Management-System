<%-- 
    Document   : specificComplaint
    Created on : 02-Mar-2022, 7:24:16 pm
    Author     : kamru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Com.BuidingManagemenrSystem.Dao.ResidentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResidentDao rd = new ResidentDao();
    int id = Integer.parseInt(request.getParameter("id"));
    ResultSet rs = rd.specificComplaint(id);

%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container-sm">
            <% while (rs.next()) {%>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Complaint from <%=rs.getString("name")%></h5>
                    <h5 class="card-title">Room NO.<%=rs.getInt("room_no")%></h5>
                    <p class="card-text"><%=rs.getString("complaint_text")%></p>
                    <p class="card-text"><%=rs.getString("phone_num")%></p>
                    <p class="card-text"><small class="text-muted"><%=rs.getTimestamp("ctime")%></small></p>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
