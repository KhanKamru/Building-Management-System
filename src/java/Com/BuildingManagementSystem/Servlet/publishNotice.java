/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.BuildingManagementSystem.Servlet;

import Com.BuidingManagemenrSystem.Dao.ResidentDao;
import Com.BuildingManagementSystem.Data.Notice;
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
@WebServlet("/publishNotice")
public class publishNotice extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        boolean emptyError = false;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        out.println("<head><link rel='stylesheet' href='css/style.css'></head>");
        String title = req.getParameter("title");
        String body = req.getParameter("notice");
        int roomNum = 0;
        if (!req.getParameter("roomNum").isEmpty()) {
            roomNum = Integer.parseInt(req.getParameter("roomNum"));
        }
        if (body.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please Enter Notice"));
            emptyError = true;
        }
        if (emptyError == false) {
            ResidentDao rd = new ResidentDao();
            Notice notice = new Notice(title, body, roomNum);
            if (rd.addNotice(notice)) {
                out.println(ResidentDao.htmlAndCss("success", "Notice Added Successfully"));
            }
        }
        out.println("<script>setTimeout(()=>{window.location.href=history.back()},2000)</script>");

    }

}
