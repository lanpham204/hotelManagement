/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.awt.Component;
import javax.swing.JOptionPane;

/**
 *
 * @author trann
 */
public class MsgBox {
    public static void showMessage(Component component, String message){
        JOptionPane.showMessageDialog(component, message,
                "Hệ thống quản lý khách sạn",JOptionPane.INFORMATION_MESSAGE);
    }
    public static String input(Component component, String message){
        return JOptionPane.showInputDialog(component, message,
                "Hệ thống quản lý khách sạn",JOptionPane.INFORMATION_MESSAGE);
    }
    public static boolean confirm(Component component, String message){
        int result= JOptionPane.showConfirmDialog(component, message,
                "Hệ thống quản lý khách sạn",
                JOptionPane.YES_NO_OPTION,JOptionPane.QUESTION_MESSAGE);
        return result == JOptionPane.YES_OPTION;
    }
}
