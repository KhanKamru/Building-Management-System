/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Com.BuildingManagementSystem.Servlet;

import Com.BuidingManagemenrSystem.Dao.ResidentDao;
import Com.BuidingManagemenrSystem.Dao.WorkerDao;
import Com.BuildingManagementSystem.Data.Worker;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/addWorker")
@MultipartConfig
public class addWorker extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        boolean emptyError = false;
        boolean isValidExtensionError = false;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        out.println("<head><link rel='stylesheet' href='css/style.css'></head>");
        String name = req.getParameter("name");
        String phone = req.getParameter("phoneNum");
        String role = req.getParameter("work");
        Part part = req.getPart("profile");
        String fileName = part.getSubmittedFileName();
        String[] validFileType = {"jpg", "jpeg", "png", "gif", "jfif"};
        if (fileName.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please upload file"));
            emptyError = true;
        }
        if (fileName.isEmpty() == false) {
            String extension = part.getContentType().replace("image/", "").trim();
            for (String ex : validFileType) {
                if (ex.equals(extension)) {
                    isValidExtensionError = false;
                    break;
                }
            }
        }
        if (name.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please enter name of resident"));
            emptyError = true;
        }
        if (phone.isEmpty()) {
            out.println(ResidentDao.htmlAndCss("warning", "Please enter phone number of resident"));
            emptyError = true;
        }
        InputStream is = part.getInputStream();
        byte[] data = new byte[is.available()];
        int example = is.read(data);
        String path = req.getRealPath("/") + "img" + File.separator + fileName;
        if (emptyError == false && isValidExtensionError == false) {
            Worker worker = new Worker(name, phone, role, fileName);
            WorkerDao wd = new WorkerDao();
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(data);
            fos.close();
            if (wd.addWorker(worker)) {
                out.println(ResidentDao.htmlAndCss("success", "Worker Added Successfully"));
            }
        }
        out.println("<script>setTimeout(()=>{window.location.href=history.back()},2000)</script>");
    }
}
