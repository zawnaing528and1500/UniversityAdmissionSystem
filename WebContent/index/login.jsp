<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="example/example.css">
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
  <!-- This is what you need -->
  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
  </head>
  <body>
  
  
   <video autoplay  poster="http://localhost:8080/UniversityAdmissionSystem/external/img/.jpg" id="videobg" loop>
   <source src="http://localhost:8080/UniversityAdmissionSystem/external/video/b1.mp4" type="video/mp4">
   </video>
	
	
<%
	String userName = request.getParameter("username");
	String password = request.getParameter("password");

	String JDBC_DRIVER="com.mysql.jdbc.Driver";
	 String DB_URL="jdbc:mysql://localhost/uas";

	 Class.forName(JDBC_DRIVER);
	 
	 Connection conn = DriverManager.getConnection(DB_URL,"root","");
	
	Statement st = conn.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select * from membertable where memberEmail='"
			+ userName + "' and memberPassword='" + password + "'");
	if (rs.next()) {
		int id = rs.getInt(1);
		String memberEmail = rs.getString("memberEmail");
		session.setAttribute("currentUser", userName);	
		session.setAttribute("currentUserId", id);
		if(memberEmail.equals("administrator@gmail.com"))
		{
			response.sendRedirect("http://localhost:8080/UniversityAdmissionSystem/admin/admin.jsp");	
		}
		else
		{
		response.sendRedirect("http://localhost:8080/UniversityAdmissionSystem/member/member.jsp");
		}
		} else {%>
	<script>
		swal(
				  'Log in unsuccessfull',
				  'Please try again',
				  'error'
				)
				
		setTimeout(function() {
		document.location = "http://localhost:8080/UniversityAdmissionSystem/index/index.jsp"; }, 2000);	   
				
	</script>
<%		/* response.sendRedirect("checkAdmin.jsp"); */
	}
%>
</body>
</html>