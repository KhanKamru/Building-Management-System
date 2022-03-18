/*/
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.BuildingManagementSystem.Servlet;

import Com.BuidingManagemenrSystem.Dao.ResidentDao;
import Com.BuildingManagementSystem.Data.Unavaibility;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kamru
 */
@WebServlet("/unavaibility")
public class unavaibility extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        out.println("<head><link rel='stylesheet' href='css/style.css'></head>");
        String from = req.getParameter("from");
        String to = req.getParameter("to");
        String msg = null;
        int uid = Integer.parseInt(req.getParameter("roomNo"));
        boolean emptyError = false;
        Date toDate = null;
        Date fromDate = null;
        if (!req.getParameter("msg").isEmpty()) {
            msg = req.getParameter("msg");
        }
        ResidentDao rd = new ResidentDao();
        if (from.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Date"));
            emptyError = true;
        } else {
            fromDate = Date.valueOf(from);
        }
        if (to.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Date"));
            emptyError = true;

        } else {
            toDate = Date.valueOf(to);
        }
        Date currentDate = new Date(System.currentTimeMillis());
        if (emptyError == false) {
            if (!(toDate.after(fromDate) && toDate.after(currentDate))) {
                out.println(ResidentDao.htmlAndCss("warning", "Please Enter Correct date"));
                emptyError = true;
            }
        }
        if (emptyError == false) {
            Unavaibility un = new Unavaibility(uid, toDate, fromDate, msg);
            if (rd.addUnavaibility(un)) {
                out.println(ResidentDao.htmlAndCss("success", "Submitted Successfully"));
            }
        }
        out.println("<script>setTimeout(()=>{window.location.href=history.back()},2000)</script>");
    }
}
