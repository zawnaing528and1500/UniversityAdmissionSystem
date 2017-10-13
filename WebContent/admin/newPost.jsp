<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.io.*"%>
<%@page import="com.DB.*" %>
<%@ page import="java.lang.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <script src="http://localhost:8080/BuyNsell/external/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/shake/sweetalert.css">
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
</head>
<body>

<% 
String universityName = request.getParameter("universityName");
String city = request.getParameter("city");
String region = request.getParameter("region");

String minMarkForMale1 = request.getParameter("minMarkForMale");
int minMarkForMale = Integer.parseInt(minMarkForMale1);

String minMarkForFemale1 = request.getParameter("minMarkForFemale");
int minMarkForFemale = Integer.parseInt(minMarkForFemale1);

String maleCapacity1 = request.getParameter("maleCapacity");
int maleCapacity = Integer.parseInt(maleCapacity1);

String femaleCapacity1 = request.getParameter("femaleCapacity");
int femaleCapacity = Integer.parseInt(femaleCapacity1);

int totalCapacity = maleCapacity + femaleCapacity;
String description = request.getParameter("description");
					
					FileInputStream fis = null;
					
					String p1="C:/Users/zaw naing/Desktop/image";
				
					String path =request.getParameter("uploadImage");
					
					p1+="/"+path;
					System.out.println("Path---------"+path);
					
					 File image = new File(p1);
					 fis = new FileInputStream(image);
					 String location=request.getParameter("currency"); 
				

					 	String DB_URL="jdbc:mysql://localhost/uas";
				
					 	Class.forName("com.mysql.jdbc.Driver");
					 
					 	Connection conn = DriverManager.getConnection(DB_URL,"root","");	
					
						PreparedStatement pstmt = null;
						//Statement st=conn.createStatement();
						//int i=st.executeUpdate("INSERT INTO producttable(memberId) VALUES (2)");
						pstmt = conn.prepareStatement("insert into specificuniversitytable(universityId, universityName, city, region, minMarkForMale, minMarkForFemale, maleCapacity, femaleCapacity, totalCapacity, currentMaleCapacity, currentFemaleCapacity,currentTotalCapacity, photo, description, likeCount,noGender) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
							
						
		                pstmt.setInt(1, 8);
		                pstmt.setString(2, universityName);
		                pstmt.setString(3, city);
		                pstmt.setString(4, region);
		                pstmt.setInt(5, minMarkForMale);
		                pstmt.setInt(6, minMarkForFemale);
		                pstmt.setInt(7, maleCapacity);
		                pstmt.setInt(8, femaleCapacity);
		                pstmt.setInt(9, totalCapacity);
		                pstmt.setInt(10, 0);
		                pstmt.setInt(11, 0);
		                pstmt.setInt(12, 0);
		            
		               	pstmt.setBinaryStream(13, (InputStream) fis, (int) (image.length()));		              
		                
		                pstmt.setString(14, description);
		                pstmt.setInt(15, 11);
		                pstmt.setString(16, "yes");
		                
		               
					
					int i = pstmt.executeUpdate(); 
					
					if (i > 0) {
						%>
						<script>
						swal("Sucess", "University have been addeded successful.", "success");
						</script>
						<% 
						response.sendRedirect("admin.jsp");
					} else {
						System.out.println("The image did not insert successfully");
						//response.sendRedirect("index.jsp");
					}
					
					 
					pstmt.close();
					conn.close();
    
    
%>
</body>
</html>