package allocate;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
public class MakeApplyingOption {
	
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

	public ResultSet getStudentApply()
	{
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM applystudenttable";	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public int[] getSpecificUniversityIdForApplying(int subjectTypeId)
	{
		int[] appliedOption = new int[7];
		int i =0;
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM universityforsubjecttypetable WHERE subjectTypeId = "+subjectTypeId+" ORDER BY RAND() LIMIT 6";	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				int universityId = rs.getInt(2);
				appliedOption[i] = universityId;
				i++;
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return appliedOption;
	}
	
}