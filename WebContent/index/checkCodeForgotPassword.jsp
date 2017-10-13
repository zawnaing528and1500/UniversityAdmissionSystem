<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="example/example.css">
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
  <!-- This is what you need -->
  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<video autoplay  poster="http://localhost:8080/UniversityAdmissionSystem/external/img/.jpg" id="videobg" loop>
   <source src="http://localhost:8080/UniversityAdmissionSystem/external/video/b1.mp4" type="video/mp4">
	</video>
<%
String email=session.getAttribute("email").toString(); 
String code = request.getParameter("confirmCode");
String savedCode= (String)session.getAttribute("code");
if(code.equals(savedCode))
{
	 
	 %>
		<script>
			swal(
					  'Successfully',
					  'Your code is valid',
					  'success'
					)
					
			setTimeout(function() {
			document.location = "createNewPasswordForm.jsp"; }, 1500);	   
					
		</script>
	<%

}
else
{%>
	<script>
	swal(
			  'Unsuccessfull',
			  'Your confirmation code is invalid',
			  'error'
			)
			
	setTimeout(function() {
	document.location = "enterCodeFormForForgot.jsp"; }, 1500);	   
			
</script><%
	
}
%>

</body>
</html>