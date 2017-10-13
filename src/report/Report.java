package report;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Report {
	
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


	//Get Student Name
	public String getStudentName(int studentId)
	{
		String name ="";
		ResultSet rs = null;
		try {
			String sql="SELECT * FROM studenttable where studentId ="+studentId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				name = rs.getString("studentName");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
	
	//Get student roll number
	public String getStudentRollNumber(int studentId)
	{
		String name = "";
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM studenttable where studentId ="+studentId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				name = rs.getString("studentRollNumber");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
	
	//Get student NRC
	public String getStudentNRC(int studentId)
	{
		String name = "";
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM studenttable where studentId ="+studentId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				name = rs.getString("NRC");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
	
	
//Get Student Mark
	public int getMark(int currentStudentId)
	{
		int mark = 0;
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM studenttable where studentId ="+currentStudentId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				mark = rs.getInt("totalMark");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mark;
	}
	
	//Get Student Gender
	public String getGender(int currentStudentId)
	{
		String gender="";
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM studenttable where studentId ="+currentStudentId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				gender = rs.getString("Gender");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gender;
	}
	
	
	//Get Subject Type Name
	public String getSubjectTypeName(int subjectTypeId)
	{
		String gender="";
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM subjecttypetable where subjectTypeId ="+subjectTypeId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				gender = rs.getString("subject");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gender;
	}
	
	
	
	//Get Student Subject Type
	public int getSubjectType(int studentId)
	{
		ResultSet rs=null;
		int subjectType = 0;
		try {
			
			String sql=" SELECT * FROM studenttable where studentId ="+studentId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				subjectType = rs.getInt(6);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return subjectType;
	}
	
	//Get University Name
	public String getUniversityName(int universityId)
	{
		String name = "";
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
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
	
	//Get Report of student list that have been allocated
	public ResultSet getReportOnAllocatedStudentList()
	{
		ResultSet rs=null;
		try {
			
			String sql="SELECT * FROM allocatedtable where specificUniversityId = 1";	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//Get Report of student list that have been allocated
	public ResultSet getReportOnAllocatedStudentListByUniversityId(int specificUniversityId)
	{
		ResultSet rs=null;
		try {
			
			String sql="SELECT * FROM allocatedtable where specificUniversityId = "+specificUniversityId;	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	//Get Report of student list that have been rejected
		public ResultSet getReportOnRejectedStudentList()
		{
			ResultSet rs=null;
			try {
				String sql="SELECT * FROM allocatedtable";	
				rs=stm.executeQuery(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
	
}