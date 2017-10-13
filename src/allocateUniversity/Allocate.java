package allocateUniversity;

public class Allocate {
	static int universityId = 13;
	static int studentId =  4; 
	static String gender = "f";
	public Allocate() {
		// TODO Auto-generated constructor stub
	}
	
	@SuppressWarnings("static-access")
	public Allocate(int studentId,int universityId, String gender)
	{
		this.studentId = studentId;
		this.universityId = universityId;
		this.gender = gender;
	}
	

	public static void allocate()
	{
		MakeAllocation m = new MakeAllocation();
		m.getConnection();
		m.increaseCapacity(gender, universityId);
		m.allocate(studentId, universityId);
		m.setDesire1(studentId);
	}
	
	public static void print()
	{
		System.out.println(studentId+","+universityId+","+gender);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		print();
		allocate();
		
	}

}
