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
<title>Search Universities</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
 <link href="http://localhost:8080/UniversityAdmissionSystem/external/css/hover.css" rel="stylesheet" media="all">
 <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/plus.js"></script>
</head>
<body class="size-1140">
<div class="loader"></div>
<header>
<center>
	
	<form action="admin.jsp#allAds">
					<center>
					<table class="box">
				        <tr>
				        <td><a href="addUniversity.jsp"><font color="blue"><img src='http://localhost:8080/UniversityAdmissionSystem/external/img/icon/add.png'></font></a></td>
				        <td>
				         <INPUT TYPE="radio" NAME="type" VALUE="K" required>
				            <font color="chocolate" class="hvr-shadow-radial"><b>Keyword</b></font>
				        </td>
				        <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="C" required>
				              <font color="#fff" class="hvr-shadow-radial"><b>City</b></font>
				        </td>
				         <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="S" required>
				              <font color="#fff" class="hvr-shadow-radial"><b>State/Region</b></font>
				        </td>
				        <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="M" required>
				             <font color="chocolate" class="hvr-shadow-radial"><b>Male Mark</b></font>
				        </td>
				         <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="F" required>
				             <font color="#fff" class="hvr-shadow-radial"><b>Female Mark</b></font>
				        </td>
				        <td class="report"><a href="generateReport.jsp"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/report.png" class="hvr-pulse"></a></td>
				         </tr>
			         </table>
			         </center>
	<input type="text" name="keyword" placeholder="Enter here to search University" required>
	</form>

</center>
</header>
<%

String url = request.getRequestURL().toString();
String q = request.getQueryString();
String p;
String Price = "";
String picture="<img src='http://localhost:8080/UniversityAdmissionSystem/external/img/cart.png'>";
url = url+"?"+q+"#allAds";

session.setAttribute("url", url);

String keyword = request.getParameter("keyword");
String searchType = request.getParameter("type");

System.out.println(keyword);
System.out.println(searchType);


if(searchType == null)
{
	searchType = "K";
}


searchUniversity dbObj=new searchUniversity();
dbObj.getConnection();
int size = 0;
String s=request.getParameter("start");
String e=request.getParameter("end");
int start=0,end=0;

if(s==null || e==null)
{
	start=0;end=5;	
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
session.removeAttribute("titleForComment");
rs1.beforeFirst();
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
		<div class="s-12 l-five">
		<div class="box-dark">
			<table bgColor  = "white" class="one">
			<tr><td colspan="2" class="bodyText"><font color="orange"><%= universityName %></font></td></tr>
			<tr><td colspan="2"><a href="viewDetail.jsp?name=<%= universityName %>"><img src="printImage.jsp?name=<%= universityName %>" class="button cta hvr-float-shadow"></a></td></tr>
			<tr><td><font color="#E9967A" class="bodyText"><%= likeCount %>likes&nbsp<a href="likeAds.jsp?title=<%= universityName %>" class="button cta hvr-float-shadow"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/like.png"></a></font></td><td><a href="viewComment.jsp?id=<%= id %>&title=<%= universityName%>"><font color="chocolate">view comment</font></a></td></tr>
			<tr><td><font color="#E9967A">Male Mark-</font></td><td><%= minMarkForMale %>Marks</td></tr>
			<tr><td><font color="#E9967A">Female Mark-</font></td><td><%= minMarkForFemale %>Marks</td></tr>
			<tr><td><a href="deleteAds.jsp?id=<%= id %>"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/deleteSavedAds.png"></a><td><a href="checkForEditUniversity.jsp?id=<%= id %>"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/edit.png"></a></td></tr>
			</table>
		</div>
		</div>	
<% 	
}
}
%>
<hr/>
<hr/>
<%
		if(start==0 && end<size){ %>
			<br>
			<a href="admin.jsp?start=<%=start+5%>&end=<%=end%>&type=<%= searchType %>&keyword=<%= keyword %>#allAds"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/next2.png" align="right"></a>
			<%} 
			else if(start!=0 && (start+end)<size){%>
			<a href="admin.jsp?start=<%=start-5%>&end=<%=end%>&type=<%= searchType %>&keyword=<%= keyword %>#allAds"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/previous1.png" align="left"></a>
			<a href="admin.jsp?start=<%=start+5%>&end=<%=end%>&type=<%= searchType %>&keyword=<%= keyword %>#allAds"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/next2.png" align="right"></a>
			<%} 
			else if(start!=0 && (start+end)>size){%>
			<a href="admin.jsp?start=<%=start-5%>&end=<%=end%>&type=<%= searchType %>&keyword=<%= keyword %>#allAds"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/icon/previous1.png" align="left"></a>
		    <%}%> 	
</body>
</html>