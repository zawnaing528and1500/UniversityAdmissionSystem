package allAgent;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.DB.*;
public class SendEmail {

	
	public SendEmail() {
		// TODO Auto-generated constructor stub
	}

	public void sendEmailToAdmissibleStudent()
	{
		
		DBTest d = new DBTest();
		d.getConnection();
		ResultSet rs1 = d.getAdmissibleStudent();
		try {
			while(rs1.next())
			{
			int studentId = rs1.getInt("studentId");
			int universityId = rs1.getInt("specificUniversityId");
			
			DBTest d1 = new DBTest();
			d1.getConnection();
			String admissibleUniversity = d1.getUniversity(universityId);
			
			String mailTo =d1.getStudentEmail(studentId);

			String message = "Your Admissible University is\t"+admissibleUniversity;

			
			MailClient m = new MailClient();
			m.sendMail(mailTo, message);
			
			//System.out.println("Emails have been sent!");
			}
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args)
	{
		SendEmail s = new SendEmail();
		s.sendEmailToAdmissibleStudent();
	}
}
