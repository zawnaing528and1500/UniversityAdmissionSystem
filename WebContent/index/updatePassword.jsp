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
<title>Insert title here</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString(); 
session.removeAttribute("email");
String pw=request.getParameter("password");
String cpw=request.getParameter("confirm");
String JDBC_DRIVER="com.mysql.jdbc.Driver";
String DB_URL="jdbc:mysql://localhost/uas";
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection(DB_URL,"root","");
ResultSet rs1;
PreparedStatement stmt = conn.prepareStatement("update membertable set memberPassword=? where memberEmail=?");
stmt.setString(1,pw);
stmt.setString(2,email);
stmt.executeUpdate();
%>
	<script>
	swal("Sucessfully update your password!","success");
	
	</script>
	<%
	response.sendRedirect("http://localhost:8080/UniversityAdmissionSystem/index/index.jsp");
	%>
</body>
</html>