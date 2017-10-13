package com.DB;
import java.sql.*;
public class SaveAds {

	public SaveAds() {
		// TODO Auto-generated constructor stub
	}

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
	
	public ResultSet checkforDuplicate(String email, int id)
	{
		ResultSet rs = null;
		try {
			
			String sql = "select * from savetable where memberEmail='"+email+"' and productId='"+id+"'";
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
		public void save(String email,int id)
		{
			
			try {
				
				String sql="insert into savetable values('"+ email +"','"+id+"')";	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public ResultSet retrieveSavedAds(String email,int start, int end)
		{
			ResultSet rs = null;
			try {
				
				String sql="select * from savetable where memberEmail = '"+email+"' Limit "+start+","+end;	
				rs = stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
		
		public int countSavedAds(String email)
		{
			int count = 0;
			ResultSet rs = null;
			try {
				
				String sql="select * from savetable where memberEmail = '"+email+"'";	
				rs = stm.executeQuery(sql);
				while(rs.next())
				{
					count = count +1;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
		}
		
		
		public void deleteSavedAds(String email,int id)
		{
			try {
				String sql="delete from savetable where productId = '"+id+"' and memberEmail='"+email+"'";	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public void deletePostedAds(int memberId,int id)
		{
			try {
				String sql="delete from producttable where productId = '"+id+"' and memberId='"+memberId+"'";	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
}
