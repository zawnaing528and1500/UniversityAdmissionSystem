<%@page import="com.DB.*" %>
<%@page import="report.*" %>
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
<title>report</title>
<link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/responsee.css">
<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="loader"></div>
<%

String keyword = session.getAttribute("keyword").toString();
String searchType = session.getAttribute("searchType").toString();


if(searchType == null)
{
	searchType = "K";
}
if(keyword == null)
{
	keyword = "a";
}

searchStudent s = new searchStudent();
s.getConnection();
ResultSet rs1 = s.searchThreeTypeForReport(searchType, keyword);
%>

<center>
<table bgcolor="white">
<tr>
<tr><th><font color="chocolate">Number</font></th><th><font color="chocolate">Student Name</font></th><th><font color="chocolate">NRC</font></th><th><font color="chocolate">Roll Number</font></th><th><font color="chocolate">Subject Type</font></th><th><font color="chocolate">Subject 1 Mark</font></th><th><font color="chocolate">Subject 2 Mark</font></th><th><font color="chocolate">Subject 3 Mark</font></th><th><font color="chocolate">Subject 4 Mark</font></th><th><font color="chocolate">Subject 5 Mark</font></th><th><font color="chocolate">Subject 6 Mark</font></th><th><font color="chocolate">Total Mark</font></th></tr>
</tr>
<% 
int i = 0;
rs1.beforeFirst();
while(rs1.next())
{
	i = i +1;
	int id = rs1.getInt("studentId");
	String studentName = rs1.getString("studentName");
	String NRC = rs1.getString("NRC");
	String studentRollNumber = rs1.getString("studentRollNumber");
	int subjectTypeId = rs1.getInt("subjectType");
	int subject1Mark = rs1.getInt("subject1Mark");
	int subject2Mark = rs1.getInt("subject2Mark");
	int subject3Mark = rs1.getInt("subject3Mark");
	int subject4Mark = rs1.getInt("subject4Mark");
	int subject5Mark = rs1.getInt("subject5Mark");
	int subject6Mark = rs1.getInt("subject6Mark");
	int totalMark = rs1.getInt("totalMark");
	Report r = new Report();
	r.getConnection();
	String subjectTypeName = r.getSubjectTypeName(subjectTypeId);
	%>
<tr><td><%= i %></td><td><%= studentName %></td><td><%= NRC %></td><td><%= studentRollNumber %></td><td><%= subjectTypeName %></td><td><%= subject1Mark %></td><td><%= subject2Mark %></td><td><%= subject3Mark %></td><td><%= subject4Mark %></td><td><%= subject5Mark %></td><td><%= subject6Mark %></td><td><%= totalMark %></td></tr>
<% 	
}
%>
<tr><td colspan="12"><center><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/print.png" onclick="window.print()"></center></td></tr>
</table>
</center>
		 <script type="text/javascript">
         jQuery(document).ready(function($) {	
        	$(".loader").fadeOut("slow");
         });
         </script>
</body>
</html>