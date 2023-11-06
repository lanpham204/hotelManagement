/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phamn
 */
public class XDate {
    static SimpleDateFormat dateFormat = new SimpleDateFormat();
    public static Date toDate(String date,String pattern) {
        dateFormat.applyPattern(pattern);
        try {
            return dateFormat.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(XDate.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static String toString(Date date,String pattern) {
        dateFormat.applyPattern(pattern);
        return dateFormat.format(date);
    }
    public static Date addDays(Date date,long days) {
        date.setTime(date.getTime()+ days+24*60*60*1000);
        return date;
    }
}
