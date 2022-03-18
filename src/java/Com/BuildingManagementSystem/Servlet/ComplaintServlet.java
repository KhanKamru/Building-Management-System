/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.BuildingManagementSystem.Servlet;

import Com.BuidingManagemenrSystem.Dao.ResidentDao;
import Com.BuildingManagementSystem.Data.Complaint;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kamru
 */
@WebServlet("/complaint")
public class ComplaintServlet extends HttpServlet {

     

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        boolean emptyError = false;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        out.println("<head><link rel='stylesheet' href='css/style.css'></head>");
        ResidentDao rd = new ResidentDao();
        String complaintText = req.getParameter("complaint");
        int id = Integer.parseInt(req.getParameter("id"));
        if (complaintText.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Complaint"));
            emptyError = true;
        }
        if (emptyError == false) {
            Complaint com = new Complaint(id, complaintText);
            if (rd.doComplaint(com)) {
                out.println(ResidentDao.htmlAndCss("success", "Complaint Successfully Added"));
            } else {
                out.println(ResidentDao.htmlAndCss("success", "Complaint not Added"));

            }
        }
        out.println("<script>setTimeout(()=>{window.location.href=history.back},2000)</script>");

    }

}
