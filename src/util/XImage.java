/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.awt.Image;
import java.awt.desktop.FilesEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

/**
 *
 * @author phamn
 */
public class XImage {
//    public static Image getAppIcon() {
//        URL url = XImage.class.getResource("/icon/logo-small.png");
//        return new  ImageIcon(url).getImage();
//    }
    public static void save(File src) {
        File dst  = new File("src/logos",src.getName());
        if(!dst.getParentFile().exists()) {
            dst.getParentFile().mkdirs();
        }
        Path form = Paths.get(src.getAbsolutePath());
        Path to = Paths.get(dst.getAbsolutePath());
        try {
            Files.copy(form, to,StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException ex) {
            Logger.getLogger(XImage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static ImageIcon read(String fileName,int width,int height) {
        File path = new File("src/logos", fileName);
        if(!path.exists()) {
            return null;
        }
        try {
            BufferedImage originalImage = ImageIO.read(path);
            if(originalImage!= null) {
                Image resizedImage = originalImage.getScaledInstance(width, height, Image.SCALE_SMOOTH);
                return new ImageIcon(resizedImage);
            }
        } catch (IOException ex) {
            Logger.getLogger(XImage.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return null;
    }
    
}
