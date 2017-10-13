package distribute;
import java.sql.*;
public class OtherUas {

	Connection con;
	Statement stm;
	
	public OtherUas() {
		// TODO Auto-generated constructor stub
	}
	public void getConnection()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost/otheruas","root","");
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
	
	//Use in editing university
	public ResultSet getUniversityById(int specificUniversityId)
	{
		ResultSet rs=null;
		try {
			
			String sql=" SELECT * FROM university where universityId ="+specificUniversityId;	
			rs=stm.executeQuery(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	 public void updateUniversityInOtherUas(int specificUniversityId, String universityName, String city, String region, int minMarkForMale, int minMarkForFemale, int maleCapacity, int femaleCapacity, String description)
	 {
		 int totalCapacity = maleCapacity+femaleCapacity;
			try {
				
				String sql="update university set universityName = '"+universityName+"', city = '"+city+"', region = '"+region+"', minMarkForMale = "+minMarkForMale+", minMarkForFemale = "+minMarkForFemale+", maleCapacity = "+maleCapacity+", femaleCapacity = "+femaleCapacity+", description= '"+description+"' where universityId="+specificUniversityId;	
				stm.executeUpdate(sql);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	 }
}
