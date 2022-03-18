/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuildingManagementSystem.Data;

import java.sql.Timestamp;

/**
 *
 * @author kamru
 */
public class Notice {
    private int id;
    private String heading;
    private String body;
    private Timestamp nTime;
    private int roomNum;

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Timestamp getnTime() {
        return nTime;
    }

    public void setnTime(Timestamp nTime) {
        this.nTime = nTime;
    }

    public Notice(int id, String heading, String body, Timestamp nTime, int roomNum) {
        this.id = id;
        this.heading = heading;
        this.body = body;
        this.nTime = nTime;
        this.roomNum = roomNum;
    }

    public Notice(String heading, String body, int roomNum) {
        this.heading = heading;
        this.body = body;
        this.roomNum = roomNum;
    }


    
}
