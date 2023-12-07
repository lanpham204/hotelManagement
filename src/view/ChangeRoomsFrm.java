/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package view;

import com.itextpdf.text.pdf.PdfName;
import dao.BookingDAO;
import dao.GuestDAO;
import dao.RoomDAO;
import dao.TypeOfRoomDAO;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Insets;
import javax.swing.BoxLayout;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JMenuItem;
import javax.swing.JPopupMenu;
import javax.swing.border.EmptyBorder;
import model.Booking;
import model.Guest;
import model.Room;
import model.TypeOfRoom;
import util.MsgBox;

/**
 *
 * @author phamn
 */
public class ChangeRoomsFrm extends javax.swing.JPanel {
    private List<Room> rooms = new ArrayList<>();
    private RoomDAO roomDAO = new RoomDAO();
    private TypeOfRoomDAO typeOfRoomDAO = new TypeOfRoomDAO();
    private BookingDAO bookingDAO = new BookingDAO();
    private GuestDAO guestDAO = new GuestDAO();
    private int currentIdBooking;
    /**
     * Creates new form BookRoomFrm
     */
    public ChangeRoomsFrm() {
        initComponents();
        showRooms();


    }
    public ChangeRoomsFrm(int idBooking) {
        initComponents();
        this.currentIdBooking = idBooking;
        showRooms();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setPreferredSize(new java.awt.Dimension(0, 689));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 599, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
public class PopupMenuMouseListener extends MouseAdapter {
        private JPanel cardPanel;
        private JPanel roomsFrm;
        private String idRoom;
        private int idBooking;
        public PopupMenuMouseListener(JPanel cardPanel, JPanel roomsFrm,String idRoom) {
            this.cardPanel = cardPanel;
            this.roomsFrm = roomsFrm;
            this.idRoom = idRoom;
        }
        
        public PopupMenuMouseListener(JPanel cardPanel, JPanel roomsFrm,String idRoom, int idBooking) {
            this.cardPanel = cardPanel;
            this.roomsFrm = roomsFrm;
            this.idRoom = idRoom;
            this.idBooking = idBooking;
        }
        
        
        @Override
        public void mouseClicked(MouseEvent e) {
            if (e.isPopupTrigger()) {
                JPopupMenu popupMenu = new JPopupMenu();
                JMenuItem changeRoomItem = new JMenuItem("Đổi phòng");
                Room r = roomDAO.selectById(idRoom);
                if(r.getStatus() != 0) {
                    changeRoomItem.setEnabled(false);
                }
                changeRoomItem.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        Booking booking = bookingDAO.selectById(idBooking);
                        if(booking != null) {
                            Room currentRoom = roomDAO.selectById(booking.getIdRoom());
                            currentRoom.setStatus(0);
                            roomDAO.update(currentRoom);
                            booking.setIdRoom(idRoom);
                            bookingDAO.update(booking);
                             Room newRoom = roomDAO.selectById(booking.getIdRoom());
                             newRoom.setStatus(1);
                             roomDAO.update(newRoom);
                             MsgBox.showMessage(cardPanel, "Đổi phòng thành công");
                            roomsFrm.removeAll();
                            roomsFrm.setLayout(new BorderLayout());
                            roomsFrm.add(new DetailBookRoomFrm(booking.getIdRoom()));
                            roomsFrm.validate();
                            roomsFrm.repaint();
                            cardPanel.removeAll();
                            cardPanel.revalidate();
                            cardPanel.repaint();
                        }
                    }
                });
                
                popupMenu.add(changeRoomItem);
                popupMenu.show(cardPanel, e.getX(), e.getY());
            }
        }

        @Override
        public void mousePressed(MouseEvent e) {
            if (e.isPopupTrigger()) {
                mouseClicked(e);
            }
        }

        @Override
        public void mouseReleased(MouseEvent e) {
            if (e.isPopupTrigger()) {
                mouseClicked(e);
            }
        }
    }
    public void showRooms() {
        rooms = roomDAO.selectAll();
        setLayout(new BorderLayout());

        JPanel container = new JPanel(new GridLayout(0, 1));
        this.setBackground(new Color(54,33,89));
        HeaderComponent headerComponent = new HeaderComponent();
        container.add(headerComponent);
    JPanel rowPanel = new JPanel(new FlowLayout(FlowLayout.LEFT,20,5)); // Sắp xếp component theo hàng ngang
        for (Room room : rooms) {
            JPanel cardPanel = new JPanel(new FlowLayout(FlowLayout.LEFT,5,0));
        TypeOfRoom tor = typeOfRoomDAO.selectById(room.getIdTypeofRoom());
            if(room.getStatus() == 1) {
                
                Booking booking = bookingDAO.selectByIdRoom(room.getId());
                if(booking!=null) {
                    Guest guest = guestDAO.selectById(booking.getIdGuest());
                CardRoomComponent cardRoomComponent = new CardRoomComponent(
                room.getId(),tor.getName(),"Khách hàng: "+guest.getFullName(),""
                ,room.getStatus());
                cardPanel.add(cardRoomComponent);
                }
                
            } else {
                CardRoomComponent cardRoomComponent = new CardRoomComponent(
                room.getId(),tor.getName(),"",""
                ,room.getStatus());
                cardPanel.add(cardRoomComponent);
            }
        rowPanel.add(cardPanel);
        if (rowPanel.getComponentCount()==4) {
                container.add(rowPanel);
                rowPanel = new JPanel(new FlowLayout(FlowLayout.LEFT,20,5));
        }
       cardPanel.addMouseListener(new PopupMenuMouseListener(cardPanel,this,room.getId(),currentIdBooking));
    }
    
    container.add(rowPanel);
    JScrollPane scrollPane = new JScrollPane(container);
    add(scrollPane, BorderLayout.CENTER);
    }
}