/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuildingManagementSystem.Data;

/**
 *
 * @author kamru
 */
public class Worker {
    private int wid;
    private String name;
    private String phone;
    private String role;
    private String profile;
    
    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public Worker(String name, String phone, String role, String profile) {
        this.name = name;
        this.phone = phone;
        this.role = role;
        this.profile = profile;
    }

    public Worker(int wid, String name, String phone, String role, String profile) {
        this.wid = wid;
        this.name = name;
        this.phone = phone;
        this.role = role;
        this.profile = profile;
    }

    public Worker(int wid, String name, String phone, String role) {
        this.wid = wid;
        this.name = name;
        this.phone = phone;
        this.role = role;
    }

     
    
}
