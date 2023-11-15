/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author phamn
 */
public class Booking {
    private int id;
    private String idGuest;
    private String idRoom;
    private Date startDate;
    private Date endDate;
    private boolean type;
    private float totalMoney;

    public Booking() {
    }

    public Booking(String idGuest, String idRoom, Date startDate, Date endDate, boolean type, float totalMoney) {
        this.idGuest = idGuest;
        this.idRoom = idRoom;
        this.startDate = startDate;
        this.endDate = endDate;
        this.type = type;
        this.totalMoney = totalMoney;
    }

    public Booking(int id, String idGuest, String idRoom, Date startDate, Date endDate, boolean type, float totalMoney) {
        this.id = id;
        this.idGuest = idGuest;
        this.idRoom = idRoom;
        this.startDate = startDate;
        this.endDate = endDate;
        this.type = type;
        this.totalMoney = totalMoney;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdGuest() {
        return idGuest;
    }

    public void setIdGuest(String idGuest) {
        this.idGuest = idGuest;
    }

    public String getIdRoom() {
        return idRoom;
    }

    public void setIdRoom(String idRoom) {
        this.idRoom = idRoom;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }
    
}
