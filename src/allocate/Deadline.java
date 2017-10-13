package allocate;

import java.util.Date;

public class Deadline {

	public int totalMiliSecond = 0;
	public Deadline() {
		// TODO Auto-generated constructor stub
	}
	public int getDeadline()
	{
		int secondFromHour = 0, secondFromMinute = 0, secondFromSecond = 0;
		
		MakeApplying m = new MakeApplying();
		m.getConnection();
		
		int hourSet = m.getHour();
		int minuteSet = m.getMinute();
		int secondSet = m.getSecond();
		
		Date d = new Date();
		int hourNow = d.getHours();
		int minuteNow = d.getMinutes();
		int secondNow = d.getSeconds();
		
		if(hourNow > 12)
		{
			hourNow = hourNow -12;
		}
		
		if(hourSet > hourNow)
		{
			secondFromHour = (hourSet-hourNow)*360;
		}
		if(minuteSet > minuteNow)
		{
			secondFromMinute = (minuteSet-minuteNow)*60;
		}
		if(secondSet > secondNow)
		{
			secondFromSecond = secondSet-secondNow;
		}

		
		totalMiliSecond = (secondFromHour + secondFromMinute + secondFromSecond)*1000;
		return totalMiliSecond;
	}
	
	public int getMinute()
	{
		MakeApplying m = new MakeApplying();
		m.getConnection();
		
		int setMinute = m.getMinute();
		return setMinute;
	}
	
	public int getSecond()
	{
		MakeApplying m = new MakeApplying();
		m.getConnection();
		
		int setSecond = m.getSecond();
		return setSecond;
	}
	
	public static void main(String[] args)
	{
		Deadline d = new Deadline();
		int mili = d.getDeadline();
		System.out.println(mili);
	}
}
