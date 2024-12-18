/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package views;

import controllers.SupplierController;
import models.Supplier;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
/**
 *
 * @author yangm
 */
public class SupplierForm extends JFrame{

    private JTextField txtKode, txtNama, txtAlamat, txtTelepon, txtKeterangan;
    private JButton btnSave, btnCancel;
    private SupplierController controller;

    public SupplierForm() {
        setTitle("Supplier Form");
        setSize(400, 300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);

        controller = new SupplierController();

        txtKode = new JTextField(20);
        txtNama = new JTextField(20);
        txtAlamat = new JTextField(20);
        txtTelepon = new JTextField(20);
        txtKeterangan = new JTextField(20);

        btnSave = new JButton("Save");
        btnCancel = new JButton("Cancel");

        JPanel panel = new JPanel(new GridLayout(6, 2));
        panel.add(new JLabel("Kode:"));
        panel.add(txtKode);
        panel.add(new JLabel("Nama:"));
        panel.add(txtNama);
        panel.add(new JLabel("Alamat:"));
        panel.add(txtAlamat);
        panel.add(new JLabel("Telepon:"));
        panel.add(txtTelepon);
        panel.add(new JLabel("Keterangan:"));
        panel.add(txtKeterangan);
        panel.add(btnSave);
        panel.add(btnCancel);

        btnSave.addActionListener(this::saveSupplier);
        btnCancel.addActionListener(e -> this.dispose());

        add(panel);
    }

    private void saveSupplier(ActionEvent e) {
        Supplier supplier = new Supplier();
        supplier.setKode(txtKode.getText());
        supplier.setNama(txtNama.getText());
        supplier.setAlamat(txtAlamat.getText());
        supplier.setTelepon(txtTelepon.getText());
        supplier.setKeterangan(txtKeterangan.getText());

        boolean isSaved = controller.tambahSupplier(supplier);
        if (isSaved) {
            JOptionPane.showMessageDialog(this, "Supplier added successfully!");
            this.dispose();
        } else {
            JOptionPane.showMessageDialog(this, "Failed to add supplier.");
        }
    }
}
