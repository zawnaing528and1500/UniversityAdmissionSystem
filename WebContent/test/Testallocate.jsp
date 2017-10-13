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
<title>Student Allocation</title>
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

<%
int minMark = 0,capacity = 0,limitCapacity = 0;

MakeApplying m = new MakeApplying();
m.getConnection();
ResultSet rs = m.getStudentApply();

while(rs.next())
{
int currentStudentId = rs.getInt(1);
int currentUniversityIdOpt1 = rs.getInt(2);


int markForCurrentStudent = m.getMark(currentStudentId);
String gendeForCurrentStudent = m.getGender(currentStudentId);

MakeApplying m1 = new MakeApplying();
m1.getConnection();
ResultSet rs1 = m1.getAllUniversities();
while(rs1.next())
{
	int universityId = rs1.getInt(1);
	
	if(universityId == currentUniversityIdOpt1)
	{
		int currentTotalCapacity = rs1.getInt("currentTotalCapacity");
		int limitTotalCapacity = rs1.getInt("totalCapacity");
		
		if(gendeForCurrentStudent.equals("m"))
		{
			 capacity = rs1.getInt("currentMaleCapacity");
			 limitCapacity = rs1.getInt("maleCapacity");
			 minMark = rs1.getInt("minMarkForMale");
		}
		else
		{
		 capacity = rs1.getInt("currentFemaleCapacity");
		 limitCapacity = rs1.getInt("femaleCapacity");
		 minMark = rs1.getInt("minMarkForFemale");
		}
		
		if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity)
		{
			m1.increaseCapacity(gendeForCurrentStudent, currentUniversityIdOpt1);
			m1.allocate(currentStudentId, currentUniversityIdOpt1);
			//m1.setDesire(currentStudentId);
		}
		
	}
}
}
%>

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