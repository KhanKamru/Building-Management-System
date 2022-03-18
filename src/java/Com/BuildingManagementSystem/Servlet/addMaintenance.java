/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.BuildingManagementSystem.Servlet;

import Com.BuidingManagemenrSystem.Dao.ResidentDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addMaintenance")
public class addMaintenance extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        ResidentDao rd = new ResidentDao();
        boolean emptyError = false;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        out.println("<head><link rel='stylesheet' href='css/style.css'></head>");
        int roomNum = 0;
        if (req.getParameter("roomNum").isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Room Number"));
            emptyError = true;
        } else {
            roomNum = Integer.parseInt(req.getParameter("roomNum"));
        }
        String column = req.getParameter("column");
        if (column.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Select Month"));
            emptyError = true;
        }
        if (emptyError == false) {
            if (rd.updateMaintenanceDetail(roomNum, column)) {
                out.println(ResidentDao.htmlAndCss("success", "Done"));
            }
        }
        out.println("<script>setTimeout(()=>{window.location.href=history.back()},2000)</script>");

    }
}
