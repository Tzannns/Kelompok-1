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
public class LoginForm extends JFrame {
   private JTextField txtUsername;
    private JPasswordField txtPassword;
    private JButton btnLogin;

    public LoginForm() {
        setTitle("Login Form");
        setSize(300, 200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        txtUsername = new JTextField(20);
        txtPassword = new JPasswordField(20);
        btnLogin = new JButton("Login");

        JPanel panel = new JPanel();
        panel.add(new JLabel("Username:"));
        panel.add(txtUsername);
        panel.add(new JLabel("Password:"));
        panel.add(txtPassword);
        panel.add(btnLogin);

        btnLogin.addActionListener(e -> {
            String username = txtUsername.getText();
            String password = new String(txtPassword.getPassword());

            if (username.equals("admin") && password.equals("admin")) {
                new MainMenu().setVisible(true);
                this.setVisible(false);  // Menyembunyikan LoginForm
            } else {
                JOptionPane.showMessageDialog(this, "Login failed, invalid credentials!");
            }
        });

        add(panel);
    }

    public static void main(String[] args) {
        // Menjalankan GUI di dalam Event Dispatch Thread (EDT)
        java.awt.EventQueue.invokeLater(() -> {
            new LoginForm().setVisible(true);
        });
    }
}
