package com.DB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
public class searchAds {
	
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
	
	
	public ResultSet searchThreeType(String type, String keyword,int start, int end)
	{
		ResultSet rs = null;
		 String sql = null;
		 Calendar now = Calendar.getInstance();
			
		    String startDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
		    Date startdate=Date.valueOf(startDate);
		try {
			
			
			if(type.equals("K"))
			{
				sql="SELECT * FROM producttable WHERE pay='yes' and productTitle LIKE '%"+keyword+"%' Limit "+start+","+end;	
			}
			else if(type.equals("L"))
			{
			    sql=" SELECT * FROM producttable WHERE pay='yes' and productLocation = '"+keyword+"'Limit "+start+","+end;	
			}
			else if(type.equals("P"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM producttable WHERE pay='yes' and newPrice = '"+price+"'Limit "+start+","+end;
			}
			else if(type.equals("C"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and productCategory = '"+keyword+"'Limit "+start+","+end;
			}
			else if(type.equals("A"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and productType = '"+keyword+"'Limit "+start+","+end;
			}
			else if(type.equals("T"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and startDate= '"+startdate+"'Limit "+start+","+end;
			}
		    rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public ResultSet searchThreeTypeForExcel(String type, String keyword)
	{
		ResultSet rs = null;
		 String sql = null;
		 Calendar now = Calendar.getInstance();
			
		    String startDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
		    Date startdate=Date.valueOf(startDate);
		try {
			
			
			if(type.equals("K"))
			{
				sql="SELECT * FROM producttable WHERE pay='yes' and productTitle LIKE '%"+keyword+"%'";	
			}
			else if(type.equals("L"))
			{
			    sql=" SELECT * FROM producttable WHERE pay='yes' and productLocation = '"+keyword+"'";	
			}
			else if(type.equals("P"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM producttable WHERE pay='yes' and newPrice = '"+price+"'";
			}
			else if(type.equals("C"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and productCategory = '"+keyword+"'";
			}
			else if(type.equals("A"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and productType = '"+keyword+"'";
			}
			else if(type.equals("T"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and startDate= '"+startdate+"'";
			}
		    rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	
	public int countThreeType(String type, String keyword)
	{
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		Calendar now = Calendar.getInstance();
		
	    String startDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
	    Date startdate=Date.valueOf(startDate);
	    
		try {
			
			if(type.equals("K"))
			{
				sql="SELECT * FROM producttable WHERE pay='yes' and productTitle LIKE '%"+keyword+"%'";	
			}
			else if(type.equals("L"))
			{
			    sql=" SELECT * FROM producttable WHERE pay='yes' and productLocation = '"+keyword+"'";	
			}
			else if(type.equals("P"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM producttable WHERE pay='yes' and newPrice = '"+price+"'";
			}	
			else if(type.equals("C"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and productCategory = '"+keyword+"'";
			}
			else if(type.equals("A"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and productType = '"+keyword+"'";
			}
			else if(type.equals("T"))
			{
				sql=" SELECT * FROM producttable WHERE pay='yes' and startDate= '"+startdate+"'";
			}
			
		    rs=stm.executeQuery(sql);
		    
		    while(rs.next())
		    {
		    	count = count + 1;
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	

		public ResultSet searchByKeyword(String keyword)
		{
			ResultSet rs = null;
			try {
				
				String sql="SELECT * FROM producttable WHERE productTitle = '"+keyword+"'";	
			    rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
		
		public ResultSet searchById(int id)
		{
			ResultSet rs = null;
			try {
				
				String sql="SELECT * FROM producttable WHERE productId = '"+id+"'";	
			    rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
		
		
		
		public ResultSet searchByMemberId(int id, int start, int end)
		{
			ResultSet rs = null;
			try {
				
				String sql="SELECT * FROM producttable WHERE memberId = '"+id+"'Limit "+start+","+end;;	
			    rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
		
		public int countAds(int id)
		{
			int count = 0;
			ResultSet rs = null;
			try {
				
				String sql="select * from producttable where memberId = '"+id+"'";	
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
		
		public int getMemberId(String email)
		{
			int count = 0;
			ResultSet rs = null;
			try {
				
				String sql="select * from membertable where memberEmail = '"+email+"'";	
				rs = stm.executeQuery(sql);
				while(rs.next())
				{
					count = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
		}
		
		public int getProductId(String title)
		{
			int count = 0;
			ResultSet rs = null;
			try {
				
				String sql="select * from producttable where productTitle = '"+title+"'";	
				rs = stm.executeQuery(sql);
				while(rs.next())
				{
					count = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
		}
		
		public void insertToUnpaytable(int id,String title,String account)
		{
		
			try {
				
				String sql="insert into unpaytable values("+id+",'"+title+"','"+account+"')";	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		public ResultSet searchByLocation(String location,int start, int end)
		{
			ResultSet rs = null;
			try {
				
				String sql=" SELECT * FROM producttable WHERE productLocation = '"+location+"'Limit "+start+","+end;	
				rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
		
		public ResultSet searchByPrice(String price1,int start, int end)
		{
			int price = Integer.parseInt(price1);
			ResultSet rs = null;
			try {
				
				String sql=" SELECT * FROM producttable WHERE productPrice = '"+price+"'Limit "+start+","+end;		
				rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
		
		public int countKeyword(String keyword)
		{
			ResultSet rs = null;
			int count = 0;
			try {
				
				String sql="SELECT * FROM producttable WHERE pay='yes' and productTitle LIKE '%"+keyword+"%'";	
			    rs=stm.executeQuery(sql);
			    while(rs.next())
			    {
			    	count = count + 1;
			    }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
		}
		
		public int countPrice(String price1)
		{
			int price = Integer.parseInt(price1);
			ResultSet rs = null;
			int count = 0;
			try {
				
				String sql=" SELECT * FROM producttable WHERE productPrice = '"+price+"'";	
			    rs=stm.executeQuery(sql);
			    while(rs.next())
			    {
			    	count = count + 1;
			    }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
		}
		
		public int countLocation(String location)
		{
			ResultSet rs = null;
			int count = 0;
			try {
				
				String sql=" SELECT * FROM producttable WHERE productLocation = '"+location+"'";	
			    rs=stm.executeQuery(sql);
			    while(rs.next())
			    {
			    	count = count + 1;
			    }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
		}
		
		public ResultSet getComment(int id)
		{
			ResultSet rs = null;
			try {
				
				String sql="SELECT * FROM commenttable WHERE productId = "+id;	
			    rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
			
		public ResultSet getFeedback()
		{
			ResultSet rs = null;
			try {
				
				String sql="SELECT * FROM contacttable";	
			    rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
		
		public ResultSet retrieveUnpayAds()
		{
			ResultSet rs = null;
			try {
				
				String sql="SELECT * FROM unpaytable";	
			    rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
		
		public void deleteAds(int id)
		{
			try {
				
				String sql="delete from producttable where productId = "+id;	
				stm.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public void deleteAdsUnpay(int id)
		{
			try {
				
				String sql="delete from unpaytable where productId = "+id;	
				stm.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public void deleteAdsFromUnpaytable(int id)
		{
			try {
				
				String sql=" delete from unpaytable where productId = '"+id+"'";	
				stm.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public void changePay(int id)
		{
			try {
				
				String sql=" update producttable set pay='yes' where productId = '"+id+"'";	
				stm.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}


		