/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package view;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfDiv;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.events.PdfPTableEventForwarder;
import dao.BookingDAO;
import dao.GuestDAO;
import dao.RoomDAO;
import dao.ServiceDAO;
import dao.ServiceRoomDAO;
import dao.TypeOfRoomDAO;
import dao.TypeOfServiceDAO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import jdk.javadoc.internal.doclets.formats.html.Table;
import model.Booking;
import model.Guest;
import model.Room;
import model.Service;
import model.ServiceRoom;
import model.TypeOfRoom;

public class ExportInvoicePDF {
    public static void export(Booking booking,String totalRoom,String totalService, String totalAll, int totalDay) {
    RoomDAO roomDAO = new RoomDAO();
    TypeOfRoomDAO typeOfRoomDAO = new TypeOfRoomDAO();
    BookingDAO bookingDAO = new BookingDAO();
    GuestDAO guestDAO = new GuestDAO();
    ServiceDAO serviceDAO = new ServiceDAO();
    ServiceRoomDAO serviceRoomDAO = new ServiceRoomDAO();
    
        Room room = roomDAO.selectById(booking.getIdRoom());
        TypeOfRoom tor = typeOfRoomDAO.selectById(room.getIdTypeofRoom());
        Guest guest = guestDAO.selectById(booking.getIdGuest());
        List<ServiceRoom> serviceRooms = serviceRoomDAO.selectServiceRoomByIdBooking(booking.getId());
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        NumberFormat numberFormat = 
            NumberFormat.getCurrencyInstance(new Locale("vi","VN"));
        if(totalDay == 0) {
            totalDay = 1;
        }
        try { 
            // Tạo một đối tượng Document
            Document document = new Document();

            // Tạo một đối tượng PdfWriter để ghi vào file PDF
            PdfWriter.getInstance(document, new FileOutputStream("invoice\\"+booking.getId()+".pdf"));

            // Mở document để thêm nội dung
            document.open();

            // Tạo font với font chữ Arial (có thể sử dụng font khác tùy chọn)
            BaseFont baseFont = BaseFont.createFont("src\\font\\Roboto-Regular.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            BaseFont baseFontBold = BaseFont.createFont("src\\font\\Roboto-Bold.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(baseFont, 12);
            Font font15 = new Font(baseFont, 15);
            Font fontBold12 = new Font(baseFontBold, 12);
            Font fontBold = new Font(baseFontBold, 15);
            float threecol = 190f;
            float twocol = 285f;
            float twocol100 = twocol;
            float twocolumnWidth[] = {twocol,twocol};
            float twocolumnWidth2[] = {150f,150f};
            float fullwidth[] = {threecol};
            float fourColumnWidth[] = {threecol,threecol,threecol,threecol};
            float threeColumnWidth100[] = {threecol+100f,threecol,threecol};
            float threeColumnWidth[] = {threecol-100f,threecol+100f,threecol};

            String imageUrl = "src\\icon\\logo-small.png";
            Image image = Image.getInstance(imageUrl);
            image.scaleToFit(100, 100);
            
            
            PdfPTable table = new PdfPTable(twocolumnWidth2);
            table.addCell( createCell("HÓA ĐƠN",fontBold));
            PdfPTable nestedTable = new PdfPTable(new float[]{twocol100,twocol100});
            nestedTable.addCell(createCell("Mã hóa đơn: ",font));
            nestedTable.addCell(createCell(booking.getId()+"",font));
            nestedTable.addCell(createCell("Ngày lập ",font));
            nestedTable.addCell(createCell(dateFormat.format(booking.getEndDate()),font));
            PdfPCell nestedCell = new PdfPCell();
            nestedCell.addElement(nestedTable);
            nestedCell.setBorder(Rectangle.NO_BORDER);
            table.addCell(nestedCell);
            
            
            PdfPCell gb = new PdfPCell();
            gb.addElement(new com.itextpdf.text.Paragraph(""));
            gb.setBorder(PdfPCell.BOX);
            PdfPTable divider = new PdfPTable(fullwidth);
            divider.addCell(gb);
            
            PdfPTable twoColTable = new PdfPTable(twocolumnWidth);
            twoColTable.addCell(createCell("Khách hàng: "+guest.getFullName(), font));
            twoColTable.addCell(createCell("Phòng: "+room.getId(), font));
            twoColTable.addCell(createCell("\n", font));
            twoColTable.addCell(createCell("\n", font));
            twoColTable.addCell(createCell("Ngày vào: "+dateFormat.format(booking.getStartDate()), font));
            twoColTable.addCell(createCell("Ngày trả: "+dateFormat.format(booking.getEndDate()), font));
            twoColTable.addCell(createCell("\n", font));
            twoColTable.addCell(createCell("\n", font));
            String type = booking.isType() ?"Ngày":"Giờ";
            twoColTable.addCell(createCell("Hình thức thuê: "+type, font));
            float price = booking.isType()? tor.getPricePerDay():tor.getHourlyPrice();
            twoColTable.addCell(createCell(numberFormat.format(price)+"/"+type, fontBold12));
            PdfPTable threeColTableTotalRoom = new PdfPTable(threeColumnWidth100);
            
            threeColTableTotalRoom.addCell(createCell("Tổng tiền phòng:", fontBold12));
                threeColTableTotalRoom.addCell(
                        createCell(numberFormat.format(price)+" x " +totalDay+" = ", fontBold12));
            threeColTableTotalRoom.addCell(createCell(totalRoom, fontBold12));

            PdfPTable tableTitle = new PdfPTable(1);
            tableTitle.addCell(createCell("Dịch vụ", fontBold));
            
            PdfPTable fourColTable = new PdfPTable(fourColumnWidth);
            
            fourColTable.addCell(new PdfPCell(new Paragraph("Tên dịch vụ", fontBold12)));
            fourColTable.addCell(new PdfPCell(new Paragraph("Giá", fontBold12)));
            fourColTable.addCell(new PdfPCell(new Paragraph("Số lượng", fontBold12)));
            fourColTable.addCell(new PdfPCell(new Paragraph("Tổng tiền", fontBold12)));
            
            PdfPTable fourColTable2 = new PdfPTable(fourColumnWidth);
            for (ServiceRoom serviceRoom : serviceRooms) {
                Service service = serviceDAO.selectById(serviceRoom.getIdService());
                fourColTable2.addCell(new PdfPCell(new Paragraph(
                        service.getName(), font)));
                fourColTable2.addCell(new PdfPCell(new Paragraph(
                        numberFormat.format(service.getPrice()), font)));
                fourColTable2.addCell(new PdfPCell(new Paragraph(
                        serviceRoom.getQuantity()+"", font)));
                fourColTable2.addCell(new PdfPCell(new Paragraph(
                        numberFormat.format(service.getPrice()*serviceRoom.getQuantity()), font)));
            }
            PdfPTable threeColTableTotalService = new PdfPTable(threeColumnWidth100);
            threeColTableTotalService.addCell(createCell("Tổng tiền dịch vụ:", fontBold12));
            threeColTableTotalService.addCell(createCell(totalService, fontBold12));
            threeColTableTotalService.addCell(createCell("", font));
            
            document.add(image);
            document.add(table);
            document.add(new Paragraph("\n"));
            document.add(divider);
            document.add(new Paragraph("\n"));
            document.add(twoColTable);
            document.add(threeColTableTotalRoom);
            document.add(new Paragraph("\n"));
            document.add(divider);
            document.add(tableTitle);
            document.add(new Paragraph("\n"));
            document.add(fourColTable);
            document.add(fourColTable2);
            document.add(threeColTableTotalService);
            document.add(new Paragraph("\n"));
            document.add(divider);
            document.add(new Paragraph("\n"));
            PdfPTable tbTotal = new PdfPTable(2);
            tbTotal.addCell(createCell("Tổng cộng: ", fontBold));
            tbTotal.addCell(createCell(totalAll, fontBold));
            document.add(tbTotal);
            document.close();

            System.out.println("Hóa đơn đã được tạo thành công.");

        } catch (DocumentException | IOException e) {
            e.printStackTrace();
        }
    }
    private static int calculateDays(Date startDate, Date endDate) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String startDateStr = dateFormat.format(startDate);
        String endDateStr = dateFormat.format(endDate);

        DateTimeFormatter formatter =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDate start = LocalDate.parse(startDateStr,formatter);
        LocalDate end = LocalDate.parse(endDateStr.toString(),formatter);
        int result =  (int) ( end.toEpochDay() - start.toEpochDay());
        if (result== 0) {
            return 1;
        }
        return result;
    }

    private static int calculateHours(Date startDate, Date endDate) {
        long difference = endDate.getTime() - startDate.getTime();
        return (int) (difference /(60*60*1000))+1;
    }

    public static PdfPCell createCell(String string,Font font) {
        PdfPCell cell = new PdfPCell();
        cell.addElement(new Paragraph(string, font));
          cell.setBorder(Rectangle.NO_BORDER);
          return cell;
    }
     
}


