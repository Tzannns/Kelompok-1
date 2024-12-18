/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author yangm
 */
public class DatabaseConnection {
    private static Connection conn;

    public static Connection connect() {
        if (conn == null) {
            try {
                String url = "jdbc:mysql://localhost:3306/inventory_produksi";
                String user = "root";
                String password = "";
                conn = DriverManager.getConnection(url, user, password);
                System.out.println("Koneksi berhasil!");
            } catch (Exception e) {
                System.out.println("Koneksi gagal: " + e.getMessage());
            }
        }
        return conn;
    }
    
}
