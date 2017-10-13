package test;

import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.management.RuntimeMXBean;

public class Cputime {

	public Cputime() {
		// TODO Auto-generated constructor stub
	}
	public static void printNumber()
	{
		int i = 0;
		while(i < 1000)
		{
			System.out.println(i);
			i++;
		}
	}
	
	public static void getCpuTime()
	{
		OperatingSystemMXBean operatingSystemMXBean = 
		         (com.sun.management.OperatingSystemMXBean)ManagementFactory.getOperatingSystemMXBean();
		    RuntimeMXBean runtimeMXBean = ManagementFactory.getRuntimeMXBean();
		    int availableProcessors = operatingSystemMXBean.getAvailableProcessors();
		    long prevUpTime = runtimeMXBean.getUptime();
		    long prevProcessCpuTime = ((com.sun.management.OperatingSystemMXBean) operatingSystemMXBean).getProcessCpuTime();
		    double cpuUsage;
		    try 
		    {
		        Thread.sleep(500);
		        printNumber();
		    } 
		    catch (Exception ignored) { }

		    operatingSystemMXBean = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
		    long upTime = runtimeMXBean.getUptime();
		    long processCpuTime = ((com.sun.management.OperatingSystemMXBean) operatingSystemMXBean).getProcessCpuTime();
		    long elapsedCpu = processCpuTime - prevProcessCpuTime;
		    long elapsedTime = upTime - prevUpTime;

		    cpuUsage = Math.min(99F, elapsedCpu / (elapsedTime * 10000F * availableProcessors));
		    System.out.println("Java CPU: " + cpuUsage);
	}
	
	public static void main(String[] args)
	{
		getCpuTime();
	}

}
