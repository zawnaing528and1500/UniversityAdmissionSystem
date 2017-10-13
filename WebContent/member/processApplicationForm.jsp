<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
  <!-- This is what you need -->
  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String startWord1 = "",endWord1 = "", startWord2 = "",endWord2 = "",startWord3 = "",endWord3 = "", startWord4 = "",endWord4 = "", startWord5 = "",endWord5 = "", startWord6 = "",endWord6 = "";
String id1 = session.getAttribute("currentUserId").toString();
int id = Integer.parseInt(id1);

MakeApplying m = new MakeApplying();
m.getConnection();
String studentName = m.getStudentName(id);
int totalMark = m.getMark(id);
String gender = m.getGender(id);

String option1 = request.getParameter("option1");
String major1 = request.getParameter("major1");
String majorForForeign1 = request.getParameter("majorForForeign1");
String option2 = request.getParameter("option2");
String major2 = request.getParameter("major2");
String majorForForeign2 = request.getParameter("majorForForeign2");
String option3 = request.getParameter("option3");
String major3 = request.getParameter("major3");
String majorForForeign3 = request.getParameter("majorForForeign3");
String option4 = request.getParameter("option4");
String major4 = request.getParameter("major4");
String majorForForeign4 = request.getParameter("majorForForeign4");
String option5 = request.getParameter("option5");
String major5 = request.getParameter("major5");
String majorForForeign5 = request.getParameter("majorForForeign5");
String option6 = request.getParameter("option6");
String major6 = request.getParameter("major6");
String majorForForeign6 = request.getParameter("majorForForeign6");

//use == null to check major
//use "" to check majorForForeign

int opt1 = Integer.parseInt(option1);
int opt2 = Integer.parseInt(option2);
int opt3 = Integer.parseInt(option3);
int opt4 = Integer.parseInt(option4);
int opt5 = Integer.parseInt(option5);
int opt6 = Integer.parseInt(option6);

GetUniversityWithSubjectType g = new GetUniversityWithSubjectType();
g.getConnection();

option1 = g.getUniversityName(opt1);
option2 = g.getUniversityName(opt2);
option3 = g.getUniversityName(opt3);
option4 = g.getUniversityName(opt4);
option5 = g.getUniversityName(opt5);
option6 = g.getUniversityName(opt6);

System.out.println(option1);
System.out.println(option2);
System.out.println(option3);
System.out.println(option4);
System.out.println(option5);
System.out.println(option6);

System.out.println(major1);
System.out.println(major2);
System.out.println(major3);
System.out.println(major4);
System.out.println(major5);
System.out.println(major6);


if(major1 == null && major2 == null && major3 == null && major4 == null && major5 == null && major6 == null && majorForForeign1.equals("") && majorForForeign2.equals("") && majorForForeign3.equals("") && majorForForeign4.equals("") && majorForForeign5.equals("") && majorForForeign6.equals(""))
{
	//System.out.print("All are institute university.");
	//check whether a student apply duplicate option
	if(opt1 == opt2 || opt1 == opt3 || opt1 == opt4 || opt1 == opt5 || opt1 == opt6 || opt2 == opt3 || opt2 == opt4 || opt2 == opt5 || opt2 == opt6 || opt3 == opt4 || opt3 == opt5 || opt3 == opt6 || opt4 == opt5 || opt4 == opt6 || opt5 == opt6)
	{
		//Show Error Message
		%>
		<script>
			swal(
					  'Choosing duplicated options are not allowed!',
					  'Sorry',
					  'error'
					)
					
			setTimeout(function() {
			document.location = "http://localhost:8080/UniversityAdmissionSystem/member/applicationForm.jsp"; }, 2000);	   
					
		</script>
	<%
	}
	else
	{
		//just need to insert six integer options 
		m.insertOptionsForApply(id, opt1, opt2, opt3, opt4, opt5, opt6, studentName, totalMark, gender);
		m.insertToApplyList(id);
		%>
		<script>
			swal(
					  'After Automatic University Allocation Process taking place, you will be informed',
					  'Success',
					  'success'
					)
					
			setTimeout(function() {
			document.location = "http://localhost:8080/UniversityAdmissionSystem/member/member.jsp"; }, 4500);	   
					
		</script>
		<%
	}
}
else
{
	if(major1 != null)
	{
		startWord1 = major1;
		endWord1 = option1;	
		opt1 = g.getUniversityId(startWord1, endWord1);
	}
	if(!(majorForForeign1.equals("")))
	{
		startWord1 = majorForForeign1;
		endWord1 = option1;
		opt1 = g.getUniversityId(startWord1, endWord1);
	}
	
	System.out.println(opt1);
	
	if(major2 != null)
	{
		startWord2 = major2;
		endWord2 = option2;	
		
		opt2 = g.getUniversityId(startWord2, endWord2);
	}
	if(!(majorForForeign2.equals("")))
	{
		startWord2 = majorForForeign2;
		endWord2 = option2;
		opt2 = g.getUniversityId(startWord2, endWord2);
	}
	System.out.println(opt2);
	
	if(major3 != null)
	{
		startWord3 = major3;
		endWord3 = option3;	
		opt3 = g.getUniversityId(startWord3, endWord3);
	}
	if(!(majorForForeign3.equals("")))
	{
		startWord3 = majorForForeign3;
		endWord3 = option3;
		opt3 = g.getUniversityId(startWord3, endWord3);
	}
	
	System.out.println(opt3);
	
	if(major4 != null)
	{
		startWord4 = major4;
		endWord4 = option4;	
		opt4 = g.getUniversityId(startWord4, endWord4);
	}
	if(!(majorForForeign4.equals("")))
	{
		startWord4 = majorForForeign4;
		endWord4 = option4;
		opt4 = g.getUniversityId(startWord4, endWord4);
	}
	
	System.out.println(opt4);
	
	if(major5 != null)
	{
		startWord5 = major5;
		endWord5 = option5;	
		opt5 = g.getUniversityId(startWord5, endWord5);
	}
	if(!(majorForForeign5.equals("")))
	{
		startWord5 = majorForForeign5;
		endWord5 = option5;
		opt5 = g.getUniversityId(startWord5, endWord5);
	}
	
	System.out.println(opt5);
	
	
	if(major6 != null)
	{
		startWord6 = major6;
		endWord6 = option6;	
		opt6 = g.getUniversityId(startWord6, endWord6);
	}
	if(!(majorForForeign6.equals("")))
	{
		startWord6 = majorForForeign6;
		endWord6 = option6;
		opt6 = g.getUniversityId(startWord6, endWord6);
	}
	
	System.out.println(opt6);
	
	if(opt1 == opt2 || opt1 == opt3 || opt1 == opt4 || opt1 == opt5 || opt1 == opt6 || opt2 == opt3 || opt2 == opt4 || opt2 == opt5 || opt2 == opt6 || opt3 == opt4 || opt3 == opt5 || opt3 == opt6 || opt4 == opt5 || opt4 == opt6 || opt5 == opt6)
	{
		//Show Error Message
		%>
		<script>
			swal(
					  'Choosing duplicated options are not allowed!',
					  'Sorry',
					  'error'
					)
					
			setTimeout(function() {
			document.location = "http://localhost:8080/UniversityAdmissionSystem/member/applicationForm.jsp"; }, 2000);	   
					
		</script>
	<%
	}
	else
	{
		//just need to insert six integer options 
		m.insertOptionsForApply(id, opt1, opt2, opt3, opt4, opt5, opt6, studentName, totalMark, gender);
		m.insertToApplyList(id);
		%>
		<script>
			swal(
					'After Automatic University Allocation Process taking place, you will be informed',
					  'Success',
					  'success'
					)
					
			setTimeout(function() {
			document.location = "http://localhost:8080/UniversityAdmissionSystem/member/member.jsp"; }, 4500);	   
					
		</script>
		<%
	}
}

%>
</body>
</html>