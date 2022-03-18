/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.BuidingManagemenrSystem.Dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 */
public class Connect {

    private static Connection con = null;

    public static Connection makeConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/building_management_system?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "khankamru37");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}


