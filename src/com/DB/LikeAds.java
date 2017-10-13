package com.DB;
import java.sql.*;
public class LikeAds {

	public LikeAds() {
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

	public ResultSet checkforDuplicate(String email, String title)
	{
		ResultSet rs = null;
		try {
			
			String sql = "select * from liketable where email='"+email+"' and title='"+title+"'";
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean check(String email, String title)
	{
		ResultSet rs = null;
		boolean check = false;
		try {
			
			String sql = "select * from liketable where email='"+email+"' and title='"+title+"'";
			rs=stm.executeQuery(sql);
			if(rs.next())
			{
				check = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public void insertToLike(String email, String title)
	{
		ResultSet rs = null;
		try {
			String sql = "insert into liketable  values('"+email+"','"+title+"')";
			stm.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
		public void like(String title)
		{
			try {
				
				String sql="update specificuniversitytable set likeCount = likeCount+1 where universityName = '"+ title +"'";	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
