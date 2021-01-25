/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author asus
 */
public class Mailer {
    public static void send(String recipient, String subject, String msg) {
        final String user = "berjayaengineeringsdnbhd@gmail.com";
        final String pass = "@Kennedy1";
        
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
});
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("mail4@mail.com"));
            InternetAddress[] iAdressArray = InternetAddress.parse(recipient);
            message.setRecipients(Message.RecipientType.CC, iAdressArray);
            
            message.setSubject(subject);
            message.setText(msg);
            
            Transport.send(message);
            
        } catch (MessagingException e){
            throw new RuntimeException(e);
        }
        
    }
    
}


