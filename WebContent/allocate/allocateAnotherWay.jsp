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
			int universityId1 = rs.getInt("option1");
			int universityId2 = rs.getInt("option2");
			int universityId3 = rs.getInt("option3");
			int universityId4 = rs.getInt("option4");
			int universityId5 = rs.getInt("option5");
			int universityId6 = rs.getInt("option6");
			
			String studentName = rs.getString("studentName");
			int markForCurrentStudent = rs.getInt("totalMark");
			String genderForCurrentStudent = rs.getString("gender");
			
			//Allocate Option1
			MakeApplying m1 = new MakeApplying();
			m1.getConnection();
			ResultSet rs1 = m1.getAppliedUniversities(universityId1);
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
					
					m2.increaseCapacity(genderForCurrentStudent, universityId1);
					m2.allocate(studentId, universityId1);
					m2.deleteOption(studentId);
				}
			}
			
			
			
			//Alocate Option2
			MakeApplying m2 = new MakeApplying();
			m2.getConnection();
			ResultSet rs2 = m2.getAppliedUniversities(universityId2);
			while(rs2.next())
			{
				String universityName = rs2.getString("universityName");
				int currentTotalCapacity = rs2.getInt("currentTotalCapacity");
				int limitTotalCapacity = rs2.getInt("totalCapacity");
				if(genderForCurrentStudent.equals("m"))
				{
					 capacity = rs2.getInt("currentMaleCapacity");
					 limitCapacity = rs2.getInt("maleCapacity");
					 minMark = rs2.getInt("minMarkForMale");
				}
				else
				{
				 capacity = rs2.getInt("currentFemaleCapacity");
				 limitCapacity = rs2.getInt("femaleCapacity");
				 minMark = rs2.getInt("minMarkForFemale");
				}

				if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity)
				{
					MakeApplying m3 = new MakeApplying();
					m3.getConnection();
					
					m3.increaseCapacity(genderForCurrentStudent, universityId2);
					m3.allocate(studentId, universityId2);
					m3.deleteOption(studentId);
				}
			}
			
			
			//Allocate Option3
			MakeApplying m3 = new MakeApplying();
			m3.getConnection();
			ResultSet rs3 = m3.getAppliedUniversities(universityId3);
			while(rs3.next())
			{
				String universityName = rs3.getString("universityName");
				int currentTotalCapacity = rs3.getInt("currentTotalCapacity");
				int limitTotalCapacity = rs3.getInt("totalCapacity");
				if(genderForCurrentStudent.equals("m"))
				{
					 capacity = rs3.getInt("currentMaleCapacity");
					 limitCapacity = rs3.getInt("maleCapacity");
					 minMark = rs3.getInt("minMarkForMale");
				}
				else
				{
				 capacity = rs3.getInt("currentFemaleCapacity");
				 limitCapacity = rs3.getInt("femaleCapacity");
				 minMark = rs3.getInt("minMarkForFemale");
				}

				if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity)
				{
					MakeApplying m4 = new MakeApplying();
					m4.getConnection();
					
					m4.increaseCapacity(genderForCurrentStudent, universityId3);
					m4.allocate(studentId, universityId3);
					m4.deleteOption(studentId);
				}
			}
			
			//Allocate Option4
			MakeApplying m4 = new MakeApplying();
			m4.getConnection();
			ResultSet rs4 = m4.getAppliedUniversities(universityId4);
			while(rs4.next())
			{
				String universityName = rs4.getString("universityName");
				int currentTotalCapacity = rs4.getInt("currentTotalCapacity");
				int limitTotalCapacity = rs4.getInt("totalCapacity");
				if(genderForCurrentStudent.equals("m"))
				{
					 capacity = rs4.getInt("currentMaleCapacity");
					 limitCapacity = rs4.getInt("maleCapacity");
					 minMark = rs4.getInt("minMarkForMale");
				}
				else
				{
				 capacity = rs4.getInt("currentFemaleCapacity");
				 limitCapacity = rs4.getInt("femaleCapacity");
				 minMark = rs4.getInt("minMarkForFemale");
				}

				if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity)
				{
					MakeApplying m5 = new MakeApplying();
					m5.getConnection();
					
					m5.increaseCapacity(genderForCurrentStudent, universityId4);
					m5.allocate(studentId, universityId4);
					m5.deleteOption(studentId);
				}
			}
			
			
		}
		//Thread.sleep(5000);
		//response.sendRedirect("allocateSecondOptionUniversity.jsp");
%>
</body>
</html>