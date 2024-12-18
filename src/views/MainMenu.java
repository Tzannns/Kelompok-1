/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package views;
import javax.swing.*;

/**
 *
 * @author yangm
 */
public class MainMenu extends JFrame{
  private JButton btnSupplier;

    public MainMenu() {
        setTitle("Main Menu");
        setSize(300, 200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        btnSupplier = new JButton("Manage Suppliers");

        btnSupplier.addActionListener(e -> new SupplierForm().setVisible(true));

        JPanel panel = new JPanel();
        panel.add(btnSupplier);

        add(panel);
    }
}
