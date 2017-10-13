package allAgent;
import java.sql.ResultSet;
import java.sql.SQLException;

import allocate.MakeApplying;
import distribute.MakeDistributedApplying;
public class CheckChanges {


	public CheckChanges() {
		// TODO Auto-generated constructor stub
	}
	public boolean checkChanges()
	{
		boolean checkValue = true;
		
		MakeApplying m = new MakeApplying();
		m.getConnection();
		ResultSet rs = m.getAppliedUniversities(1);
		try {
			while(rs.next())
			{
				String universityName = rs.getString("universityName");
				String city = rs.getString("city");
				String region = rs.getString("region");
				int minMarkForMale = rs.getInt("minMarkForMale");
				int minMarkForFemale = rs.getInt("minMarkForFemale");
				int maleCapacity = rs.getInt("maleCapacity");
				int femaleCapacity = rs.getInt("femaleCapacity");
				String description = rs.getString("description");
				
				MakeDistributedApplying m1 = new MakeDistributedApplying();
				m1.getConnectionFromOtherComputer();
				ResultSet rs1 = m1.getUniversityDetailFromOtherComputer();
				while(rs1.next())
				{
					String universityName1 = rs1.getString("universityName");
					String city1 = rs1.getString("city");
					String region1 = rs1.getString("region");
					int minMarkForMale1 = rs1.getInt("minMarkForMale");
					int minMarkForFemale1 = rs1.getInt("minMarkForFemale");
					int maleCapacity1 = rs1.getInt("maleCapacity");
					int femaleCapacity1 = rs1.getInt("femaleCapacity");
					String description1 = rs1.getString("description");
					
					if(universityName.equals(universityName1) && city.equals(city1) && region.equals(region1) && minMarkForMale == minMarkForMale1 && minMarkForFemale == minMarkForFemale1 && maleCapacity == maleCapacity1 && femaleCapacity == femaleCapacity1 && description.equals(description1))
					{
						checkValue = false;
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return checkValue;
		
	}
}
