<%@page import="com.DB.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Send email</title>    
     <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
    
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
<%
String email=request.getParameter("mail");
String phone=request.getParameter("ph");
session.setAttribute("email",email);
session.setAttribute("phone",phone);

String JDBC_DRIVER="com.mysql.jdbc.Driver";
String DB_URL="jdbc:mysql://localhost/uas";
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection(DB_URL,"root","");
Statement st = conn.createStatement();
ResultSet rs1;
String sql="select * from membertable where memberEmail='"+email+"' and memberPhoneNumber='"+phone+"'";
rs1=st.executeQuery(sql);
if(rs1.next())
{
	%><script>
	swal("Correct", "Your email and phone number are matched", "success");
	window.location="sendCodeForForgot.jsp";
	</script><%
	}
else{
	%><script> 
	swal("Please try again", "Your email and phone number doesn't exit", "error");
	window.location="http://localhost:8080/UniversityAdmissionSystem/index/index.jsp";
	</script><%
	
}

%>

</body>
</html>