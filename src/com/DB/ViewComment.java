package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class ViewComment {
	
	Connection con;
	Statement stm;
	public void getConnection()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost/BuyNSell","root","");
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
	
	public ResultSet retrieveComment(String title)
	{
		ResultSet rs = null;
		try {
			
			String sql=" SELECT * FROM commenttable WHERE productTitle = '"+title+"'";	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	
	public void comment(String title,String comment)
	{
		System.out.println("Function insert---"+title+comment);
		ResultSet rs=null;
		try {
			//Strinsg comment = request.getParameter("inputValue");	
			String sql=" SELECT productId from producttable WHERE productTitle= '"+title+"'";	
			rs=stm.executeQuery(sql);
			int id = rs.getInt("productId");
			String sql1="INSERT INTO commenttable VALUES ('"+"','"+id+"','"+comment+"')";
			stm.executeUpdate(sql1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}