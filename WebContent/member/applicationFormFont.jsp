<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
 <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
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


localStorage.setItem("uni1", "Smith");
localStorage.setItem("uni2", "Smith");
localStorage.setItem("uni3", "Smith");
localStorage.setItem("uni4", "Smith");
localStorage.setItem("uni5", "Smith");
localStorage.setItem("uni6", "Smith");


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
	
	var useForSwitch = i;
	var first = "select"+i;
	var currentSelectBox = i;
	var i = i + 1;
	var second = "select"+i;
	var forForeign = second + i;
	
    var selectBox = document.getElementById(first);
    var index = selectBox.selectedIndex;
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    
   
    
    	if(selectedValue < 82)
    		{
    		document.getElementById(second).style.display = 'none';
    		document.getElementById(forForeign).style.display = 'none';
    		document.getElementById(second).disabled = true;
    		}
    	else
    		{
    		document.getElementById(second).style.display = '';
    		document.getElementById(second).disabled = false;
    		document.getElementById(forForeign).style.display = 'none';
    		}
    	if(selectedValue > 113)
    		{
    		document.getElementById(second).style.display = 'none';
    		document.getElementById(forForeign).style.display = '';
    		}
    
    	switch(useForSwitch){
    	case 1:	 var selectedValue1 = document.getElementById("select1").value;
    		   	 var selectedValue2 = document.getElementById("select2").value;
    		     var selectedValue3 = document.getElementById("select22").value;
    		     var set = selectedValue1+","+selectedValue2+","+selectedValue3;
    		     localStorage.setItem("uni1", set);break;
 
    	case 2:		var selectedValue1 = document.getElementById("select3").value;
	  			  	var selectedValue2 = document.getElementById("select4").value;
	    			var selectedValue3 = document.getElementById("select44").value;
			    
				    var set = selectedValue1+","+selectedValue2+","+selectedValue3;
				    localStorage.setItem("uni2", set);
				    var compare = localStorage.getItem("uni1");
				    if(compare == set)
				    	{
				    	document.getElementById("span2").style.visibility = "visible";
				    	}
			    
				break;
			
    	case 3:	var selectBox1 = document.getElementById("select5");
			    var selectedValue1 = selectBox1.options[selectBox1.selectedIndex].value;
			    
			    var selectBox2 = document.getElementById("select6");
			    var selectedValue2 = selectBox2.options[selectBox2.selectedIndex].value;
			    
			    var selectBox3 = document.getElementById("select66");
			    var selectedValue3 = selectBox3.options[selectBox3.selectedIndex].value;
				
			    var set = selectedValue1+","+selectedValue2+","+selectedValue3;
			    localStorage.setItem("uni3", set);
			    
			    break;
			
    	case 4:
		 	var selectBox1 = document.getElementById("select7");
		    var selectedValue1 = selectBox1.options[selectBox1.selectedIndex].value;
		    
		    var selectBox2 = document.getElementById("select8");
		    var selectedValue2 = selectBox2.options[selectBox2.selectedIndex].value;
		    
		    var selectBox3 = document.getElementById("select88");
		    var selectedValue3 = selectBox3.options[selectBox3.selectedIndex].value;
			
		    var set = selectedValue1+","+selectedValue2+","+selectedValue3;
		    localStorage.setItem("uni4", set);
		    
		    
		    break;
			
    	case 5:
		 	var selectBox1 = document.getElementById("select9");
		    var selectedValue1 = selectBox1.options[selectBox1.selectedIndex].value;
		    
		    var selectBox2 = document.getElementById("select10");
		    var selectedValue2 = selectBox2.options[selectBox2.selectedIndex].value;
		    
		    var selectBox3 = document.getElementById("select1010");
		    var selectedValue3 = selectBox3.options[selectBox3.selectedIndex].value;
			
		    var set = selectedValue1+","+selectedValue2+","+selectedValue3;
		    localStorage.setItem("uni5", set);
		    
		    break;
			
    	case 6:
		 	var selectBox1 = document.getElementById("select11");
		    var selectedValue1 = selectBox1.options[selectBox1.selectedIndex].value;
		    
		    var selectBox2 = document.getElementById("select12");
		    var selectedValue2 = selectBox2.options[selectBox2.selectedIndex].value;
		    
		    var selectBox3 = document.getElementById("select1212");
		    var selectedValue3 = selectBox3.options[selectBox3.selectedIndex].value;
			
		    var set = selectedValue1+","+selectedValue2+","+selectedValue3;
		    localStorage.setItem("uni6", set);
		    
		    break;
    	}
    	
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
	   
	   document.getElementById("span1").style.visibility = "hidden";
	   document.getElementById("span2").style.visibility = "hidden";
	   document.getElementById("span3").style.visibility = "hidden";
	   document.getElementById("span4").style.visibility = "hidden";
	   document.getElementById("span5").style.visibility = "hidden";
	   document.getElementById("span6").style.visibility = "hidden";
   }
   
</script>
</head>
<body onload="init()">
<%
int i,j;
%>
<div class="box">
	<center><font class="bodyText" color="#E9967A">Application Form</font></center>
	
	
	<form class=".form-basic" action="processApplicationForm.jsp" method="POST">
	
	<div>
	<font class="" color="">Choose University for First Option</font>
			<select id = "select1" name="option1" onchange="changeFunc(1);" required>
			 <option value="">select university</option>
					   <% 
					   i = 1;
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
	
	<div>
	<select id = "select2" name="major1">
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g4 = new GetUniversityWithSubjectType();
						g4.getConnection();
						ResultSet rs4 = g4.getMajor();
					while(rs4.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs4.getString("majorName")%>"><%= rs4.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	
	</div>
	<div>
	<select id = "select22" name="majorForForeign1">
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
	<span id="span1"><font color="red">Duplicate Option! Please choose another one</font></span>
	
	<div>
	<font class="" color="">Choose University for Second Option</font>
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
	
	<div>
	<select id = "select4" name="major2">
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g6 = new GetUniversityWithSubjectType();
						g6.getConnection();
						ResultSet rs6 = g6.getMajor();
					while(rs6.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs6.getString("majorName")%>"><%= rs6.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	<div>
	<select id = "select44" name="majorForForeign2">
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
	<span id="span2"><font color="red">Duplicate Option! Please choose another one</font></span>
	
	<div>
	<font class="" color="">Choose University for Third Option</font>
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
	
	<div>
	<select id = "select6" name="major3">
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g8 = new GetUniversityWithSubjectType();
						g8.getConnection();
						ResultSet rs8 = g8.getMajor();
					while(rs8.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs8.getString("majorName")%>"><%= rs8.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	
	<div>
	<select id = "select66" name="majorForForeign3">
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
	<span id="span3"><font color="red">Duplicate Option! Please choose another one</font></span>
	
	<div>
	<font class="" color="">Choose University for Fourth Option</font>
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
	
	<div>
	<select id = "select8" name="major4">
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g10 = new GetUniversityWithSubjectType();
						g10.getConnection();
						ResultSet rs10 = g10.getMajor();
					while(rs10.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs10.getString("majorName")%>"><%= rs10.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	
	<div>
	<select id = "select88" name="majorForForeign4">
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
	<span id="span4"><font color="red">Duplicate Option! Please choose another one</font></span>
	
	
	
	<div>
		<font class="" color="">Choose University for Fifth Option</font>
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
	
	<div>
	<select id = "select10" name="major5">
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g12 = new GetUniversityWithSubjectType();
						g12.getConnection();
						ResultSet rs12 = g12.getMajor();
					while(rs12.next())
						{
						%>
			<option id="university<%=j%>" value="<%=rs12.getString("majorName")%>"><%= rs12.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	
	<div>
	<select id = "select1010" name="majorForForeign5">
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
	<span id="span5"><font color="red">Duplicate Option! Please choose another one</font></span>
	
	
	<div>
		<font class="" color="">Choose University for Sixth Option</font>
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
	
	<div>
	<select id = "select12" name="major6">
	<option value="">select major</option>
					   <% 
					   j = 1;
					   GetUniversityWithSubjectType g14 = new GetUniversityWithSubjectType();
						g14.getConnection();
						ResultSet rs14 = g14.getMajor();
					while(rs14.next())
						{
						%>
						<option id="university<%=j%>" value="<%=rs14.getString("majorName")%>"><%= rs14.getString("majorName")%></option>
						<%
						j++;
						}
						%>
	</select>
	</div>
	
	
	<div>
	<select id = "select1212" name="majorForForeign6">
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
	
	<span id="span6"><font color="red">Duplicate Option! Please choose another one</font></span>
	
<input type="submit" value="APPLY" id="input-submit">
	
	
	</form>
</div>
</body>
</html>