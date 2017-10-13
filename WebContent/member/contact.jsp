<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="example/example.css">
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/components.css">
  <!-- This is what you need -->
  <script src="http://localhost:8080/BuyNsell/external/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/shake/sweetalert.css">
</head>
<body>

	<%
	String name = request.getParameter("contactName");
	String email = request.getParameter("contactEmail");
	String subject = request.getParameter("contactSubject");
	String message = request.getParameter("contactMessage");
	
	System.out.println(message);
	int i=0;
	String JDBC_DRIVER="com.mysql.jdbc.Driver";
	String DB_URL="jdbc:mysql://localhost/uas" ;
	Class.forName("com.mysql.jdbc.Driver");
	 
	 Connection conn = DriverManager.getConnection(DB_URL,"root","");
	 
	 Statement st = conn.createStatement();
	 ResultSet rs;
	 
	 i=st.executeUpdate("insert into contactTable values ('"
						+ name
						+ "','"
						+ email
						+ "','"
						+ subject
						+ "','" 
						+ message 
						+ "')");
		if (i > 0) {%>
			<script>
				swal(
						  'Successful',
						  '',
						  'success'
						)
						
		setTimeout(function() {
        document.location = "index.jsp#contact"; }, 1500);	   
				
			</script>
			 
		<%} else {
			response.sendRedirect("contact.jsp");
		}
	%>


</body>
</html>