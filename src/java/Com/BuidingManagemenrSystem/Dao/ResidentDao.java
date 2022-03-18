/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuidingManagemenrSystem.Dao;

import Com.BuildingManagementSystem.Data.Complaint;
import Com.BuildingManagementSystem.Data.Notice;
import Com.BuildingManagementSystem.Data.Resident;
import Com.BuildingManagementSystem.Data.Unavaibility;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ResidentDao {

    public Connection con = Connect.makeConnection();

    public boolean addResident(Resident resident) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into residents (room_no,name,phone_num,pass) values(?,?,?,?)");
            pstmt.setInt(1, resident.getRoomNum());
            pstmt.setString(2, resident.getName());
            pstmt.setString(3, resident.getPhoneNum());
            pstmt.setString(4, resident.getPass());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
    private ArrayList<Resident> residentsList = new ArrayList<>();

    public ArrayList<Resident> showAllResidents() {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from residents");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Resident worker = new Resident(rs.getInt("id"), rs.getInt("room_no"), rs.getString("name"), rs.getString("phone_num"));
                residentsList.add(worker);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return residentsList;
    }

    public boolean deleteResident(int id) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("delete from residents where id=?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public boolean updateResident(Resident resident) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("update residents set room_no=?,name=?,phone_num=? where id=?");
            pstmt.setInt(1, resident.getRoomNum());
            pstmt.setString(2, resident.getName());
            pstmt.setString(3, resident.getPhoneNum());
            pstmt.setInt(4, resident.getRid());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public ResultSet loginCheck(String name, String pass) {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from residents where name=? and pass=?");
            pstmt.setString(1, name);
            pstmt.setString(2, pass);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public boolean doComplaint(Complaint complaint) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into complaint (uid,complaint_text) values(?,?)");
            pstmt.setInt(1, complaint.getUid());
            pstmt.setString(2, complaint.getComplaintText());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public Resident residentDetails(int value,String column) {
        Resident resident = null;
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from residents where "+column+"=?");
            System.out.println("select * from residents where "+column+" = ?");
            pstmt.setInt(1, value);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                resident = new Resident(rs.getInt("id"), rs.getInt("room_no"), rs.getString("name"), rs.getString("phone_num"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resident;
    }

    public boolean addNotice(Notice notice) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into notice (notice_heading,notice_text,room_no) values(?,?,?)");
            pstmt.setString(1, notice.getHeading());
            pstmt.setString(2, notice.getBody());
            pstmt.setInt(3, notice.getRoomNum());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
    private ArrayList<Notice> noticeList = new ArrayList<>();

    public ArrayList<Notice> allNotice() {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from notice where room_no=0");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Notice notice = new Notice(rs.getInt("id"), rs.getString("notice_heading"), rs.getString("notice_text"), rs.getTimestamp("ntime"), rs.getInt("room_no"));
                noticeList.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return noticeList;
    }

    public ResultSet allComplaints() {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select substring(complaint_text,1,30),name,complaint.id from complaint join residents on uid=residents.id");
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet specificComplaint(int id) {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select complaint_text,ctime,room_no,name,phone_num,complaint.id from complaint join residents on uid=residents.id where complaint.id=?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    private ArrayList<Notice> sNoticeList = new ArrayList<>();

    public ArrayList<Notice> specifiNotices(int roomNo) {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from notice where room_no=?");
            pstmt.setInt(1, roomNo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Notice notice = new Notice(rs.getInt("id"), rs.getString("notice_heading"), rs.getString("notice_text"), rs.getTimestamp("ntime"), rs.getInt("room_no"));
                sNoticeList.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sNoticeList;
    }

    public boolean addUnavaibility(Unavaibility un) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into unavaibility(room_no,to_time,from_time,msg) values(?,?,?,?)");
            pstmt.setInt(1, un.getRoomNum());
            pstmt.setDate(2, un.getToDate());
            pstmt.setDate(3, un.getFromDate());
            pstmt.setString(4, un.getMsg());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public Unavaibility unavaibilityChecking(int roomNo) {
        ResultSet rs = null;
        Unavaibility un = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from unavaibility where room_no=?");
            pstmt.setInt(1, roomNo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                un = new Unavaibility(rs.getInt("room_no"), rs.getDate("to_time"), rs.getDate("from_time"), rs.getString("msg"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return un;
    }

    public void deleteUnavaibility(int id, Date current) {
        try {
            PreparedStatement pstmt = con.prepareStatement("delete from unavaibility where id=? and to_time<?");
            pstmt.setInt(1, id);
            pstmt.setDate(2, current);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    ArrayList<Resident> rList = new ArrayList<>();

    public ArrayList<Resident> fetchResidedntDetails(Object value) {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from residents where name like '%" + value + "%' or phone_num like '%" + value + "%' or room_no like '%" + value + "%'");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Resident resident = new Resident(rs.getInt("id"), rs.getInt("room_no"), rs.getString("name"), rs.getString("phone_num"));
                rList.add(resident);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rList;
    }

    public boolean updateMaintenanceDetail(int roomNum, String column) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("update maintenance_table set " + column + " =1 where room_no=?");
            pstmt.setInt(1, roomNum);
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public ResultSet pendingMaintenance(String column, int roomNum) {
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement("select " + column + " from maintenance_table where room_no=?");
            pstmt.setInt(1, roomNum);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet pendingMaintenance(int roomNum) {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from maintenance_table where room_no=?");
            pstmt.setInt(1, roomNum);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;

    }

    public ResultSet pendingMaintenance(String column) {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select " + column + ",room_no from maintenance_table");
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;

    }
    public boolean updatePassword(String pass,int id)
    {
        boolean b=false;
        try {
            PreparedStatement pstmt=con.prepareStatement("update residents set pass=? where id=?");
            pstmt.setString(1,pass);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
            b=true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
    public boolean addMaintenance(int roomNo)
    {
        boolean b=false;
        try {
            PreparedStatement pstmt=con.prepareStatement("insert into maintenance_table (room_no) value(?)");
            pstmt.setInt(1, roomNo);
            pstmt.executeUpdate();
            b=true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
     public static String  htmlAndCss(String cssClass,String msg)
    {
        String finalText="<div class="+cssClass+">"+msg+"<button class='cancel'>&times;</button></div>";
        return finalText;
    }
}
