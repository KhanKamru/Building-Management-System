/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuildingManagementSystem.Data;

/**
 *
 * @author kamru
 */
public class DeliveryPerson {
    private int id;
    private int companyId;
    private String name;
    private String phoneNum;
    private String vehicleNum;

    public DeliveryPerson(int id, int companyId, String name, String phoneNum, String vehicleNum) {
        this.id = id;
        this.companyId = companyId;
        this.name = name;
        this.phoneNum = phoneNum;
        this.vehicleNum = vehicleNum;
    }

    public DeliveryPerson(int companyId, String name, String phoneNum, String vehicleNum) {
        this.companyId = companyId;
        this.name = name;
        this.phoneNum = phoneNum;
        this.vehicleNum = vehicleNum;
    }

    
    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getVehicleNum() {
        return vehicleNum;
    }

    public void setVehicleNum(String vehicleNum) {
        this.vehicleNum = vehicleNum;
    }
    
    
    
}
