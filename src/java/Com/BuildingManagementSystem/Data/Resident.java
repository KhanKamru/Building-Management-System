/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuildingManagementSystem.Data;

/**
 *
 * @author kamru
 */
public class Resident {
    private int rid;
    private int roomNum;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    private String phoneNum;
    private String pass;

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Resident(int roomNum, String name, String phoneNum, String pass) {
        this.roomNum = roomNum;
        this.name = name;
        this.phoneNum = phoneNum;
        this.pass = pass;
    }

    public Resident(int rid, int roomNum, String name, String phoneNum) {
        this.rid = rid;
        this.roomNum = roomNum;
        this.name = name;
        this.phoneNum = phoneNum;
        this.pass = pass;
    }
    
    
}
