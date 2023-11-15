/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package view;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.text.NumberFormat;
import java.util.Locale;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author phamn
 */
public class ServiceComponent extends javax.swing.JPanel {
    private NumberFormat numberFormat = 
            NumberFormat.getCurrencyInstance(new Locale("vi","VN"));
    /*==
     * Creates new form ServiceComponent
     */
    public ServiceComponent() {
        initComponents();
    }
    public ServiceComponent(String name,float price,DefaultTableModel tableModel) {
        initComponents();
        lblName.setText(name);
        lblPrice.setText(numberFormat.format(price));
        addMouseListenerToPanel(tableModel);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lblPrice = new javax.swing.JLabel();
        lblName = new javax.swing.JLabel();

        setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 255)));

        lblPrice.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblPrice.setText("Giá:");

        lblName.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblName.setText("jLabel1");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lblName, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 113, Short.MAX_VALUE)
            .addComponent(lblPrice, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(23, Short.MAX_VALUE)
                .addComponent(lblName)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(lblPrice)
                .addGap(12, 12, 12))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel lblName;
    private javax.swing.JLabel lblPrice;
    // End of variables declaration//GEN-END:variables
    private void addMouseListenerToPanel(DefaultTableModel tableModel) {
        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                String serviceName = lblName.getText();
                String servicePrice = lblPrice.getText();
                QuantityComponent quantityComponent = new QuantityComponent(serviceName,servicePrice,tableModel);
                quantityComponent.setVisible(true);
            }
        });
    }
}