<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
  <!-- This is what you need -->
  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
</head>
<body>
<%
String id1 = session.getAttribute("currentUserId").toString();
int id = Integer.parseInt(id1);
MakeApplying m1 = new MakeApplying();
m1.getConnection();
ResultSet rs = m1.getApplyList(id);
rs.beforeFirst();
if(!(rs.next()))
{
MakeApplying m = new MakeApplying();
m.getConnection();
String studentName = m.getStudentName(id);
int totalMark = m.getMark(id);
String gender = m.getGender(id);

String option1 = request.getParameter("option1");
String option2 = request.getParameter("option2");
String option3 = request.getParameter("option3");
String option4 = request.getParameter("option4");
String option5 = request.getParameter("option5");
String option6 = request.getParameter("option6");

int opt1 = Integer.parseInt(option1);
int opt2 = Integer.parseInt(option2);
int opt3 = Integer.parseInt(option3);
int opt4 = Integer.parseInt(option4);
int opt5 = Integer.parseInt(option5);
int opt6 = Integer.parseInt(option6);

m.insertOptionsForApply(id, opt1, opt2, opt3, opt4, opt5, opt6, studentName, totalMark, gender);
m.insertToApplyList(id);
%>
		<script>
			swal(
					  'You have applied university successfully',
					  'Success',
					  'success'
					)
					
			setTimeout(function() {
			document.location = "http://localhost:8080/UniversityAdmissionSystem/member/member.jsp"; }, 2000);	   
					
		</script>
		<%
}
else
{
%>
	<script>
		swal(
				  'You has been applied!',
				  'Sorry',
				  'error'
				)
				
		setTimeout(function() {
		document.location = "http://localhost:8080/UniversityAdmissionSystem/member/member.jsp"; }, 2000);	   
				
	</script>
<%
}
		%>
</body>
</html>