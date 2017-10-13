<%@page import="com.DB.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="example/example.css">
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>

  <!-- This is what you need -->
  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String JDBC_DRIVER="com.mysql.jdbc.Driver";
String DB_URL="jdbc:mysql://localhost/uas";

Class.forName("com.mysql.jdbc.Driver");

Connection conn = DriverManager.getConnection(DB_URL,"root","");

Statement st = conn.createStatement();
String email=request.getParameter("email");
String nrc=request.getParameter("nrc");
String roll=request.getParameter("roll");
String name =request.getParameter("name");
String phone =request.getParameter("phone");
String spassword =request.getParameter("password");
session.setAttribute("name",name);
session.setAttribute("nrc",nrc);
session.setAttribute("roll",roll);
session.setAttribute("email",email);
session.setAttribute("phone",phone);
session.setAttribute("password",spassword);
ResultSet rs1;
String sql="select * from studenttable where NRC='"+nrc+"' and studentRollNumber = '"+roll+"'";
rs1=st.executeQuery(sql);
if(!(rs1.next()))
{
%>
		<script>

		swal("There is no NRC and Roll Number matched!", "Please try another", "error");
		setTimeout(function() {
			document.location = "http://localhost:8080/UniversityAdmissionSystem/index/index.jsp"; }, 2000);	
		</script>
		<% 
	
}
else{
	response.sendRedirect("checkEmailRegister.jsp");
}
%>
	
</body>
</html>