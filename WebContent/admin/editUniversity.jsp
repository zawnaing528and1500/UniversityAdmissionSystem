<%@page import="allocate.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery.autocomplete.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/currency-autocomplete.js"></script>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit University</title>

<script type="text/javascript">
document.getElementById("newPrice").disabled = true;
</script>

</head>
<body>
 <div class="loader"></div>

		        <video autoplay  poster="http://localhost:8080/UniversityAdmissionSystem/external/img/.jpg" id="videobg" loop>
                <source src="http://localhost:8080/UniversityAdmissionSystem/external/video/b1.mp4" type="video/mp4">
				</video>
<% 
String id1 = session.getAttribute("id").toString();	
int id = Integer.parseInt(id1);

MakeApplying ads = new MakeApplying();
ads.getConnection();
ResultSet rs1 = ads.getUniversityById(id);
while(rs1.next())
{
	String universityName = rs1.getString("universityName");
	String city = rs1.getString("city");
	String region = rs1.getString("region");
	int minMarkForMale = rs1.getInt("minMarkForMale");
	int minMarkForFemale = rs1.getInt("minMarkForFemale");
	int maleCapacity = rs1.getInt("maleCapacity");
	int femaleCapacity = rs1.getInt("femaleCapacity");
	int totalCapacity = rs1.getInt("totalCapacity");
	int currentMaleCapacity = rs1.getInt("currentMaleCapacity");
	int currentFemaleCapacity = rs1.getInt("currentFemaleCapacity");
	int currentTotalCapacity = rs1.getInt("currentTotalCapacity");
	String description = rs1.getString("description");

%>
<div class="box">
<center><font class="bodyText" color="#E9967A">Edit University</font></center>
<form class=".form-basic" action="updateUniversity.jsp" method="POST">

					<center><div class="line"><img src="printImage.jsp?name=<%= universityName %>"></div></center>
					
					<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">University Name</font><br><input type="text" name="universityName" value="<%=universityName %>" required></div>
					<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">City</font><br><input type="text" name="city" value="<%=city %>" required></div>
					<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Region</font><br><input type="text" name="region" value="<%= region %>" required></div>
					<div class="s-12 m-6 l-6 margin-bottom"><font color="#FFDEAD">Male Mark</font><br><input type="text" name="minMarkForMale" value="<%= minMarkForMale %>" required></div>
					<div class="s-12 m-6 l-6 margin-bottom"><font color="#FFDEAD">Female Mark</font><br><input type="text" name="minMarkForFemale" value="<%= minMarkForFemale%>" required></div>
					<div class="s-12 m-6 l-6 margin-bottom"><font color="#FFDEAD">Male Capacity</font><br><input type="text" name="maleCapacity" value="<%= maleCapacity %>" required></div>
					<div class="s-12 m-6 l-6 margin-bottom"><font color="#FFDEAD">Female Capacity</font><br><input type="text" name="femaleCapacity" value="<%= femaleCapacity %>" required></div>
					<font color="#FFDEAD">Enter Description</font><br>
					<textarea row="50" col="50" name="description"required>
					<%=description %>
					</textarea>
			       

					<input type="submit" value="POST" id="input-submit">
	</form>
	</div>

<%
}
%>
</body>
 <script type="text/javascript">
         jQuery(document).ready(function($) {	
        	$(".loader").fadeOut("slow");
		   
         });	 
		 


      </script>
</html>