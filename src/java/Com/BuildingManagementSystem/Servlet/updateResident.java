/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.BuildingManagementSystem.Servlet;

import Com.BuidingManagemenrSystem.Dao.ResidentDao;
import Com.BuildingManagementSystem.Data.Resident;
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
@WebServlet("/updateResident")
public class updateResident extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        boolean emptyError = false;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        out.println("<head><link rel='stylesheet' href='css/style.css'></head>");
        String name = req.getParameter("name");
        int room = 0;
        int id = Integer.parseInt(req.getParameter("id"));
        String phone = req.getParameter("phoneNum");
        if (req.getParameter("roomNum").isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please enter room number"));
            emptyError = true;
        } else {
            room = Integer.parseInt(req.getParameter("roomNum"));
        }
        if (name.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please enter name of resident"));
            emptyError = true;
        }
        if (phone.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please enter phone number of resident"));
            emptyError = true;
        }
        if (emptyError == false) {
            //String pass="Galaxy"+room;
            ResidentDao rd = new ResidentDao();
            Resident resident = new Resident(id, room, name, phone);
            if (rd.updateResident(resident)) {
                out.println(ResidentDao.htmlAndCss("success", "Updated Successfully"));
            }
        }
        out.println("<script>setTimeout(()=>{window.location.href=history.back()},2000)</script>");
    }
}
