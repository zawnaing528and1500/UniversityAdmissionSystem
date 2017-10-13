package distribute;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SyncUniversityDetail {

	public SyncUniversityDetail() {
		// TODO Auto-generated constructor stub
	}
	public void syncUniversityDetail() throws SQLException
	{
		MakeDistributedApplying m = new MakeDistributedApplying();
		m.getConnectionFromOtherComputer();
		ResultSet rs1 = m.getUniversityDetailFromOtherComputer();
		while(rs1.next())
		{
			int specificUniversityId = rs1.getInt("universityId");
			String universityName = rs1.getString("universityName");
			String city = rs1.getString("city");
			String region = rs1.getString("region");
			int minMarkForMale = rs1.getInt("minMarkForMale");
			int minMarkForFemale = rs1.getInt("minMarkForFemale");
			int maleCapacity = rs1.getInt("maleCapacity");
			int femaleCapacity = rs1.getInt("femaleCapacity");
			String description = rs1.getString("description");
			
			MakeDistributedApplying m1 = new MakeDistributedApplying();
			m1.getConnection();
			m1.updateUniversity(specificUniversityId, universityName, city, region, minMarkForMale, minMarkForFemale, maleCapacity, femaleCapacity, description);
		}	
	}
}
