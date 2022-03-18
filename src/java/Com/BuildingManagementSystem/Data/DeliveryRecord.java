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
public class DeliveryRecord {
    private int id;
    private int did;
    private int room_num;
    private Timestamp enrty_time;
    private Timestamp exit_time;
    private boolean upstairs;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public int getRoom_num() {
        return room_num;
    }

    public void setRoom_num(int room_num) {
        this.room_num = room_num;
    }

    public Timestamp getEnrty_time() {
        return enrty_time;
    }

    public void setEnrty_time(Timestamp enrty_time) {
        this.enrty_time = enrty_time;
    }

    public Timestamp getExit_time() {
        return exit_time;
    }

    public void setExit_time(Timestamp exit_time) {
        this.exit_time = exit_time;
    }

    public boolean isUpstairs() {
        return upstairs;
    }

    public void setUpstairs(boolean upstairs) {
        this.upstairs = upstairs;
    }

    public DeliveryRecord(int id, int did, int room_num, Timestamp enrty_time, boolean upstairs) {
        this.id = id;
        this.did = did;
        this.room_num = room_num;
        this.enrty_time = enrty_time;
        this.upstairs = upstairs;
    }

    public DeliveryRecord(int did, int room_num, boolean upstairs) {
        this.did = did;
        this.room_num = room_num;
        this.upstairs = upstairs;
    }

    public DeliveryRecord(int did, int room_num, Timestamp enrty_time, Timestamp exit_time, boolean upstairs) {
        this.did = did;
        this.room_num = room_num;
        this.enrty_time = enrty_time;
        this.exit_time = exit_time;
        this.upstairs = upstairs;
    }
}
