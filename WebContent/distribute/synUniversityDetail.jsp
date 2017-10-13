<%@page import="allocate.*" %>
<%@page import="distribute.*" %>
<%@page import="allocateUniversity.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
MakeDistributedApplying m = new MakeDistributedApplying();
m.getConnectionFromOtherComputer();
ResultSet rs1 = m.getUniversityDetailFromOtherComputer();
while(rs1.next())
{
	int specificUniversityId = rs1.getInt("universityId");
	String universityName = rs1.getString("universityName");
	String city = rs1.getString("city");
	String region = rs1.getString("region");
	int minMarkForMale = rs1.getInt("minMarkForMale");
	int minMarkForFemale = rs1.getInt("minMarkForFemale");
	int maleCapacity = rs1.getInt("maleCapacity");
	int femaleCapacity = rs1.getInt("femaleCapacity");
	String description = rs1.getString("description");
	
	MakeDistributedApplying m1 = new MakeDistributedApplying();
	m1.getConnection();
	m1.updateUniversity(specificUniversityId, universityName, city, region, minMarkForMale, minMarkForFemale, maleCapacity, femaleCapacity, description);
}
%>
</body>
</html>