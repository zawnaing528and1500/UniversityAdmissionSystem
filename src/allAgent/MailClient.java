package allAgent;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailClient {

/**
 * Entry method
 * 
 * @param args
 *            String[]
 */
public static void main(String[] args) {

    MailClient client = new MailClient();

    try {
        client.sendMail("oasis.oasis528@gmail.com","Congradulation! Your admissible university is medical university");
    } catch (AddressException ae) {
        ae.printStackTrace();
    } catch (MessagingException me) {
        me.printStackTrace();
    }

}

public void sendMail(String mailTo, String message) throws AddressException, MessagingException {

	 Properties props = new Properties();  
	    props.setProperty("mail.transport.protocol", "smtp");     
	    props.setProperty("mail.host", "smtp.gmail.com");  
	    props.put("mail.smtp.auth", "true");  
	    props.put("mail.smtp.port", "465");  
	    props.put("mail.debug", "true");  
	    props.put("mail.smtp.socketFactory.port", "465");  
	    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
	    props.put("mail.smtp.socketFactory.fallback", "false");
    final String username = "ministryofeducation98@gmail.com";
    final String password = "@education12";
    Session session = Session.getDefaultInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

    // -- Create a new message --
    Message msg = new MimeMessage(session);
    msg.setFrom(new InternetAddress("ministryofeducation98@gmail.com"));
    msg.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(mailTo, false));
    msg.setSubject("Ministry of Education");
    msg.setSentDate(new Date());

    // **************** Without Attachments ******************
    msg.setText(message);


    Transport.send(msg);
    System.out.println("Message sent.");

}

}