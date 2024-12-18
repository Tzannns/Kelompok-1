/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import config.DatabaseConnection;
import models.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
/**
 *
 * @author yangm
 */
public class SupplierController {
     private Connection conn;

    public SupplierController() {
        this.conn = DatabaseConnection.connect();
    }

    // Menambahkan Supplier
    public boolean tambahSupplier(Supplier supplier) {
        try {
            String sql = "INSERT INTO supplier (kode_supplier, nama_supplier, alamat, telepon, keterangan) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, supplier.getKode());
            pst.setString(2, supplier.getNama());
            pst.setString(3, supplier.getAlamat());
            pst.setString(4, supplier.getTelepon());
            pst.setString(5, supplier.getKeterangan());
            int result = pst.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

    // Mengambil semua data Supplier
    public ArrayList<Supplier> getAllSuppliers() {
        ArrayList<Supplier> suppliers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM supplier";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Supplier supplier = new Supplier();
                supplier.setKode(rs.getString("kode_supplier"));
                supplier.setNama(rs.getString("nama_supplier"));
                supplier.setAlamat(rs.getString("alamat"));
                supplier.setTelepon(rs.getString("telepon"));
                supplier.setKeterangan(rs.getString("keterangan"));
                suppliers.add(supplier);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return suppliers;
    }
}
