package allAgent;

import java.sql.ResultSet;
import java.sql.SQLException;

import allocate.MakeApplying;

public class AllocateRejectedStudent {

	public AllocateRejectedStudent() {
		// TODO Auto-generated constructor stub
	}
	public void allocate() throws SQLException
	{
		int minMark = 0,capacity = 0,limitCapacity = 0;
		MakeApplying m = new MakeApplying();
		m.getConnection();
		ResultSet rs = m.getStudentApplyForAllocate();
		while(rs.next())
		{
			int studentId =rs.getInt("studentId");
			
			String studentName = rs.getString("studentName");
			int markForCurrentStudent = rs.getInt("totalMark");
			String genderForCurrentStudent = rs.getString("gender");
			String city = rs.getString("desire1");
			
			MakeApplying m1 = new MakeApplying();
			m1.getConnection();
			/*
			 * The program will allocate a rejected student to a university 
			 * that is the same state/region with that student.
			 */
			int universityId = m1.getUniversityIdByRandom(markForCurrentStudent, city);

			m1.allocate(studentId, universityId);
			m1.deleteOption(studentId);
		
		}
	}

}
