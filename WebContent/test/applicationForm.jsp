<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Application Form</title>
 <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-ui.min.js"></script>
<script>
var allUniversities = new Array();
var major = new Array();
var university = new Array();
var majorForForeign = ['Chinese','English','French','German','Japanese','Korean','Russian','Thai'];
var currentChosenUniversity = new Array();

<%
GetUniversityWithSubjectType g = new GetUniversityWithSubjectType();
g.getConnection();
ResultSet rs = g.getAllUniversities();
while(rs.next())
{
	String name = rs.getString("name");
%>

allUniversities.push("<%=name%>");

<%
}

GetUniversityWithSubjectType g1 = new GetUniversityWithSubjectType();
g1.getConnection();
ResultSet rs1 = g1.getMajor();
while(rs1.next())
{
	String name1 = rs1.getString("majorName");
%>

major.push("<%=name1%>");

<%
}

GetUniversityWithSubjectType g2 = new GetUniversityWithSubjectType();
g2.getConnection();
ResultSet rs2 = g2.getInstituteUniversity();
while(rs2.next())
{
	String name2 = rs2.getString("name");
%>

university.push("<%=name2%>");

<%
}
%>


function changeFunc(i) {
	
	var first = "select"+i;
	var check = i;
	var currentSelectBox = i;
	var i = i + 1;
	var second = "select"+i;
	var forForeign = second + i;
	
    var selectBox = document.getElementById(first);
    var index = selectBox.selectedIndex;
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    
    switch(check)
    {
    case 1: document.getElementById("select3").options[index].disabled = true;
    		document.getElementById("select5").options[index].disabled = true;
    		document.getElementById("select7").options[index].disabled = true;
    		document.getElementById("select9").options[index].disabled = true;
    		document.getElementById("select11").options[index].disabled = true; break;
    		
    case 3: document.getElementById("select1").options[index].disabled = true;
			document.getElementById("select5").options[index].disabled = true;
			document.getElementById("select7").options[index].disabled = true;
			document.getElementById("select9").options[index].disabled = true;
			document.getElementById("select11").options[index].disabled = true; break;
			
    case 5: document.getElementById("select1").options[index].disabled = true;
			document.getElementById("select3").options[index].disabled = true;
			document.getElementById("select7").options[index].disabled = true;
			document.getElementById("select9").options[index].disabled = true;
			document.getElementById("select11").options[index].disabled = true; break;
			
    case 7: document.getElementById("select1").options[index].disabled = true;
			document.getElementById("select5").options[index].disabled = true;
			document.getElementById("select3").options[index].disabled = true;
			document.getElementById("select9").options[index].disabled = true;
			document.getElementById("select11").options[index].disabled = true; break;
			
    case 9: document.getElementById("select1").options[index].disabled = true;
			document.getElementById("select5").options[index].disabled = true;
			document.getElementById("select7").options[index].disabled = true;
			document.getElementById("select3").options[index].disabled = true;
			document.getElementById("select11").options[index].disabled = true; break;
			
    case 11: document.getElementById("select1").options[index].disabled = true;
			document.getElementById("select5").options[index].disabled = true;
			document.getElementById("select7").options[index].disabled = true;
			document.getElementById("select9").options[index].disabled = true;
			document.getElementById("select3").options[index].disabled = true; break;
    }
    
    
    	if(selectedValue < 18)
    		{
    		document.getElementById(second).style.display = 'none';
    		document.getElementById(second).disabled = true;
    		}
    	else
    		{
    		document.getElementById(second).style.display = '';
    		document.getElementById(second).disabled = false;
    		}
    	if(selectedValue == 50)
    		{
    		document.getElementById(second).style.display = 'none';
    		document.getElementById(forForeign).style.display = '';
    		}
    	/*
    	if(check > 1)
    		{
    		while(check >= 1)
    			{
    			check = check - 1;
    			preValue = document.getElementById("select"+check).value;
    			if(preValue == selectedValue)
    				{
    				document.getElementById("select"+currentSelectBox).options = null;
    				}
    			}
    		}
    	*/
   }
   
   function init()
   {
	   document.getElementById("select2").style.display = 'none';
	   document.getElementById("select4").style.display = 'none';
	   document.getElementById("select6").style.display = 'none';
	   document.getElementById("select8").style.display = 'none';
	   document.getElementById("select10").style.display = 'none';
	   document.getElementById("select12").style.display = 'none';
	   
	   document.getElementById("select22").style.display = 'none';
	   document.getElementById("select44").style.display = 'none';
	   document.getElementById("select66").style.display = 'none';
	   document.getElementById("select88").style.display = 'none';
	   document.getElementById("select1010").style.display = 'none';
	   document.getElementById("select1212").style.display = 'none';
   }
   
</script>
</head>
<body onload="init()">
<div class="box">
	<center><font class="bodyText" color="#E9967A">Apply University Now!</font></center>
	<form class=".form-basic" action="addStudent.jsp" method="POST">
	
	

	<div class="s-12 m-6 l-6 margin-bottom">
		<font color="#FFDEAD">select university</font><br>
			<select id = "select1" name="option1" onchange="changeFunc(1);" required>
			 <option value="">select university</option>
					   <% 
					   int i = 1;
					   GetUniversityWithSubjectType g3 = new GetUniversityWithSubjectType();
						g3.getConnection();
						ResultSet rs3 = g3.getAllUniversities();
					while(rs3.next())
						{
						%>
						<option id="university<%=i%>" value="<%= rs3.getInt("universityId")%>"><%= rs3.getString("name")%></option>
						<%
						i++;
						}
						%>
			</select>
	</div>
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select2" name="major1" required>
	<option value="">select major</option>
					   <% 
					   int j = 1;
					   GetUniversityWithSubjectType g4 = new GetUniversityWithSubjectType();
						g4.getConnection();
						ResultSet rs4 = g4.getMajor();
					while(rs4.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs4.getString("majorId")%>"><%= rs4.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select22" name="majorForForeign1" required>
	<option value="">select Language</option>
	<option value="Chinese">Chinese</option>
	<option value="English">English</option>
	<option value="French">French</option>
	<option value="German">German</option>
	<option value="Japanese">Japanese</option>
	<option value="Korean">Korean</option>
	<option value="Russian">Russian</option>
	<option value="Thai">Thai</option>
	</select>
	</div>
	
	<span id="span1"></span>
	
	<div class="s-12 m-6 l-6 margin-bottom">
		<font color="#FFDEAD">select university</font><br>
			<select id = "select3" name="option2" onchange="changeFunc(3);" required>
			 <option value="">select university</option>
					   <% 
					   i = 1;
					   GetUniversityWithSubjectType g5 = new GetUniversityWithSubjectType();
						g5.getConnection();
						ResultSet rs5 = g5.getAllUniversities();
					while(rs5.next())
						{
						%>
						<option id="university<%=i%>" value="<%= rs5.getInt("universityId")%>"><%= rs5.getString("name")%></option>
						<%
						i++;
						}
						%>
			</select>
	</div>
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select4" name="major2" required>
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g6 = new GetUniversityWithSubjectType();
						g6.getConnection();
						ResultSet rs6 = g6.getMajor();
					while(rs6.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs6.getString("majorId")%>"><%= rs6.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select44" name="majorForForeign2" required>
	<option value="">select Language</option>
	<option value="Chinese">Chinese</option>
	<option value="English">English</option>
	<option value="French">French</option>
	<option value="German">German</option>
	<option value="Japanese">Japanese</option>
	<option value="Korean">Korean</option>
	<option value="Russian">Russian</option>
	<option value="Thai">Thai</option>
	</select>
	</div>
	
	<span id="span2"></span>
	
	<div class="s-12 m-6 l-6 margin-bottom">
		<font color="#FFDEAD">select university</font><br>
			<select id = "select5" name="option3" onchange="changeFunc(5);" required>
			 <option value="">select university</option>
					   <% 
					   i = 1;
					   GetUniversityWithSubjectType g7 = new GetUniversityWithSubjectType();
						g7.getConnection();
						ResultSet rs7 = g7.getAllUniversities();
					while(rs7.next())
						{
						%>
						<option id="university<%=i%>" value="<%= rs7.getInt("universityId")%>"><%= rs7.getString("name")%></option>
						<%
						i++;
						}
						%>
			</select>
	</div>
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select6" name="major3" required>
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g8 = new GetUniversityWithSubjectType();
						g8.getConnection();
						ResultSet rs8 = g8.getMajor();
					while(rs8.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs8.getString("majorId")%>"><%= rs8.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select66" name="majorForForeign3" required>
	<option value="">select Language</option>
	<option value="Chinese">Chinese</option>
	<option value="English">English</option>
	<option value="French">French</option>
	<option value="German">German</option>
	<option value="Japanese">Japanese</option>
	<option value="Korean">Korean</option>
	<option value="Russian">Russian</option>
	<option value="Thai">Thai</option>
	</select>
	</div>
	
	<span id="span3"></span>
	
	<div class="s-12 m-6 l-6 margin-bottom">
		<font color="#FFDEAD">select university</font><br>
			<select id = "select7" name="option4" onchange="changeFunc(7);" required>
			 <option value="">select university</option>
					   <% 
					   i = 1;
					   GetUniversityWithSubjectType g9 = new GetUniversityWithSubjectType();
						g9.getConnection();
						ResultSet rs9 = g9.getAllUniversities();
					while(rs9.next())
						{
						%>
						<option id="university<%=i%>" value="<%= rs9.getInt("universityId")%>"><%= rs9.getString("name")%></option>
						<%
						i++;
						}
						%>
			</select>
	</div>
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select8" name="major4" required>
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g10 = new GetUniversityWithSubjectType();
						g10.getConnection();
						ResultSet rs10 = g10.getMajor();
					while(rs10.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs10.getString("majorId")%>"><%= rs10.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select88" name="majorForForeign4" required>
	<option value="">select Language</option>
	<option value="Chinese">Chinese</option>
	<option value="English">English</option>
	<option value="French">French</option>
	<option value="German">German</option>
	<option value="Japanese">Japanese</option>
	<option value="Korean">Korean</option>
	<option value="Russian">Russian</option>
	<option value="Thai">Thai</option>
	</select>
	</div>
	
	
	<span id="span4"></span>
	
	
	<div class="s-12 m-6 l-6 margin-bottom">
		<font color="#FFDEAD">select university</font><br>
			<select id = "select9" name="option5" onchange="changeFunc(9);" required>
			 <option value="">select university</option>
					   <% 
					   i = 1;
					   GetUniversityWithSubjectType g11 = new GetUniversityWithSubjectType();
						g11.getConnection();
						ResultSet rs11 = g11.getAllUniversities();
					while(rs11.next())
						{
						%>
						<option id="university<%=i%>" value="<%= rs11.getInt("universityId")%>"><%= rs11.getString("name")%></option>
						<%
						i++;
						}
						%>
			</select>
	</div>
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select10" name="major5" required>
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g12 = new GetUniversityWithSubjectType();
						g12.getConnection();
						ResultSet rs12 = g12.getMajor();
					while(rs12.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs12.getString("majorId")%>"><%= rs12.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select1010" name="majorForForeign5" required>
	<option value="">select Language</option>
	<option value="Chinese">Chinese</option>
	<option value="English">English</option>
	<option value="French">French</option>
	<option value="German">German</option>
	<option value="Japanese">Japanese</option>
	<option value="Korean">Korean</option>
	<option value="Russian">Russian</option>
	<option value="Thai">Thai</option>
	</select>
	</div>
	
	<span id="span5"></span>
	
	<div class="s-12 m-6 l-6 margin-bottom">
		<font color="#FFDEAD">select university</font><br>
			<select id = "select11" name="option6" onchange="changeFunc(11);" required>
			 <option value="">select university</option>
					   <% 
					   i = 1;
					   GetUniversityWithSubjectType g13 = new GetUniversityWithSubjectType();
						g13.getConnection();
						ResultSet rs13 = g11.getAllUniversities();
					while(rs13.next())
						{
						%>
						<option id="university<%=i%>" value="<%= rs13.getInt("universityId")%>"><%= rs13.getString("name")%></option>
						<%
						i++;
						}
						%>
			</select>
	</div>
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select12" name="major6" required>
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g14 = new GetUniversityWithSubjectType();
						g14.getConnection();
						ResultSet rs14 = g14.getMajor();
					while(rs14.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs14.getString("majorId")%>"><%= rs14.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	
	<div class="s-12 m-6 l-3 margin-bottom">
	<select id = "select1212" name="majorForForeign6" required>
	<option value="">select Language</option>
	<option value="Chinese">Chinese</option>
	<option value="English">English</option>
	<option value="French">French</option>
	<option value="German">German</option>
	<option value="Japanese">Japanese</option>
	<option value="Korean">Korean</option>
	<option value="Russian">Russian</option>
	<option value="Thai">Thai</option>
	</select>
	</div>
	
	<span id="span6"></span>
	
	
	</form>
</div>
</body>
</html>