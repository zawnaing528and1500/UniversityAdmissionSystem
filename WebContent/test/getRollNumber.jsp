<%@page import="allocate.*" %>
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
 <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/components.css">
 <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/responsee.css">
  <script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-1.8.3.min.js"></script>
 <script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-ui.min.js"></script> 
</head>
<body>
<div class="loader"></div>
				<br>
				<br>
				<br>
<center>
<table bgcolor="white">
<%
GetRollNumberBegin g = new GetRollNumberBegin();
g.getConnection();
ResultSet rs = g.getRollNumberBegin();
while(rs.next())
{
	String rollNumberBegin = rs.getString(1);
	int number = g.generateRandom();
	String rollNumber = rollNumberBegin+"-"+number; 
%>
<tr><td><%= rollNumber %></td></tr>
<%	
}
%>
</table>
</center>
</body>

<script type="text/javascript">
         jQuery(document).ready(function($) {	
        	$(".loader").fadeOut("slow");

			
			
				$('a[href^="#"]').on('click', function(event) {
				var target = $(this.getAttribute('href'));
				if( target.length ) {
					event.preventDefault();
					$('html, body').stop().animate({
						scrollTop: target.offset().top
					}, 1000);
				}
			   });
		   
         });	 
		 


      </script>
</html>