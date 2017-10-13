package allocateUniversity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MakeAllocation {

	public MakeAllocation() {
		// TODO Auto-generated constructor stub
	}
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
	 public void close()
	 {
		 try {
			stm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
}
