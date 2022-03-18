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
public class Complaint {
    private int cid;
    private int uid;
    private String complaintText;
    private Timestamp tmp;

    public Complaint(int cid, int uid, String complaintText, Timestamp tmp) {
        this.cid = cid;
        this.uid = uid;
        this.complaintText = complaintText;
        this.tmp = tmp;
    }

    public Complaint(int uid, String complaintText) {
        this.uid = uid;
        this.complaintText = complaintText;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getComplaintText() {
        return complaintText;
    }

    public void setComplaintText(String complaintText) {
        this.complaintText = complaintText;
    }

    public Timestamp getTmp() {
        return tmp;
    }

    public void setTmp(Timestamp tmp) {
        this.tmp = tmp;
    }
    
    
}
