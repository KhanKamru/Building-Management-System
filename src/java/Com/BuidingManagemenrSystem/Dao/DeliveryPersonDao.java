/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuidingManagemenrSystem.Dao;

import Com.BuildingManagementSystem.Data.DeliveryPerson;
import Com.BuildingManagementSystem.Data.DeliveryRecord;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
public class DeliveryPersonDao {

    private Connection con = Connect.makeConnection();

    public boolean insertDetails(DeliveryPerson dp) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into delivery_person (name,company,vehicle_num,phone_num) values(?,?,?,?)");
            pstmt.setString(1, dp.getName());
            pstmt.setInt(2, dp.getCompanyId());
            pstmt.setString(3, dp.getVehicleNum());
            pstmt.setString(4, dp.getPhoneNum());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public DeliveryPerson dpDetails(String phoneNum) {
        DeliveryPerson dp = null;
        ResultSet rs = null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from delivery_person where phone_num=?");
            pstmt.setString(1, phoneNum);
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                dp=new DeliveryPerson(rs.getInt("id"),rs.getInt("company"),rs.getString("name"),rs.getString("phone_num"),rs.getString("vehicle_num"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dp;
    }
    
    public boolean insertRecord(DeliveryRecord dr) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("insert into delivery_person_record (did,room_no,upstairs) values(?,?,?)");
            pstmt.setInt(1, dr.getDid());
            pstmt.setInt(2, dr.getRoom_num());
            pstmt.setBoolean(3, dr.isUpstairs());
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
        public boolean updateExitTime(int id) {
        boolean b = false;
        try {
            PreparedStatement pstmt = con.prepareStatement("update delivery_person_record set exit_time=current_timestamp where id=?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
    public boolean insertCompany(String company)
    {
        boolean b=false;
        try {
            PreparedStatement pstmt=con.prepareStatement("insert into company_name(company) value(?)");
            pstmt.setString(1, company);
            pstmt.executeUpdate();
            b=true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
    public ResultSet getCompanyName(String company)
    {
        ResultSet rs=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from company_name where company=?");
            pstmt.setString(1, company);
            rs=pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    private ArrayList <DeliveryRecord> drList=new ArrayList<>();
    public ArrayList<DeliveryRecord> getRecord(Date d)
    {
        ResultSet rs=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from delivery_person_record where entry_time like '"+d+"%' and exit_time=0");
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                DeliveryRecord rd=new DeliveryRecord(rs.getInt("id"), rs.getInt("did"), rs.getInt("room_no"), rs.getTimestamp("entry_time"), rs.getBoolean("upstairs"));
                drList.add(rd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drList;
    }
    public String getCompanyName(int id)
    {
        ResultSet rs=null;
        String company=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select company from company_name where id=?");
            pstmt.setInt(1, id);
            rs=pstmt.executeQuery();
            while (rs.next()) {
                company=rs.getString("company");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return company;
    }
    public DeliveryPerson dpDetails(int id) {
        DeliveryPerson dp = null;
        ResultSet rs = null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select * from delivery_person where id=?");
            pstmt.setInt(1, id);
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                dp=new DeliveryPerson(rs.getInt("id"),rs.getInt("company"),rs.getString("name"),rs.getString("phone_num"),rs.getString("vehicle_num"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dp;
    }
    private ArrayList<String> companyList =new ArrayList<>();
    public ArrayList<String> getAllCompany()
    {
        ResultSet rs=null;
        try {
            PreparedStatement pstmt=con.prepareStatement("select company from company_name");
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                String company=rs.getString("company");
                companyList.add(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companyList;
    }
    public ArrayList<DeliveryPerson> dpList=new ArrayList<>();
    public ArrayList<DeliveryPerson> getAllDeliveryPersons(String value)
    {
        ResultSet rs=null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from delivery_person where name like '%" + value + "%' or phone_num like '%" + value + "%' or vehicle_num like '%" + value + "%'");
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                DeliveryPerson dp=new DeliveryPerson(rs.getInt("id"), rs.getInt("company"), rs.getString("name"), rs.getString("phone_num"), rs.getString("vehicle_num"));
                dpList.add(dp);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dpList;
    }
        private ArrayList <DeliveryRecord> drLists=new ArrayList<>();
        public ArrayList<DeliveryRecord> getRecord(int value,String column)
        {
          ResultSet rs=null;
            try {
                PreparedStatement pstmt=con.prepareStatement("select * from delivery_person_record where "+column+" =?");
                pstmt.setInt(1, value);
                rs=pstmt.executeQuery();
                while(rs.next())
                {
                    DeliveryRecord dr=new DeliveryRecord(rs.getInt("did"), rs.getInt("room_no"), rs.getTimestamp("entry_time"), rs.getTimestamp("exit_time"), rs.getBoolean("upstairs"));
                    drLists.add(dr);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
         return drLists;   
        }
}
