package com.DB;
import java.sql.*;
public class CommentAds {

	public CommentAds() {
		// TODO Auto-generated constructor stub
	}

	Connection con;
	Statement stm;
	public void getConnection()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost/uas","root","");
				stm=con.createStatement();
				System.out.println("Connection Ok.......");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
		public void comment(int title, String comment, String rollNumber)
		{
			try {
				
				String sql="insert into commenttable values('"+title+"','"+comment+"','"+rollNumber+"')";	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
