package allAgent;
import java.sql.ResultSet;
import java.sql.SQLException;

import allocate.MakeApplying;
public class AllocateOption1 {

	public AllocateOption1() {
		// TODO Auto-generated constructor stub
	}
	public void allocate()
	{
		int minMark = 0,capacity = 0,limitCapacity = 0;
		MakeApplying m = new MakeApplying();
		m.getConnection();
		ResultSet rs = m.getStudentApplyForAllocate();
		try {
			while(rs.next())
			{
				int studentId =rs.getInt("studentId");
				int universityId = rs.getInt("option1");
				String studentName = rs.getString("studentName");
				int markForCurrentStudent = rs.getInt("totalMark");
				String genderForCurrentStudent = rs.getString("gender");
				
				MakeApplying m1 = new MakeApplying();
				m1.getConnection();
				ResultSet rs1 = m1.getAppliedUniversities(universityId);
				while(rs1.next())
				{
					String universityName = rs1.getString("universityName");
					int currentTotalCapacity = rs1.getInt("currentTotalCapacity");
					int limitTotalCapacity = rs1.getInt("totalCapacity");
					if(genderForCurrentStudent.equals("m"))
					{
						 capacity = rs1.getInt("currentMaleCapacity");
						 limitCapacity = rs1.getInt("maleCapacity");
						 minMark = rs1.getInt("minMarkForMale");
					}
					else
					{
					 capacity = rs1.getInt("currentFemaleCapacity");
					 limitCapacity = rs1.getInt("femaleCapacity");
					 minMark = rs1.getInt("minMarkForFemale");
					}

					if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity)
					{
						MakeApplying m2 = new MakeApplying();
						m2.getConnection();
						m2.increaseCapacity(genderForCurrentStudent, universityId);
						m2.allocate(studentId, universityId);
						m2.deleteOption(studentId);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args)
	{
		AllocateOption1 a = new AllocateOption1();
		System.out.println("Start to alocate");
		a.allocate();
	}

}
