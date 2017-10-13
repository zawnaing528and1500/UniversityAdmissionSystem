package allocate;
import java.sql.*;
public class ForAdmin {
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
	
	public String getNoGender(int universityId)
	{
		String name = "";
		ResultSet rs = null;
		try {
			String sql="SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
			rs=stm.executeQuery(sql);
			while(rs.next())
			{
				name = rs.getString("noGender");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
	
	public String getStudentName(int studentId)
	{
		String name = "";
		ResultSet rs = null;
		try {
			String sql=" SELECT * FROM applicationForm where studentId ="+studentId;	
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
	
	public void updateStudentName(String studentName, int studentId, String oldName)
	{
		ResultSet rs = null;
		try {
			String sql="update applicationForm set studentName = '"+studentName+"' where studentId ="+studentId+" or studentName = '"+oldName+"'";	
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
	 
		public void insertTimeForDeadline(int year, int month, int day, int hour, int minute, int second)
		{
		try {
				
				String sql="update website set year= "+year+", month = "+month+", day = "+day+", hour = "+hour+", minute = "+minute+", second ="+second;	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		public ResultSet getInstituteUniversityWithNoGenderNo()
		{
			ResultSet rs=null;
			try {
				String sql="SELECT * FROM specificuniversitytable where universityId <= 17 and noGender = 'no'";	
				rs=stm.executeQuery(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
		
		public ResultSet getInstituteUniversityWithNoGenderYes()
		{
			ResultSet rs=null;
			try {
				String sql="SELECT * FROM specificuniversitytable where universityId <= 17 and noGender = 'yes'";	
				rs=stm.executeQuery(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
		}
		
		 public int getNumberOfApplyStudent(int universityId)
			{
				ResultSet rs=null;
				int count = 0;
				try {
					String sql="SELECT * FROM applicationForm where option1 = "+universityId+" or option2 = "+universityId+" or option3 = "+universityId+" or  option4 ="+universityId+" or option5 = "+universityId+" or option6 = "+universityId;	
					rs=stm.executeQuery(sql);
					while(rs.next())
					{
						count++;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return count;
			}
		 
		 public ResultSet getApplyStudent(int universityId)
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM applicationForm where option1 = "+universityId+" or option2 = "+universityId+" or option3 = "+universityId+" or  option4 ="+universityId+" or option5 = "+universityId+" or option6 = "+universityId;	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getAcceptedStudent(int universityId)
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM applicationform t1 inner join allocatedtable t2 on t1.studentId = t2.studentId where t2.specificUniversityId ="+universityId;	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public int getNumberOfAcceptedStudent(int universityId)
			{
				ResultSet rs=null;
				int count = 0;
				try {
					String sql="SELECT * FROM allocatedtable where specificUniversityId = "+universityId;	
					rs=stm.executeQuery(sql);
					while(rs.next())
					{
						count++;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return count;
			}
		 
		 public ResultSet getRejectedStudent()
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
		 

		 
		 public int getMinMark(String gender,int universityId)
			{
				ResultSet rs=null;
				int minMark = 0;
				try {
					String sql= "SELECT * from specificuniversitytable where specificUniversityId = "+universityId;	
					rs=stm.executeQuery(sql);
					while(rs.next())
					{
						if(gender.equals("m"))
							minMark = rs.getInt("minMarkForMale");
						else
							minMark = rs.getInt("minMarkForFemale");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return minMark;
			}
		 
		 public String getReasonForRejectedStudent(int universityId, int totalMark, String gender)
			{
				int minMark = 0, limitedCapacity = 0, currentCapacity = 0;
				String reason = "";
				String noGender = "";
				ResultSet rs = null;
				try {
					String sql="SELECT * FROM specificuniversitytable where specificUniversityId ="+universityId;	
					rs=stm.executeQuery(sql);
					if(rs.next())
					{
						noGender = rs.getString("noGender");
						if(noGender.equals("no"))
						{
							if(gender.equals("m"))
							{
								minMark = rs.getInt("minMarkForMale");
								limitedCapacity = rs.getInt("maleCapacity");
								currentCapacity = rs.getInt("currentMaleCapacity");
								if(totalMark < minMark)
								{
									reason = "Total Mark does not meet male minimum mark.";
								}
								if(limitedCapacity == currentCapacity)
								{
									reason = "Male capacity is full";
								}
							}
							else
							{
								minMark = rs.getInt("minMarkForFemale");
								limitedCapacity = rs.getInt("femaleCapacity");
								currentCapacity = rs.getInt("currentFemaleCapacity");
								if(totalMark < minMark)
								{
									reason = "Total Mark does not meet female minimum mark.";
								}
								else if(limitedCapacity == currentCapacity)
								{
									reason = "Female capacity is full";
								}
							}
						}
						else
						{
							minMark = rs.getInt("minMarkForMale");//minMarkForFemale can be used
							limitedCapacity = rs.getInt("totalCapacity");
							currentCapacity = rs.getInt("currentTotalCapacity");
							if(totalMark < minMark)
							{
								reason = "Total Mark does not meet minimum mark.";
							}
							else if(limitedCapacity == currentCapacity)
							{
								reason = "University capacity is full";
							}
						}	
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return reason;
			}
		 
		 public String acceptOrReject(int studentId, int universityId)
			{
				ResultSet rs=null;
				String result = "reject";
				try {
					String sql="SELECT * FROM allocatedtable where studentId = "+studentId+" and specificUniversityId = "+ universityId;	
					rs=stm.executeQuery(sql);
					if(rs.next())
					{
						result = "accept";
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return result;
			}
		 
		 public ResultSet getUniversities(int specificUniversityId)
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM specificuniversitytable where specificUniversityId ="+specificUniversityId;	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getMedicalUniversity()
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM specificuniversitytable where specificUniversityId <= 14";	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getTechnologicalUniversity()
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM specificuniversitytable where specificUniversityId >= 15 and specificUniversityId <= 47 and specificUniversityId != 44 and specificUniversityId != 45 or specificUniversityId = 70 or specificUniversityId = 71 or specificUniversityId = 72";	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getComputerUniversity()
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM specificuniversitytable where specificUniversityId >= 48 and specificUniversityId <= 69 or specificUniversityId = 44 or specificUniversityId = 45";	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getEducationUniversity()
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM specificuniversitytable where specificUniversityId >= 76 and specificUniversityId <= 81";	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getEconomicUniversity()
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM specificuniversitytable where specificUniversityId >= 73 and specificUniversityId <= 75";	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getLiberalUniversity()
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM universitytable where universityId >= 82 and universityId <= 113";	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getAppliedMajor(String universityName)
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM specificuniversitytable where universityName like '%, "+universityName+"'";	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
		 
		 public ResultSet getLanguageUniversity()
			{
				ResultSet rs=null;
				try {
					String sql="SELECT * FROM universitytable where universityId = 114 or universityId = 115";	
					rs=stm.executeQuery(sql);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return rs;
			}
}
