/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuildingManagementSystem.Data;

import java.sql.Date;
public class Unavaibility {
    private int id;
    private int roomNum;
    private Date toDate;
    private Date fromDate;
    private String msg;

    public Unavaibility(int id, int roomNum, Date toDate, Date fromDate, String msg) {
        this.id = id;
        this.roomNum = roomNum;
        this.toDate = toDate;
        this.fromDate = fromDate;
        this.msg = msg;
    }

    public Unavaibility(int roomNum, Date toDate, Date fromDate, String msg) {
        this.roomNum = roomNum;
        this.toDate = toDate;
        this.fromDate = fromDate;
        this.msg = msg;
    }    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }
    


    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }
    
}
