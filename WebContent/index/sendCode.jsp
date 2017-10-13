<%@ page import="java.util.Date,javax.mail.internet.MimeMessage,javax.mail.internet.InternetAddress,javax.mail.Transport,java.util.Properties,javax.mail.internet.AddressException,javax.mail.Session,javax.mail.Authenticator,javax.mail.Message,javax.mail.MessagingException,javax.mail.PasswordAuthentication"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.DB.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form>
<%

String mailTo =session.getAttribute("email").toString();
GenerateCode g = new GenerateCode();
int random = g.generateRandom();

String host = "smtp.gmail.com";
String port = "587";
String mailFrom = "ministryofeducation98@gmail.com";
String password = "@education12";



String subject = "Sending Email Again";

// message contains HTML markups
String code=Integer.toString(random);
session.setAttribute("code",code);

String message = "Your Confirmation Code is\t"+code;

HtmlEmailSender s=new HtmlEmailSender();
s.sendHtmlEmail(host, port, mailFrom, password, mailTo,
        subject, message);

response.sendRedirect("enterCodeForm.jsp");
%>
</form>
</body>
</html>