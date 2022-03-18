/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuidingManagemenrSystem.Dao;

import Com.BuildingManagementSystem.Data.Worker;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class WorkerDao {

    private Connection con = Connect.makeConnection();

    public boolean addWorker(Worker worker) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into workers (name,phone_number,role,profile) values(?,?,?,?)");
            pstmt.setString(1, worker.getName());
            pstmt.setString(2, worker.getPhone());
            pstmt.setString(3, worker.getRole());
            pstmt.setString(4, worker.getProfile());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
    private ArrayList<Worker> workerList = new ArrayList<>();

    public ArrayList<Worker> showAllWorker() {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from workers");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Worker worker = new Worker(rs.getInt("id"), rs.getString("name"), rs.getString("phone_number"), rs.getString("role"), rs.getString("profile"));
                workerList.add(worker);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return workerList;
    }

    public boolean deleteWorker(int id) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("delete from workers where id=?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public boolean updateWorker(Worker worker) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("update workers set name=?,phone_number=?,role=? where id=?");
            pstmt.setString(1, worker.getName());
            pstmt.setString(2, worker.getPhone());
            pstmt.setString(3, worker.getRole());
            pstmt.setInt(4, worker.getWid());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
        public boolean updateWorkerWithProfile(Worker worker) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("update workers set name=?,phone_number=?,role=?,profile=? where id=?");
            pstmt.setString(1, worker.getName());
            pstmt.setString(2, worker.getPhone());
            pstmt.setString(3, worker.getRole());
            pstmt.setString(4, worker.getProfile());
            pstmt.setInt(5, worker.getWid());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public Worker workerDetails(int id) {
        Worker worker = null;
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from workers where id=?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                worker = new Worker(rs.getInt("id"), rs.getString("name"), rs.getString("phone_number"), rs.getString("role"), rs.getString("profile"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return worker;
    }
    ArrayList<Worker> wList = new ArrayList<>();

    public ArrayList<Worker> fetchWorkerDetails(String value) {
        ResultSet rs = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from workers where name like '%" + value + "%' or phone_number like '%" + value + "%' or role like '%" + value + "%'");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Worker worker = new Worker(rs.getInt("id"), rs.getString("name"), rs.getString("phone_number"), rs.getString("role"), rs.getString("profile"));
                wList.add(worker);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wList;
    }

}
