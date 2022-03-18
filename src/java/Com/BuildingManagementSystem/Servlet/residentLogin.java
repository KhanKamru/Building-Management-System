/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.BuildingManagementSystem.Servlet;

import Com.BuidingManagemenrSystem.Dao.ResidentDao;
import Com.BuildingManagementSystem.Data.Resident;
import Com.BuildingManagementSystem.Data.Worker;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/residentLogin")
public class residentLogin extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html;charset=UTF-8");
        boolean emptyError = false;
        PrintWriter out = res.getWriter();
        out.println("<head><link rel='stylesheet' href='css/style.css'></head>");
        String name = req.getParameter("name");
        String pass = req.getParameter("pass");
        ResidentDao rd = new ResidentDao();
        HttpSession session = req.getSession();
        if (name.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please enter your name"));
            emptyError = true;
        }
        if (pass.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please enter your password"));
            emptyError = true;
        }
        if (emptyError == false) {
            try {
                ResultSet rs = rd.loginCheck(name, pass);
                while (rs.next()) {
                    Resident resident = new Resident(rs.getInt("id"), rs.getInt("room_no"), rs.getString("name"), rs.getString("phone_num"));
                    session.setAttribute("resident", resident);
                    res.sendRedirect("residentDashboard.jsp");
                }
                if (!rs.isBeforeFirst()) {
                    out.println(ResidentDao.htmlAndCss("warning", "Please Enter Correct data"));
                    req.getRequestDispatcher("residentLogin.jsp").include(req, res);

                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } else {
            req.getRequestDispatcher("residentLogin.jsp").include(req, res);
        }

    }
}
