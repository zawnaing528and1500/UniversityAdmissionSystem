<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css">
<script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery.autocomplete.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/currency-autocomplete.js"></script>
<title>Member Post Ads</title>
</head>
<body>
<%
String id1 = session.getAttribute("currentUserId").toString();
int id = Integer.parseInt(id1);
MakeApplying m = new MakeApplying();
m.getConnection();
int subjectType = m.getSubjectType(id);
%>
	<form class=".form-basic" action="applyUniversity.jsp" method="POST">
			         
			         <font class="" color="">Choose University for Option1</font>
			         <select name="option1" title="Please select category" id="check" required>
					 <option value="">select university</option>
						<% 
						GetUniversityWithSubjectType g = new GetUniversityWithSubjectType();
						g.getConnection();
						ResultSet rs = g.getUniversityWithSubjectType(subjectType);
						while(rs.next())
						{
						%>
						<option value=<%= rs.getInt("specificUniversityId")%>><%= rs.getString("universityName")%></option>
						<%
						}
						%>
						</select>
						
						
					 <font class="" color="">Choose University for Option2</font>
			         <select name="option2" title="Please select category" id="check" required>
					 <option value="">select university</option>
						<% 
						GetUniversityWithSubjectType g1 = new GetUniversityWithSubjectType();
						g1.getConnection();
						ResultSet rs1 = g1.getUniversityWithSubjectType(subjectType);
						while(rs1.next())
						{
						%>
						<option value=<%= rs1.getInt("specificUniversityId")%>><%= rs1.getString("universityName")%></option>
						<%
						}
						%>
					</select>
					
					
					<font class="" color="">Choose University for Option3</font>
			         <select name="option3" title="Please select category" id="check" required>
					 <option value="">select university</option>
						<% 
						GetUniversityWithSubjectType g2 = new GetUniversityWithSubjectType();
						g2.getConnection();
						ResultSet rs2 = g2.getUniversityWithSubjectType(subjectType);
						while(rs2.next())
						{
						%>
						<option value=<%= rs2.getInt("specificUniversityId")%>><%= rs2.getString("universityName")%></option>
						<%
						}
						%>
					</select>
					
					<font class="" color="">Choose University for Option4</font>
			         <select name="option4" title="Please select category" id="check" required>
					 <option value="">select university</option>
					    <%
					    GetUniversityWithSubjectType g3 = new GetUniversityWithSubjectType();
						g3.getConnection();
						ResultSet rs3 = g3.getUniversityWithSubjectType(subjectType);
					while(rs3.next())
						{
						%>
						<option value=<%= rs3.getInt("specificUniversityId")%>><%= rs3.getString("universityName")%></option>
						<%
						}
						%>
					</select>
					
					
					
					<font class="" color="">Choose University for Option5</font>
			         <select name="option5" title="Please select category" id="check" required>
					 <option value="">select university</option>
					   <% 
					   GetUniversityWithSubjectType g4 = new GetUniversityWithSubjectType();
						g4.getConnection();
						ResultSet rs4 = g4.getUniversityWithSubjectType(subjectType);
					while(rs4.next())
						{
						%>
						<option value=<%= rs4.getInt("specificUniversityId")%>><%= rs4.getString("universityName")%></option>
						<%
						}
						%>
					</select>
					
					
					 <font class="" color="">Choose University for Option6</font>
			         <select name="option6" title="Please select category" id="check" required>
					 <option value="">select university</option>
					   <% 
					   GetUniversityWithSubjectType g5 = new GetUniversityWithSubjectType();
						g5.getConnection();
						ResultSet rs5 = g.getUniversityWithSubjectType(subjectType);
					while(rs5.next())
						{
						%>
						<option value=<%= rs5.getInt("specificUniversityId")%>><%= rs5.getString("universityName")%></option>
						<%
						}
						%>
					</select>
					
					
					
					<input type="submit" value="APPLY" id="input-submit">
	</form>

			
<script type="text/javascript">
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(200)
                    .height(200);
            };
			
            reader.readAsDataURL(input.files[0]);
            
        }
    }
</script>
</body>
</html>