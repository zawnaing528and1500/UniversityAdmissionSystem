package com.DB;
import java.sql.*;
public class AddtoCart {

	String firstTime;
	public AddtoCart() {
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

	
		public void add(String email, int id)
		{
			try {
				
				String sql = "insert into carttable values('"+email+"','"+id+"')";
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public ResultSet checkforDuplicate(String email, int id)
		{
			ResultSet rs = null;
			try {
				
				String sql = "select * from carttable where email='"+email+"' and productId='"+id+"'";
				rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
		
		public ResultSet getCartList(String email)
		{
			ResultSet rs = null;
			try {
				
				String sql="SELECT * FROM producttable INNER JOIN carttable ON producttable.productId = carttable.productId and carttable.email = '"+email+"'";	
			    rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
		
		
		public ResultSet getTitle(int id)
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
		
		public void deleteProduct(String email, int id)
		{
			try {
				
				String sql = "delete from carttable where email ='"+email+"' and productId = '"+id+"'";
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public ResultSet getSellerEmail(int id)
		{
			ResultSet rs = null;
			try {
				
				String sql="SELECT * FROM membertable m, producttable p, carttable c WHERE c.productId ="+id+" AND c.productId = p.productId AND p.memberId = m.memberId";	
			    rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return rs;
		}
		
		public String getFirstTime()
		{
			ResultSet rs = null;
		
			try {
				
				String sql="SELECT * FROM website";	
			    rs=stm.executeQuery(sql);
			    while(rs.next())
			    {
			    	firstTime = rs.getString(1);
			    }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return firstTime;
		}
		
		public void changeToTrue()
		{
			try {
				
				String sql="update website set firstTime='true'";	
			    stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		public void removeCartOfVisitor()
		{
			try {
				
				String sql="delete from carttable where email not like '%@gmail.com'";	
			    stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
}
