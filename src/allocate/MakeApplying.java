package allocate;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
public class MakeApplying {
	
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
				//System.out.println("Database Connection is OK.");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//get all students who have been applied for the university
	
	public ResultSet getStudentApply()
	{
		ResultSet rs=null;
		try {
			
			String sql="SELECT * FROM applystudenttable";	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public int getHour()
	{
		int hour = 0;
		ResultSet rs=null;
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
		int minute = 0;
		ResultSet rs=null;
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
		int second = 0;
		ResultSet rs=null;
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
	
	public ResultSet getApplyList(int studentId)
	{
		ResultSet rs=null;
		try {
			
			String sql="SELECT * FROM applylist where studentId="+studentId;	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	//get all students in allocation
	public ResultSet getStudentApplyForAllocate()
	{
		ResultSet rs=null;
		try {
			
			String sql="SELECT * FROM applystudenttable ORDER BY totalMark DESC";	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getStudentDetail(int studentId)
	{
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM studenttable where studentId ="+studentId;	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public String getStudentName(int studentId)
	{
		String name = "";
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM studenttable where studentId ="+studentId;	
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
	
	public int getStudentId(String roll)
	{
		int studentId = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM studenttable where studentRollNumber ='"+roll+"'";	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				 studentId = rs.getInt("studentId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return studentId;
	}
	
	
	public int[] getSixOptions(int studentId)
	{
		int[] appliedOption = new int[7];
		ResultSet rs=null;
		try {
			String sql="SELECT * FROM applystudenttable where studentId = "+studentId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				int option1 = rs.getInt("option1");
				int option2 = rs.getInt("option2");
				int option3 = rs.getInt("option3");
				int option4 = rs.getInt("option4");
				int option5 = rs.getInt("option5");
				int option6 = rs.getInt("option6");
				int totalMark = rs.getInt("totalMark");
				
				appliedOption[0] = option1;
				appliedOption[1] = option2;
				appliedOption[2] = option3;
				appliedOption[3] = option4;
				appliedOption[4] = option5;
				appliedOption[5] = option6;
				
				appliedOption[6] = totalMark;
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return appliedOption;
	}
	
	
	
	public ResultSet getAllUniversities()
	{
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM specificuniversitytable";	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public int getTotalCapacity(int universityId)
	{
		int totalCapacity = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				totalCapacity = rs.getInt("totalCapacity");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCapacity;
	}
	
	
	public int getCurrentTotalCapacity(int universityId)
	{
		int currentTotalCapacity = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				currentTotalCapacity = rs.getInt("currentTotalCapacity");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return currentTotalCapacity;
	}
	
	public int getMaleCapacity(int universityId)
	{
		int maleCapacity = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				maleCapacity = rs.getInt("maleCapacity");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return maleCapacity;
	}
	
	
	public int getCurrentMaleCapacity(int universityId)
	{
		int currentMaleCapacity = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				currentMaleCapacity = rs.getInt("currentMaleCapacity");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return currentMaleCapacity;
	}
	
	public int getFemaleCapacity(int universityId)
	{
		int femaleCapacity = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				femaleCapacity = rs.getInt("femaleCapacity");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return femaleCapacity;
	}
	
	public int getCurrentFemaleCapacity(int universityId)
	{
		int currentFemaleCapacity = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				currentFemaleCapacity = rs.getInt("currentFemaleCapacity");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return currentFemaleCapacity;
	}
	
	public int getMinMarkForMale(int universityId)
	{
		int minMarkForMale = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				minMarkForMale = rs.getInt("minMarkForMale");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return minMarkForMale;
	}
	
	
	public int getMinMarkForFemale(int universityId)
	{
		int minMarkForFemale = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				minMarkForFemale = rs.getInt("minMarkForFemale");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return minMarkForFemale;
	}
	
	public String getNoGender(int universityId)
	{
		String noGender = null;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				noGender = rs.getString("noGender");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noGender;
	}
	
	
	
	//Use in editing university
	public ResultSet getUniversityById(int specificUniversityId)
	{
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId ="+specificUniversityId;	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//use in editing student
	public ResultSet getStudentById(int studentId)
	{
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM studenttable where studentId ="+studentId;	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getAppliedUniversities(int universityId)
	{
		ResultSet rs=null;
		try {
			String sql=" SELECT * FROM specificuniversitytable where specificUniversityId="+universityId;	
			rs=stm.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public void deleteOption(int studentId)
	{
		try {
			String sql="delete from applystudenttable where studentId="+studentId;	
			stm.executeUpdate(sql);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void increaseCapacity(String gender, int universityId)
	{
		try {
				if(gender.equals("m"))
				{
				 String sql="update specificuniversitytable set currentTotalCapacity = currentTotalCapacity+1,currentMaleCapacity = currentMaleCapacity+1 where specificUniversityId ="+universityId;	
				 stm.executeUpdate(sql);
				}
				else if(gender.equals("f"))
				{
				String sql="update specificuniversitytable set currentTotalCapacity = currentTotalCapacity+1,currentFemaleCapacity = currentFemaleCapacity+1 where specificUniversityId ="+universityId;
				stm.executeUpdate(sql);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void allocate(int studentId, int universityId)
	{
		try {
			String sql = "insert into allocatedtable values("+studentId+","+universityId+")";
			stm.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setDesire1(int studentId)
	{
		String sql = null;
		try {
			sql = "update applystudenttable set desire1 = 'true' where studentId ="+studentId;
			stm.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
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
	
	
	public ResultSet getReportOnAllocatedStudentList()
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
	
	
	public int[] getSpecificUniversityIdForApplyings(int subjectTypeId)
	{
		int[] appliedOption = new int[7];
		int i =0;
		ResultSet rs=null;
		try {
			
			String sql="SELECT * FROM specificuniversitytable u1 INNER JOIN universityforsubjecttypetable u2 ON u1.universityId = u2.universityId WHERE u2.subjectTypeId = "+subjectTypeId+" ORDER BY RAND() LIMIT 7";	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				int universityId = rs.getInt(1);
				appliedOption[i] = universityId;
				i++;
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return appliedOption;
	}
	
	public int getUniversityIdByRandom (int totalMark, String city)
	{
		ResultSet rs=null;
		int universityId = 0;
		try {
			
			String sql="SELECT * FROM specificuniversitytable where city ='"+city+"' and minMarkForMale <= "+totalMark+" and currentTotalCapacity < totalCapacity ORDER BY RAND() LIMIT 2";	
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
	
	public void insertOptions(int sId, int opt1, int opt2, int opt3, int opt4, int opt5, int opt6)
	{
	try {
			
			String sql=" update applystudenttable set option1 = "+opt1+",option2 = "+opt2+",option3 = "+opt3+",option4 = "+opt4+",option5 = "+opt5+",option6 = "+opt6+" where studentId = "+sId ;	
			stm.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
	 
	 public void deleteUniversity(int specificUniversityId)
	 {
			try {
				
				String sql="delete from specificuniversitytable where specificUniversityId="+specificUniversityId;	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	 }
	 
	 public void updateUniversity(int specificUniversityId, String universityName, String city, String region, int minMarkForMale, int minMarkForFemale, int maleCapacity, int femaleCapacity, String description)
	 {
		 int totalCapacity = maleCapacity+femaleCapacity;
			try {
				
				String sql="update specificuniversitytable set universityName = '"+universityName+"', city = '"+city+"', region = '"+region+"', minMarkForMale = "+minMarkForMale+", minMarkForFemale = "+minMarkForFemale+", maleCapacity = "+maleCapacity+", femaleCapacity = "+femaleCapacity+", description= '"+description+"', totalCapacity = "+totalCapacity+" where specificUniversityId="+specificUniversityId;	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	 }
	 

	 public void deleteStudent(int studentId)
	 {
			try {
				
				String sql="delete from studenttable where studentId="+studentId;	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	 }
	 
	 public void updateStudent(int studentId, String studentName, String NRC, String studentRollNumber, int subjectType, int subject1Mark, int subject2Mark, int subject3Mark, int subject4Mark, int subject5Mark, int subject6Mark)
	 {
		 int totalMark = subject1Mark + subject2Mark + subject3Mark + subject4Mark +subject5Mark + subject6Mark;
			try {
				
				String sql="update studenttable set studentName = '"+studentName+"', NRC = '"+NRC+"', studentRollNumber = '"+studentRollNumber+"', subjectType = "+subjectType+", subject1Mark = "+subject1Mark+", subject2Mark = "+subject2Mark+", subject3Mark = "+subject3Mark+", subject4Mark ="+subject4Mark+", subject5Mark="+subject5Mark+", subject6Mark="+subject6Mark+",totalMark = "+totalMark+" where studentId="+studentId;	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	 }
	 
	 public void insertStudent(String studentName, String Gender, String NRC, String studentRollNumber, int subjectType, int subject1Mark, int subject2Mark, int subject3Mark, int subject4Mark, int subject5Mark, int subject6Mark)
	 {
		 int totalMark = subject1Mark + subject2Mark + subject3Mark + subject4Mark +subject5Mark + subject6Mark;
			try {
				
				String sql="insert into studenttable values(null,'"+studentName+"','"+Gender+"','"+NRC+"','"+studentRollNumber+"',"+subjectType+","+subject1Mark+","+subject2Mark+","+subject3Mark+","+subject4Mark+","+subject5Mark+","+subject6Mark+","+totalMark+")";	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	 }
	 
	 
}