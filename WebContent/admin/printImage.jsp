<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<% 
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
String DB_URL="jdbc:mysql://localhost/uas";


String name = request.getParameter("name");

try {
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(DB_URL,"root","");
stmt = con.createStatement();
rs = stmt.executeQuery("select photo from specificuniversitytable where universityName ='"+name+"'");

if (rs.next()) {
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
} else {

out.println("Display Blob Example");
out.println("image not found for given id>");

return;

}
response.setContentType("image/jpeg");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {

rs.close();

stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}

%> 