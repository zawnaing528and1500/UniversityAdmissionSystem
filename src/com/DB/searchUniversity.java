package com.DB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
public class searchUniversity {
	
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
				sql="SELECT * FROM specificuniversitytable WHERE universityName LIKE '%"+keyword+"%' limit "+start+","+end;	
			}
			else if(type.equals("C"))
			{
			    sql=" SELECT * FROM specificuniversitytable WHERE city = '"+keyword+"' limit "+start+","+end;	
			}
			else if(type.equals("S"))
			{
			    sql=" SELECT * FROM specificuniversitytable WHERE region = '"+keyword+"' limit "+start+","+end;	
			}
			else if(type.equals("M"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM specificuniversitytable WHERE minMarkForMale <= "+price+" limit "+start+","+end;
			}
			else if(type.equals("F"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM specificuniversitytable WHERE minMarkForFemale <= "+price+" limit "+start+","+end;
			}
		    rs=stm.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet searchThreeTypeForReport(String type, String keyword)
	{
		ResultSet rs = null;
		 String sql = null;
		 Calendar now = Calendar.getInstance();
			
		    String startDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
		    Date startdate=Date.valueOf(startDate);
		try {
			
			if(type.equals("K"))
			{
				sql="SELECT * FROM specificuniversitytable WHERE universityName LIKE '%"+keyword+"%'";	
			}
			else if(type.equals("C"))
			{
			    sql=" SELECT * FROM specificuniversitytable WHERE city = '"+keyword+"'";	
			}
			else if(type.equals("S"))
			{
			    sql=" SELECT * FROM specificuniversitytable WHERE region = '"+keyword+"'";	
			}
			else if(type.equals("M"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM specificuniversitytable WHERE minMarkForMale <= "+price;
			}
			else if(type.equals("F"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM specificuniversitytable WHERE minMarkForFemale <= "+price;
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
				sql="SELECT * FROM specificuniversitytable WHERE universityName LIKE '%"+keyword+"%'";	
			}
			else if(type.equals("C"))
			{
			    sql=" SELECT * FROM specificuniversitytable WHERE city = '"+keyword+"'";	
			}
			else if(type.equals("S"))
			{
			    sql=" SELECT * FROM specificuniversitytable WHERE region = '"+keyword+"'";	
			}
			else if(type.equals("M"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM specificuniversitytable WHERE minMarkForMale <= "+price;
			}
			else if(type.equals("F"))
			{
				int price = Integer.parseInt(keyword);
				sql=" SELECT * FROM specificuniversitytable WHERE minMarkForFemale <= "+price;
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
				
				String sql="SELECT * FROM specificuniversitytable WHERE universityName = '"+keyword+"'";	
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
				String sql="SELECT * FROM specificuniversitytable WHERE universityName LIKE '%"+keyword+"%'";	
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
				
				String sql="SELECT * FROM commenttable WHERE universityId = "+id;	
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

}


		