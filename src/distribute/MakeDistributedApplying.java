package distribute;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
public class MakeDistributedApplying {
	
	Connection con;
	Statement stm;
	public int totalProfit = 0;
	
	public void getConnectionFromOtherComputer()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost/otheruas","root","");
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
	

	
	//get Detail of university from other computer
	
	public ResultSet getUniversityDetailFromOtherComputer()
	{
		ResultSet rs=null;
		try {
			
			String sql="SELECT * FROM university";	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public void getConnection()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				//Here need to use ip address
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
	
	public int getStudentId(String nrc)
	{
		int studentId = 0;
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM studenttable where studentRollNumber ='"+nrc+"'";	
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
		String sql = "";
		try {
				if(gender.equals("m"))
				{
				 sql="update specificuniversitytable set currentTotalCapacity = currentTotalCapacity+1,currentMaleCapacity = currentMaleCapacity+1 where specificUniversityId ="+universityId;	
				}
				else if(gender.equals("f"))
				{
				sql="update specificuniversitytable set currentTotalCapacity = currentTotalCapacity+1,currentFemaleCapacity = currentFemaleCapacity+1 where specificUniversityId ="+universityId;
				}
				stm.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void allocate(int studentId, int universityId)
	{
		String sql = "";
		try {
			
			sql = "insert into allocatedtable values("+studentId+","+universityId+")";
			stm.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setDesire1(int studentId)
	{
		String sql = "";
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