package com.DB;
import java.sql.*;
import java.util.Calendar;
public class DBTest {
	
	Connection con;
	Statement stm;
	public int totalProfit = 0;
	public void getConnection()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost/uas","root","");
				stm=con.createStatement();
				//System.out.println("Connection Ok.......");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}  

				public int reportOnTodayProfit()
					{
					
					Calendar now = Calendar.getInstance();
					
				    String startDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
				    Date startdate=Date.valueOf(startDate);
				 
					ResultSet rs=null;
					try {
						String sql=" SELECT profit FROM profittable WHERE postedDate = '"+startDate+"'";	
						rs=stm.executeQuery(sql);
						
						while(rs.next())
						{
							int Profit = rs.getInt("profit");
							totalProfit = totalProfit + Profit;
							
						}
						} catch (SQLException e) {
						e.printStackTrace();
					}
					return totalProfit;
				}
				
				
				
				public int reportOnAllProfit()
				{
					ResultSet rs=null;
					try {
						String sql=" SELECT profit FROM profittable";	
						rs=stm.executeQuery(sql);
						
						while(rs.next())
						{
							int Profit = rs.getInt("profit");
							totalProfit = totalProfit + Profit;
							
						}
						} catch (SQLException e) {
						e.printStackTrace();
					}
					return totalProfit;
				}
				
				public ResultSet reportOnTodayRegisterdMember()
				{
					Calendar now = Calendar.getInstance();
					
				    String startDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
				    Date startdate=Date.valueOf(startDate);
				 
					ResultSet rs=null;
					try {
						
						String sql=" SELECT * FROM membertable WHERE registerdDate = '"+startDate+"'";	
						rs=stm.executeQuery(sql);
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return rs;
				}
				
				
				public ResultSet selectAllMember()
				{
					ResultSet rs=null;
					try {
						
						String sql=" SELECT * FROM membertable";	
						rs=stm.executeQuery(sql);
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return rs;
				}
				
				
				public ResultSet reportOnTodayPostedAds(int start, int end)
				{
					ResultSet rs=null;
					Calendar now = Calendar.getInstance();
					
				    String startDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
				    Date startdate=Date.valueOf(startDate);
				    
					try {
						
						String sql=" SELECT * FROM producttable WHERE startDate= '"+startdate+"'Limit "+start+","+end;
						rs=stm.executeQuery(sql);
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return rs;
				}
				
				
				
				//Get Admissible Student for sending Email 
				public ResultSet getAdmissibleStudent()
				{
					ResultSet rs = null;
              	try {	
						String sql="SELECT * FROM allocatedtable where studentId = 637";
						//+"Limit "+0+","+2;
						rs=stm.executeQuery(sql);
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return rs;
				}
				
				//Get Rejected Students for sending Email 
				public ResultSet getRejectedStudent()
				{
					ResultSet rs = null;
              	try {	
						String sql="SELECT * FROM applystudenttable "+"Limit "+0+","+2;
						rs=stm.executeQuery(sql);
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return rs;
				}
				
				//Get Email for sending 
				public String getStudentEmail(int studentId)
				{
					ResultSet rs = null;
					String email = "";
              	try {	
						String sql=" SELECT * FROM membertable where memberId ="+ studentId;
						rs=stm.executeQuery(sql);
						
						while(rs.next())
						{
							email = rs.getString("memberEmail");
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return email;
				}	
				
				//Get University for sending email to both admissible and rejected students
				public String getUniversity(int universityId)
				{
					ResultSet rs = null;
					String name = "";
              	try {	
						String sql="SELECT * FROM specificuniversitytable where specificUniversityId ="+ universityId;
						rs=stm.executeQuery(sql);
						
						while(rs.next())
						{
							name = rs.getString("universityName");
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return name;
				}
				
				public void deleteApplyList()
				{
					try {
						
						String sql="delete from applylist";	
						stm.executeUpdate(sql);
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
}

		