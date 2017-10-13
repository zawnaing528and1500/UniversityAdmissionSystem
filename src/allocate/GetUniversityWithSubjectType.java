package allocate;
import java.sql.*;
public class GetUniversityWithSubjectType {
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
	
	public ResultSet getUniversityWithSubjectType(int subjectTypeId)
	{
		ResultSet rs=null;
		try {
			
			String sql="SELECT * FROM specificuniversitytable t1 join universityforsubjecttypetable t2 on t1.universityId = t2.universityId where t2.subjectTypeId ="+subjectTypeId;	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getAllUniversities()
	{
		ResultSet rs=null;
		try {
			String sql="SELECT * FROM universitytable";	
			rs=stm.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getMajor()
	{
		ResultSet rs=null;
		try {
			String sql="SELECT * FROM majortable where majorId > 8";	
			rs=stm.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getInstituteUniversity()
	{
		ResultSet rs=null;
		try {
			String sql="SELECT * FROM universitytable where universityId < 82";	
			rs=stm.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public String getUniversityName(int universityId)
	{
		String name = "";
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM universitytable where universityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
	
	public String getSpecificUniversityName(int universityId)
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
	
	public int getUniversityId(String startWord,String endWord)
	{
		int universityId = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where universityName like '"+startWord+"%' and universityName like '%"+endWord+"'";	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				 universityId = rs.getInt("specificUniversityId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return universityId;
	}
	
	public void insertOptionsForApply(int sId, int opt1, int opt2, int opt3, int opt4, int opt5, int opt6,String studentName, int totalMark, String gender)
	{
	try {
			
			String sql=" update applystudenttable set option1 = "+opt1+",option2 = "+opt2+",option3 = "+opt3+",option4 = "+opt4+",option5 = "+opt5+",option6 = "+opt6+",studentName = '"+studentName+"',totalMark = "+totalMark+",gender = '"+gender+"' where studentId = "+sId ;	
			stm.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	 public void insertToApplyList(int studentId)
	 {
			try {
				
				String sql="insert into applylist values("+studentId+")";	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	 }
	 
	 public boolean checkApplyList(int studentId)
		{
			ResultSet rs=null;
			boolean check = false;
			try {
				String sql="SELECT * FROM applylist where studentId ="+studentId;	
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
	 
	 public int getDeadline()
		{
			int deadline = 0;
			ResultSet rs = null;
			try {
				String sql=" SELECT * FROM website";	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					deadline = rs.getInt("deadline");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return deadline;
		}
	 
	 public int getYear()
		{
			ResultSet rs=null;
			int year = 0;
			try {
				String sql="SELECT * FROM website";	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					year = rs.getInt("year");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return year;
		}
	 
	 public int getMonth()
		{
			ResultSet rs=null;
			int month = 0;
			try {
				String sql="SELECT * FROM website";	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					month = rs.getInt("month");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return month;
		}
	 
	 public int getDay()
		{
			ResultSet rs=null;
			int day = 0;
			try {
				String sql="SELECT * FROM website";	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					day = rs.getInt("day");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return day;
		}
	 
	 public int getHour()
		{
			ResultSet rs=null;
			int hour = 0;
			try {
				String sql="SELECT * FROM website";	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					hour = rs.getInt("hour");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return hour;
		}
	 
	 public int getMinute()
		{
			ResultSet rs=null;
			int minute = 0;
			try {
				String sql="SELECT * FROM website";	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					minute = rs.getInt("minute");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return minute;
		}
	 
	 public int getSecond()
		{
			ResultSet rs=null;
			int second = 0;
			try {
				String sql="SELECT * FROM website";	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					second = rs.getInt("second");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return second;
		}
	 
	 public int getOption1(int studentId)
		{
			ResultSet rs=null;
			int option1 = 0;
			try {
				String sql="SELECT * FROM applystudenttable where studentId = "+studentId;	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					option1 = rs.getInt("option1");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return option1;
		}
	 
	 public int getOption2(int studentId)
		{
			ResultSet rs=null;
			int option2 = 0;
			try {
				String sql="SELECT * FROM applystudenttable where studentId = "+studentId;	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					option2 = rs.getInt("option2");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return option2;
		}
	 
	 public int getOption3(int studentId)
		{
			ResultSet rs=null;
			int option3 = 0;
			try {
				String sql="SELECT * FROM applystudenttable where studentId = "+studentId;	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					option3 = rs.getInt("option3");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return option3;
		}
	 
	 public int getOption4(int studentId)
		{
			ResultSet rs=null;
			int option4 = 0;
			try {
				String sql="SELECT * FROM applystudenttable where studentId = "+studentId;	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					option4 = rs.getInt("option4");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return option4;
		}
	 
	 public int getOption5(int studentId)
		{
			ResultSet rs=null;
			int option5 = 0;
			try {
				String sql="SELECT * FROM applystudenttable where studentId = "+studentId;	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					option5 = rs.getInt("option5");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return option5;
		}
	 
	 public int getOption6(int studentId)
		{
			ResultSet rs=null;
			int option6 = 0;
			try {
				String sql="SELECT * FROM applystudenttable where studentId = "+studentId;	
				rs=stm.executeQuery(sql);
				while(rs.next())
				{
					option6 = rs.getInt("option6");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return option6;
		}
}
