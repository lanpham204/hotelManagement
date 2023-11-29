/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.JdbcHelper;

/**
 *
 * @author phamn
 */
public class StatisticalDAO {
    private List<Object[]> getListOfArray(String sql,String[] cols, Object...args) {
        JdbcHelper jdbcHelper = new JdbcHelper();
        List<Object[]> objects = new ArrayList<>();
        try (ResultSet rs = jdbcHelper.query(sql, args);){
            while (rs.next()) {                
                Object[] values = new Object[cols.length];
                for (int i = 0; i < cols.length; i++) {
                    values[i] = rs.getObject(cols[i]);
                }
                objects.add(values);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatisticalDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return objects;
    }
    public List<Object[]> getRevenueByDate(String date) {
        String sql = "{CALL sp_SearchTotalRevenueByDate(?)}";
        String[] cols = {"Ngay","SoKH","DoanhThu"};
        return this.getListOfArray(sql, cols, "%"+date+"%");
    }
    public List<Object[]> getRevenueByFromToDate(String form,String to) {
        String sql = "{CALL sp_SearchTotalRevenueByFromToDate(?,?)}";
        String[] cols = {"Ngay","SoKH","DoanhThu"};
        return this.getListOfArray(sql, cols,form,to);
    }
    public List<Object[]> getTotalRevenueByYear() {
        String sql = "SELECT  YEAR(NgayGioTra) Nam,\n" +
"		 count(pd.MaKH) SoKH,\n" +
"		 SUM(TongTien) DoanhThu\n" +
"	FROM PhieuDatPhong pd\n" +
"		JOIN KhachHang kh ON kh.CCCD = pd.MaKH\n" +
"	GROUP BY YEAR(NgayGioTra)";
        String[] cols = {"Nam","SoKH","DoanhThu"};
        return this.getListOfArray(sql, cols);
    }
    public List<Object[]> getGuest(String keyword) {
        String sql = "SELECT  CCCD,\n" +
"		HoTen,\n" +
"		COUNT(CCCD) SoLan\n" +
                "FROM KhachHang kh\n" +
                "JOIN PhieuDatPhong pd on pd.MaKH = kh.CCCD\n" +
                "where HoTen like ?\n" +
                "GROUP BY CCCD,HoTen\n"+
                "ORDER BY SoLan DESC";
        String[] cols = {"CCCD","HoTen","SoLan"};
        return this.getListOfArray(sql, cols,"%"+keyword+"%");
    }
    public List<Object[]> getService(String keyword,String orderSort) {
        String sql = "SELECT  TenDV,\n" +
"		COUNT(dvp.MaDV) SoLan\n" +
                "FROM DichVu dv\n" +
                "left JOIN DichVuPhong dvp on  dvp.MaDV = dv.MaDV\n" +
                "where TenDV like ?\n" +
                "GROUP BY TenDV\n" +
                "ORDER BY SoLan "+ orderSort;
        String[] cols = {"TenDV","SoLan"};
        return this.getListOfArray(sql, cols,"%"+keyword+"%");
    }
    public List<Object[]> getTotalMonthRevenueByYear(String year) {
        String sql = "SELECT  month(NgayGioTra) Thang,\n" +
"		 SUM(TongTien) DoanhThu\n" +
"	FROM PhieuDatPhong pd\n" +
"		JOIN KhachHang kh ON kh.CCCD = pd.MaKH\n" +
"    WHERE year(NgayGioTra) = ?\n" +
"	GROUP BY month(NgayGioTra);";
        String[] cols = {"Thang","DoanhThu"};
        return this.getListOfArray(sql, cols,year);
    }
    public List<Object[]> getyearByRevenue() {
        String sql = "SELECT  year(NgayGioTra) Nam\n" +
"	FROM PhieuDatPhong pd\n" +
"	GROUP BY year(NgayGioTra);";
        String[] cols = {"Nam"};
        return this.getListOfArray(sql, cols);
    }
    
    
}
