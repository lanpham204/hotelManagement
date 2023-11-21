/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package view;
import javax.swing.*;
import java.awt.event.*;
public class test {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("JLabel Event Example");
            frame.setSize(300, 200);
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

            JLabel label1 = new JLabel("Label 1");
            JLabel label2 = new JLabel("Label 2");

            // Thêm một PropertyChangeListener cho label1
            label1.addPropertyChangeListener("text", evt -> {
                // Khi giá trị của label1 thay đổi, cập nhật giá trị của label2
                label2.setText((String) evt.getNewValue());
            });

            // Tạo một nút để thay đổi giá trị của label1
            JButton button = new JButton("Change Label 1");
            button.addActionListener(e -> label1.setText("New Value"));

            // Sắp xếp các thành phần trên frame
            JPanel panel = new JPanel();
            panel.add(label1);
            panel.add(label2);
            panel.add(button);

            frame.add(panel);
            frame.setVisible(true);
        });
    }
}
