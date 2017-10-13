<%@ page import="java.util.Date,javax.mail.internet.MimeMessage,javax.mail.internet.InternetAddress,javax.mail.Transport,java.util.Properties,javax.mail.internet.AddressException,javax.mail.Session,javax.mail.Authenticator,javax.mail.Message,javax.mail.MessagingException,javax.mail.PasswordAuthentication"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.*"%>

 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Send email</title>
    
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/buttons.css">
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-ui.min.js"></script>    
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/responsee.js"></script>
      <script src='http://localhost:8080/UniversityAdmissionSystem/external/js/buttons.js'></script>
      <style type="text/css">
      #contactButton{font-family:"Monotype Corsiva";background-color:rbg(62,173,154);}
      </style>
    </head>
    <body>
    
    			<video autoplay  poster="http://localhost:8080/UniversityAdmissionSystem/external/img/poster.jpg" id="videobg" loop>
                <source src="http://localhost:8080/UniversityAdmissionSystem/external/video/b1.mp4" type="video/mp4">
				</video>
		         <br>
         <br>     
         <%String email=session.getAttribute("email").toString(); %>
         <div class="" id="email">
            <div class="margin">
				<div class="box">
					 <form action="checkCodeForgotPassword.jsp" method="POST">
					<p>The code has been sent to your email.<br>Check your Email!</p>
					<input type="text" name="confirmCode" placeholder="please enter your code" required>
					<input type="submit" value="SENT" class="sendButton">
					</form>
				
				</div>
            </div>
         </div>	   
    </body>
    </html>