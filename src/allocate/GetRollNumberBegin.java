package allocate;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
public class GetRollNumberBegin {
	
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

	
	//get all university in myanmar. 
	//To use when it is need to allocate for a specific option
	
	public ResultSet getRollNumberBegin()
	{
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM rollnumbertable";	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	  public int generateRandom()
	  {
		  int num = 0;
		  ArrayList<Integer> numbers = new ArrayList<Integer>();
		  for(int i = 1; i < 500; i++)
		  {
		    numbers.add(i+1);
		  }
		  Collections.shuffle(numbers);
		 
		  for(int j =0; j < 1; j++)
		  {
		    num = numbers.get(j);
		  } 
		  
		  return num;
	  }
}