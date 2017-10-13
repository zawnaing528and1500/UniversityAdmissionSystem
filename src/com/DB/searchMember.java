package com.DB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
public class searchMember {
	
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
				sql="SELECT * FROM membertable WHERE memberName LIKE '%"+keyword+"%' Limit "+start+","+end;	
			}
			//Searched by Email
			else if(type.equals("E"))
			{
			    sql=" SELECT * FROM membertable WHERE memberEmail = '"+keyword+"'Limit "+start+","+end;	
			}
			//Searched by phone number
			else if(type.equals("P"))
			{
				sql=" SELECT * FROM membertable WHERE memberPhoneNumber = '"+keyword+"'Limit "+start+","+end;
			}
			//Today Members
			else if(type.equals("T"))
			{
				sql=" SELECT * FROM membertable WHERE registeredDate = '"+startdate+"'Limit "+start+","+end;
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
				sql="SELECT * FROM membertable WHERE memberName LIKE '%"+keyword+"%'";	
			}
			//Searched by Email
			else if(type.equals("E"))
			{
			    sql=" SELECT * FROM membertable WHERE memberEmail = '"+keyword+"'";	
			}
			//Searched by phone number
			else if(type.equals("P"))
			{
				sql=" SELECT * FROM membertable WHERE memberPhoneNumber = '"+keyword+"'";
			}
			//Today Members
			else if(type.equals("T"))
			{
				sql=" SELECT * FROM membertable WHERE registeredDate = '"+startdate+"'";
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
				sql="SELECT * FROM membertable WHERE memberName LIKE '%"+keyword+"%'";	
			}
			//Searched by Email
			else if(type.equals("E"))
			{
			    sql=" SELECT * FROM membertable WHERE memberEmail = '"+keyword+"'";	
			}
			//Searched by phone number
			else if(type.equals("P"))
			{
				sql=" SELECT * FROM membertable WHERE memberPhoneNumber = '"+keyword+"'";
			}
			//Today Members
			else if(type.equals("T"))
			{
				sql=" SELECT * FROM membertable WHERE registeredDate = '"+startdate+"'";
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
	
	public int countKeyword(String keyword)
	{
		ResultSet rs = null;
		int count = 0;
		try {
			
			String sql="SELECT * FROM membertable WHERE memberName LIKE '%"+keyword+"%'";	
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
	
	public ResultSet searchMember(String memberEmail)
	{
		ResultSet rs = null;
		try {
			
			String sql="SELECT * FROM membertable WHERE memberEmail ='"+memberEmail+"'";
		    rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}



		