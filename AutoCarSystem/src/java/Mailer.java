import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;
  
public class Mailer {  

public static void main(String args[]){
    String to = "kezama1231@gmail.com";//change accordingly  
      String from = "kezama1231@gmail.com";
      String pass = "Copythat1";
      String host = "smtp.gmail.com";//or IP address  
  
     //Get the session object  
      Properties properties = System.getProperties();  
      properties.put("mail.smtp.host", "smtp.gmail.com");
      properties.put("mail.smtp.port", "587");
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.starttls.enable", "true");
      properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
      Session session = Session.getInstance(properties,new javax.mail.Authenticator() {  
      protected PasswordAuthentication getPasswordAuthentication() {  
    return new PasswordAuthentication(from,pass);  
      }  
    });  
  
     //compose the message  
      try{  
         MimeMessage message = new MimeMessage(session);  
         message.setFrom(new InternetAddress(from));  
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
         message.setSubject("Ping");  
         message.setText("Hello, this is example of sending email  ");  
  
         // Send message
         Transport.send(message);  
         System.out.println("message sent successfully....");  
  
      }catch (MessagingException mex) {mex.printStackTrace();}
}

}  