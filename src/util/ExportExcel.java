/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.table.TableModel;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author phamn
 */
public class ExportExcel {
    public static void exportExcel(JPanel panel,JTable tbl,String title) {
        try {
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet(title);
            XSSFRow row = null;
            XSSFCell cell = null;
            Font boldFont = workbook.createFont();
            boldFont.setBold(true);
            row = sheet.createRow(0);
            cell = row.createCell(0);
            cell.setCellValue(title);
            CellStyle style1 = workbook.createCellStyle();
            style1.setFont(boldFont);
            cell.setCellStyle(style1);
            row = sheet.createRow(1);
            for (int i = 0; i < tbl.getColumnCount(); i++) {
                cell = row.createCell(i);
                cell.setCellValue(tbl.getColumnName(i));
            }
            for (int i = 1; i < tbl.getRowCount(); i++) {
                row = sheet.createRow(i+1);
                for (int j = 0; j < tbl.getColumnCount(); j++) {
                    cell = row.createCell(j);
                    if(tbl.getValueAt(i, j) != null)
                    cell.setCellValue(tbl.getValueAt(i, j).toString());
                }
                
            }
            Date date = new Date();
            File folder = new File("excel");
            if(!folder.exists()) {
                folder.mkdirs();
            }
            String path = folder+"\\"+title+" "+XDate.toString(date, "dd-MM-yyyy HH-mm-ss")+".xlsx";
                try {
                    FileOutputStream fos = new FileOutputStream(path);
                    workbook.write(fos);
                    fos.close();
                } catch (FileNotFoundException ex) {
                    ex.printStackTrace();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
                MsgBox.showMessage(panel, "Xuất thành công");
        
        }  catch (Exception ex) {
                    ex.printStackTrace();
        }
    }
}

