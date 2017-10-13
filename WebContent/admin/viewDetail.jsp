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
<title>view Detail</title>

<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
 <link href="http://localhost:8080/BuyNsell/external/css/hover.css" rel="stylesheet" media="all">
 <script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/plus.js"></script>
 <script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-1.8.3.min.js"></script>
<script src='http://localhost:8080/BuyNsell/external/js/buttons.js'></script>
<link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/buttons.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
 
 
</head>
<body class="size-960">
<div class="loader"></div>

<video autoplay  poster="http://localhost:8080/BuyNsell/external/img/poster.jpg" id="videobg" loop>
<source src="http://localhost:8080/BuyNsell/external/video/flower.mp4" type="video/mp4">
</video>
<br>
<br>
<center>
<div class="line">
<br>
<div class="">
<%
String p;
String shipping="";
String br = "";
String Price = "";
String   title1 = request.getParameter("name");
searchUniversity dbObj=new searchUniversity();
dbObj.getConnection();
ResultSet rs1 = dbObj.searchByKeyword(title1);
while(rs1.next())
{
	int id = rs1.getInt("specificUniversityId");
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
	int likeCount = rs1.getInt("likeCount");
%>	


<form>
<table bgColor="white">
	<tr>
	<td colspan="2">
	<font color="orange" class="bodyHeadText">
	<center>
	<%= universityName %>
	</center>
	</font>
	</td>
	</tr>
	
	<tr>
	<td colspan="2">
	<img class="hvr-shadow-radial" src="printImage.jsp?name=<%= universityName %>" width="200px" height="200px">
	</td>
	</tr>
	<tr colspan="2">
	<td><font color=""><%= description %></font></td>
	</tr>
	<tr class=""><td><font color="orange"><b>Male Capacity--</b><%= maleCapacity %></font></td><td><font color="orange"><b>Female Capacity--</b><%= femaleCapacity %></font></td></tr>
	<tr class=""><td><font color="orange"><b>Current Male Capacity--</b><%= currentMaleCapacity %></font></td><td><font color="orange"><b>Current Female Capacity--</b><%= currentFemaleCapacity %></font></td></tr>
	<tr class=""><td><font color="orange"><b>Min Mark For Male--</b><%= minMarkForMale %></font></td><td><font color="orange"><b>Min Mark For Female--</b><%= minMarkForFemale %></font></td></tr>
	<tr class=""><td><font color="#FFA07A"><%= region %></td></font><td><center><a onclick="document.getElementById('id02').style.display='block'"><img src="http://localhost:8080/BuyNsell/external/img/icon/comment.png" alt="write comment"></a></center></td></tr>
</table>
</form>

		<div id="id02" class="w3-modal">
  		<div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:500px">
		<form class="w3-container" action="commentAds.jsp">
		 	<div class="w3-section">
			 <span onclick="document.getElementById('id02').style.display='none'" class="w3-closebtn">&times;</span>
			      <textarea class="w3-input w3-border w3-margin-bottom" name="comment" placeholder="Enter your comment"></textarea>
			      <input type="hidden" name="id" value="<%= id%>"> <button  class="w3-btn-block w3-green w3-section w3-padding" type="submit">COMMENT</button>
			<script>		
			var modal = document.getElementById('id02');			
			window.onclick = function(event) {
			if (event.target == modal) {
			modal.style.display = "none";}
			}
			</script>
     	 	</div>
   		 </form>
 		 </div>
		</div>
<%
	}
%>
</div>
</div>
</center>
		 <script type="text/javascript">
         jQuery(document).ready(function($) {	
        	$(".loader").fadeOut("slow");
         });
         </script>
</body>
</html>