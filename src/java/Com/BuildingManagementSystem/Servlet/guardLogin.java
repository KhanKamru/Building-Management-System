/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.BuildingManagementSystem.Servlet;

import Com.BuidingManagemenrSystem.Dao.ResidentDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kamru
 */
@WebServlet("/guardLogin")
public class guardLogin extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        boolean emptyError = false;
        res.setContentType("text/html;charset=UTF-8");
        HttpSession ses = req.getSession();
        PrintWriter out = res.getWriter();
        out.println("<head><link rel='stylesheet' href='css/style.css'></head>");
        String uname = req.getParameter("uname");
        String pass = req.getParameter("password");
        if (uname.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Your Username"));
            emptyError = true;
        }
        if (pass.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Your Password"));
            emptyError = true;
        }

        if (emptyError == false) {
            if (uname.equals("Guard") && pass.equals("12345678")) {
                ses.setAttribute("guardLogged", "done");
                res.sendRedirect("GuardDashboard.jsp");
            } else {
                out.println(ResidentDao.htmlAndCss("warning", "Please Enter Correct Data"));
            }
        }
        out.println("<script>setTimeout(()=>{window.location.href=history.back()},2000)</script>");
    }
}
