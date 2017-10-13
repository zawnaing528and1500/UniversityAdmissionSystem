<%@page import="com.DB.*" %>
<%@page import="report.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Universities</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
 <link href="http://localhost:8080/UniversityAdmissionSystem/external/css/hover.css" rel="stylesheet" media="all">
 <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/plus.js"></script>
</head>
<body class="size-1140">

<header>
<center>
	
	<form action="searchStudent.jsp">
					<center>
					<table class="">
				        <tr>
				        <td>
				        <a href="admin.jsp">
				        <img src="http://localhost:8080/UniversityAdmissionSystem/external/img/home1.png" class="hvr-pulse">
				        </a>
				        </td>
				        <td>
				         <INPUT TYPE="radio" NAME="type" VALUE="K" required>
				            <font color="chocolate" class="hvr-shadow-radial"><b>Keyword</b></font>
				        </td>
				        <td>
				            <INPUT TYPE="radio" NAME="type" ALT="m/f" VALUE="G" required>
				              <font color="#fff" class="hvr-shadow-radial"><b>Gender</b></font>
				        </td>
				         <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="N" required>
				              <font color="#fff" class="hvr-shadow-radial"><b>NRC</b></font>
				        </td>
				        <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="R" required>
				             <font color="chocolate" class="hvr-shadow-radial"><b>Roll Number</b></font>
				        </td>
				         <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="T" required>
				             <font color="#fff" class="hvr-shadow-radial"><b>Mark</b></font>
				        </td>
				        <td class="report"><a href="addNewStudent.jsp"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/addNewUser.png" class="hvr-pulse"></a></td>
				        <td class="report"><a href="generateReportForStudent.jsp"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/report.png" class="hvr-pulse"></a></td>
				         </tr>
			         </table>
			         </center>
	<input type="text" name="keyword" placeholder="Enter here to search Student" required>
	</form>

</center>
</header>
<%

String url = request.getRequestURL().toString();
String q = request.getQueryString();
String p;
url = url+"?"+q;

session.setAttribute("url", url);

String keyword = request.getParameter("keyword");
String searchType = request.getParameter("type");

System.out.println(keyword);
System.out.println(searchType);


if(searchType == null)
{
	searchType = "K";
}


searchStudent dbObj=new searchStudent();
dbObj.getConnection();
int size = 0;
String s=request.getParameter("start");
String e=request.getParameter("end");
int start=0,end=0;

if(s==null || e==null)
{
	start=0;end=10;	
}
else
{
	start=Integer.parseInt(s);
	end=Integer.parseInt(e);
}

if(keyword == null)
{
	keyword = "a";
	size = dbObj.countKeyword("a");//get the count of universities that has "a" keyword
}
else{
	size = dbObj.countThreeType(searchType, keyword);//get the count of K,C,M,F
}

session.setAttribute("searchType", searchType);
session.setAttribute("keyword", keyword);

ResultSet rs1 = dbObj.searchThreeType(searchType,keyword,start, end);


if(!(rs1.next()))
{%>
	<br>
	<br>
	<div class="box">
	<center><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/no-result.png"></center>
	<br>
	<br>
	<br>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<% 
}
else
{ 
	%>
	<table bgcolor="white">
	<tr><th><font color="chocolate" size="3px">Number</font></th><th><font color="chocolate" size="3px">Student Name</font></th><th><font color="chocolate" size="3px">NRC</font></th><th><font color="chocolate" size="3px">Roll Number</font></th><th><font color="chocolate" size="3px">Subject Type</font></th><th><font color="chocolate" size="3px">Subject 1 Mark</font></th><th><font color="chocolate" size="3px">Subject 2 Mark</font></th><th><font color="chocolate" size="3px">Subject 3 Mark</font></th><th><font color="chocolate" size="3px">Subject 4 Mark</font></th><th><font color="chocolate" size="3px">Subject 5 Mark</font></th><th><font color="chocolate" size="3px">Subject 6 Mark</font></th><th><font color="chocolate" size="3px">Total Mark</font></th><th colspan="2">Functions</th></tr>
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
<tr><td><%= i %><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/myPage.png"></td><td><%= studentName %></td><td><%= NRC %></td><td><%= studentRollNumber %></td><td><%= subjectTypeName %></td><td><%= subject1Mark %></td><td><%= subject2Mark %></td><td><%= subject3Mark %></td><td><%= subject4Mark %></td><td><%= subject5Mark %></td><td><%= subject6Mark %></td><td><%= totalMark %></td><td><a href="deleteStudent.jsp?id=<%= id %>"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/deleteSavedAds.png"></a><td><a href="editStudent.jsp?id=<%= id %>"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/edit.png"></a></td></tr>
<% 	
}
%>
</table>
<% 
}
		if(start==0 && end<size){ %>
			<br>
			<a href="searchStudent.jsp?start=<%=start+10%>&end=<%=end%>&type=<%= searchType %>&keyword=<%= keyword %>#allAds"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/next2.png" align="right"></a>
			<%} 
			else if(start!=0 && (start+end)<size){%>
			<a href="searchStudent.jsp?start=<%=start-10%>&end=<%=end%>&type=<%= searchType %>&keyword=<%= keyword %>#allAds"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/previous1.png" align="left"></a>
			<a href="searchStudent.jsp?start=<%=start+10%>&end=<%=end%>&type=<%= searchType %>&keyword=<%= keyword %>#allAds"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/next2.png" align="right"></a>
			<%} 
			else if(start!=0 && (start+end)>size){%>
			<a href="searchStudent.jsp?start=<%=start-10%>&end=<%=end%>&type=<%= searchType %>&keyword=<%= keyword %>#allAds"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/previous1.png" align="left"></a>
		    <%}%> 	
</body>
</html>