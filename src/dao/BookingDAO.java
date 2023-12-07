package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Booking;
import util.JdbcHelper;

public class BookingDAO extends HotelDAO<Booking, Integer> {
    String INSERT_SQL = "INSERT INTO PhieuDatPhong(MaKH, MaPhong, NgayGioNhan, NgayGioTra,HinhThucThue, TongTien, TrangThai,MaNV) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    String UPDATE_SQL = "UPDATE PhieuDatPhong SET MaKH = ?, MaPhong = ?, NgayGioNhan = ?, NgayGioTra = ?,HinhThucThue = ?, TongTien = ?, TrangThai = ?, MaNV = ? WHERE MaPDP = ?";
    String DELETE_SQL = "DELETE FROM PhieuDatPhong WHERE MaPDP = ?";
    String SELECT_ALL_SQL = "SELECT * FROM PhieuDatPhong";
    String SELECT_BY_ID_SQL = "SELECT * FROM PhieuDatPhong WHERE MaPDP = ?";
    String SELECT_BY_DATE = "SELECT distinct * FROM PhieuDatPhong WHERE ngaygionhan between ? and ? or ngaygiotra between ? and ?";
    private JdbcHelper jdbcHelper = new JdbcHelper();

    @Override
    public void insert(Booking entity) {
        try {
            jdbcHelper.update(INSERT_SQL, entity.getIdGuest(), entity.getIdRoom(), entity.getStartDate(),
                    entity.getEndDate(), entity.isType(),entity.getTotalMoney(),entity.getStatus(),entity.getIdStaff());
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Booking entity) {
        try {
            jdbcHelper.update(UPDATE_SQL, entity.getIdGuest(), entity.getIdRoom(), entity.getStartDate(),
                    entity.getEndDate(), entity.isType(),entity.getTotalMoney(),entity.getStatus(), entity.getIdStaff(),entity.getId());
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Booking entity) {
        try {
            jdbcHelper.update(DELETE_SQL, entity.getId());
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Booking selectById(Integer id) {
        List<Booking> bookings = this.selectBySql(SELECT_BY_ID_SQL, id);
        if (bookings.isEmpty()) {
            return null;
        }
        return bookings.get(0);
    }

    @Override
    public List<Booking> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    protected List<Booking> selectBySql(String sql, Object... args) {
        List<Booking> bookings = new ArrayList<>();
        try (ResultSet resultSet = jdbcHelper.query(sql, args)) {
            while (resultSet.next()) {
                Booking booking = new Booking();
                booking.setId(resultSet.getInt("MaPDP"));
                booking.setIdGuest(resultSet.getString("MaKH"));
                booking.setIdRoom(resultSet.getString("MaPhong"));
                booking.setStartDate(resultSet.getTimestamp("NgayGioNhan"));
                booking.setEndDate(resultSet.getTimestamp("NgayGioTra"));
                booking.setType(resultSet.getBoolean("HinhThucThue"));
                booking.setTotalMoney(resultSet.getFloat("TongTien"));
                booking.setStatus(resultSet.getInt("TrangThai"));
                booking.setIdStaff(resultSet.getString("MaNV"));
                bookings.add(booking);
            }
            return bookings;
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public Booking selectByIdRoom(String id) {
        String sql =    "select * from PhieuDatPhong\n" +
                    "where MaPhong = ? and TrangThai = 1\n";
        List<Booking> bookings = selectBySql(sql, id);
        if(bookings.isEmpty()) {
            return null;
        }
        return bookings.get(0);
    }
    public Booking selectReserveByIdRoom(String id) {
        String sql =    "select * from PhieuDatPhong\n" +
                    "where MaPhong = ? and TrangThai = 2\n";
        List<Booking> bookings = selectBySql(sql, id);
        if(bookings.isEmpty()) {
            return null;
        }
        return bookings.get(0);
    }
    

    public List<Booking> selectByDate(Date from, Date to) {
        List<Booking> bookings = this.selectBySql(SELECT_BY_DATE, from, to, from, to);
        if (bookings.isEmpty()) {
            return null;
        }
        return bookings;
    }
}

