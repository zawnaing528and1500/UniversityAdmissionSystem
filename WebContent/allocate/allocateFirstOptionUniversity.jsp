<%@page import="allocate.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Testing nested result set</title>
</head>
<body>
<%
int minMark = 0,capacity = 0,limitCapacity = 0;
		MakeApplying m = new MakeApplying();
		m.getConnection();
		ResultSet rs = m.getStudentApplyForAllocate();
		while(rs.next())
		{
			int studentId =rs.getInt("studentId");
			int universityId = rs.getInt("option1");
			String studentName = rs.getString("studentName");
			int markForCurrentStudent = rs.getInt("totalMark");
			String genderForCurrentStudent = rs.getString("gender");
			
			MakeApplying m1 = new MakeApplying();
			m1.getConnection();
			ResultSet rs1 = m1.getAppliedUniversities(universityId);
			while(rs1.next())
			{
				String universityName = rs1.getString("universityName");
				int currentTotalCapacity = rs1.getInt("currentTotalCapacity");
				int limitTotalCapacity = rs1.getInt("totalCapacity");
				if(genderForCurrentStudent.equals("m"))
				{
					 capacity = rs1.getInt("currentMaleCapacity");
					 limitCapacity = rs1.getInt("maleCapacity");
					 minMark = rs1.getInt("minMarkForMale");
				}
				else
				{
				 capacity = rs1.getInt("currentFemaleCapacity");
				 limitCapacity = rs1.getInt("femaleCapacity");
				 minMark = rs1.getInt("minMarkForFemale");
				}

				if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity)
				{
					MakeApplying m2 = new MakeApplying();
					m2.getConnection();
					
					m2.increaseCapacity(genderForCurrentStudent, universityId);
					m2.allocate(studentId, universityId);
					m2.deleteOption(studentId);
				}
			}
		}
		response.sendRedirect("allocateSecondOptionUniversity.jsp");
%>
</body>
</html>