<%@ page import="java.sql.*" %>
<%@ page import="allocate.*" %>
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

String code = request.getParameter("confirmCode");
String savedCode= (String)session.getAttribute("code");

String name = (String)session.getAttribute("name");
String nrc = (String)session.getAttribute("nrc");
String roll = (String)session.getAttribute("roll");
String ph = (String)session.getAttribute("phone");
String email = (String)session.getAttribute("email");
String pass = (String)session.getAttribute("password");
MakeApplying m = new MakeApplying();
m.getConnection();
int studentId = m.getStudentId(roll);

Calendar now = Calendar.getInstance();

String startDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
Date startdate=Date.valueOf(startDate);

if(code.equals(savedCode))
{
	 
	 String DB_URL="jdbc:mysql://localhost/uas" ;
	 Class.forName("com.mysql.jdbc.Driver");	 
	 Connection conn = DriverManager.getConnection(DB_URL,"root","");	 
	 Statement st = conn.createStatement();
	 st.executeUpdate("insert into membertable values ("+studentId+",'"
		+ name
		+ "','"
		+ email
		+ "','"
		+ ph
		+ "','" 
		+ pass
		+ "','" 
		+ startDate
		+ "')"); 
	 
	 
	 session.removeAttribute("name");
	 session.removeAttribute("nrc");
	 session.removeAttribute("roll");
	 session.removeAttribute("email");
	 session.removeAttribute("phone");
	 session.removeAttribute("password");
	 session.removeAttribute("comfirmCode");
	 session.removeAttribute("code");
	 
	 %>
		<script>
			swal(
					  'register successfully',
					  'Your code is valid',
					  'success'
					)
					
			setTimeout(function() {
			document.location = "http://localhost:8080/UniversityAdmissionSystem/index/index.jsp"; }, 1500);	   
					
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
	document.location = "enterCodeForm.jsp"; }, 1500);	   
			
</script><%
	
}
%>

</body>
</html>