/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package view;

import dao.BookingDAO;
import dao.GuestDAO;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import javax.swing.table.DefaultTableModel;
import model.Booking;
import util.MsgBox;

/**
 *
 * @author ta2khu75
 */
public class InvoiceFrm extends javax.swing.JPanel {
    private NumberFormat numberFormat = 
            NumberFormat.getCurrencyInstance(new Locale("vi","VN"));
    /**
     * Creates new form JPanel
     */
    public InvoiceFrm() {
        initComponents();
        init();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        tblBooking = new javax.swing.JTable();
        chsFrom = new com.toedter.calendar.JDateChooser();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        chsTo = new com.toedter.calendar.JDateChooser();
        jButton1 = new javax.swing.JButton();

        setPreferredSize(new java.awt.Dimension(0, 689));

        jScrollPane1.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));

        tblBooking.setAutoCreateRowSorter(true);
        tblBooking.setBackground(new java.awt.Color(255, 255, 255));
        tblBooking.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(255, 255, 255)));
        tblBooking.setForeground(new java.awt.Color(0, 0, 0));
        tblBooking.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null}
            },
            new String [] {
                "Mã Hóa Đơn", "Tên Khách Hàng", "Mã Phòng", "Lúc Vào", "Lúc Ra", "Hình Thức Thuê", "Trạng thái", "Tồng tiền"
            }
        ));
        tblBooking.setFocusable(false);
        tblBooking.setGridColor(new java.awt.Color(230, 230, 230));
        tblBooking.setIntercellSpacing(new java.awt.Dimension(5, 5));
        tblBooking.setRowHeight(40);
        tblBooking.setShowHorizontalLines(true);
        tblBooking.getTableHeader().setReorderingAllowed(false);
        jScrollPane1.setViewportView(tblBooking);

        chsFrom.setDateFormatString("dd/MM/yyyy");
        chsFrom.setMinSelectableDate(new java.util.Date(-62135791106000L));

        jLabel2.setText("Từ ngày:");

        jLabel3.setText("Đến ngày:");

        chsTo.setDateFormatString("dd/MM/yyyy");
        chsTo.setMinSelectableDate(new java.util.Date(-62135791106000L));

        jButton1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton1.setText("Tìm");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(chsFrom, javax.swing.GroupLayout.PREFERRED_SIZE, 500, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(52, 52, 52)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(chsTo, javax.swing.GroupLayout.PREFERRED_SIZE, 500, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, 95, Short.MAX_VALUE)
                .addContainerGap())
            .addComponent(jScrollPane1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(chsTo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel2)
                            .addComponent(chsFrom, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.TRAILING))
                    .addComponent(jButton1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 683, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        if (chsFrom.getDate() == null || chsTo.getDate() == null) {
            MsgBox.showMessage(this, "Vui long chon ngay");
            
            return;
        } else {
            list = bookDao.selectByDate(chsFrom.getDate(), chsTo.getDate());
            fillTbl(list);
        }

    }//GEN-LAST:event_jButton1ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.toedter.calendar.JDateChooser chsFrom;
    private com.toedter.calendar.JDateChooser chsTo;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblBooking;
    // End of variables declaration//GEN-END:variables
    private DefaultTableModel tblModel;
    private BookingDAO bookDao = new BookingDAO();
    private GuestDAO guestDAO = new GuestDAO();
    private List<Booking> list;

    private void init() {
        tblModel = (DefaultTableModel) tblBooking.getModel();
        fillTbl();
    }

    private void fillTbl() {
        list = bookDao.selectAll();
        tblModel.setRowCount(0);
        for (Booking b : list) {
            tblModel.addRow(new Object[]{b.getId(), guestDAO.selectById(b.getIdGuest()).getFullName(), b.getIdRoom(), b.getStartDate(), b.getEndDate(), b.isType() ? "Ngày" : "Giờ", b.getStatus() == 0  ? "Đã thanh toán" : "Chưa thanh toán", numberFormat.format(b.getTotalMoney())});
        }
        tblModel.fireTableDataChanged();
    }

    private void fillTbl(List<Booking> bookings) {
        tblModel.setRowCount(0);
        if(bookings!=null) {
            for (Booking b : bookings) {
            tblModel.addRow(new Object[]{b.getId(), guestDAO.selectById(b.getIdGuest()).getFullName(), b.getIdRoom(), b.getStartDate(), b.getEndDate(), b.isType() ? "Ngày" : "Giờ", b.getStatus() == 0 ? "Đã thanh toán" : "Chưa thanh toán", b.getTotalMoney()});
            }
            tblModel.fireTableDataChanged();
        } else {
            MsgBox.showMessage(this, "Không tìm thấy dữ liệu cần tìm");
        }
    }
}
