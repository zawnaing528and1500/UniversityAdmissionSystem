package test;
import java.sql.ResultSet;

import allocate.MakeApplying;

import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.management.RuntimeMXBean;


public class AllocateUniversitiesVersion1 {

	public AllocateUniversitiesVersion1() {
		// TODO Auto-generated constructor stub
	}
	
	public void allocate()
	{
		int minMark = 0,capacity = 0,limitCapacity = 0,limitTotalCapacity = 0, currentTotalCapacity = 0,studentId = 1,count = 1,markNeed = 0, capacityNeed = 0;
		String noGender;
		MakeApplying m = new MakeApplying();
		m.getConnection();
		
		while(studentId < 5001)
		{
		int appliedOption[] = m.getSixOptions(studentId);
	
				int universityId1 = appliedOption[0];
				int universityId2 = appliedOption[1];
				int universityId3 = appliedOption[2];
				int universityId4 = appliedOption[3];
				int universityId5 = appliedOption[4];
				int universityId6 = appliedOption[5];
	
				int markForCurrentStudent = appliedOption[6];
				String genderForCurrentStudent = m.getGender(studentId);
				
					currentTotalCapacity = m.getCurrentTotalCapacity(universityId1);
					limitTotalCapacity = m.getTotalCapacity(universityId1);
					noGender = m.getNoGender(universityId1);
					if(genderForCurrentStudent.equals("m"))
					{
						 capacity = m.getCurrentMaleCapacity(universityId1);
						 limitCapacity = m.getMaleCapacity(universityId1);
						 minMark = m.getMinMarkForMale(universityId1);
						 markNeed = minMark - markForCurrentStudent;
						 capacityNeed = limitTotalCapacity - currentTotalCapacity;
					}
					else
					{
					 capacity = m.getCurrentFemaleCapacity(universityId1);
					 limitCapacity = m.getFemaleCapacity(universityId1);
					 minMark = m.getMinMarkForFemale(universityId1);
					 markNeed = minMark - markForCurrentStudent;
					 capacityNeed = limitTotalCapacity - currentTotalCapacity;
					}
					
					if(noGender.equals("yes"))
					{
						capacity = 1;
						limitCapacity = 2;
					}

					if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity || markNeed == 1 && capacityNeed == 1)
					{
						m.increaseCapacity(genderForCurrentStudent, universityId1);
						m.allocate(studentId, universityId1);
						m.deleteOption(studentId);studentId++;
						count++;
						if(count == 250)
						{
							count = 0;
							System.out.println("Allocating agent is still allocating universities.");
						}
						continue;
					}
						else{
							
								currentTotalCapacity = m.getCurrentTotalCapacity(universityId2);
								limitTotalCapacity = m.getTotalCapacity(universityId2);
								noGender = m.getNoGender(universityId2);
								if(genderForCurrentStudent.equals("m"))
								{
									 capacity = m.getCurrentMaleCapacity(universityId2);
									 limitCapacity = m.getMaleCapacity(universityId2);
									 minMark = m.getMinMarkForMale(universityId2);
									 markNeed = minMark - markForCurrentStudent;
									 capacityNeed = limitTotalCapacity - currentTotalCapacity;
								}
								else
								{
								 capacity = m.getCurrentFemaleCapacity(universityId2);
								 limitCapacity = m.getFemaleCapacity(universityId2);
								 minMark = m.getMinMarkForFemale(universityId2);
								 markNeed = minMark - markForCurrentStudent;
								 capacityNeed = limitTotalCapacity - currentTotalCapacity;
								}
								
								if(noGender.equals("yes"))
								{
									capacity = 1;
									limitCapacity = 2;
								}
								
								if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity || markNeed == 1 && capacityNeed == 1)
								{
									m.increaseCapacity(genderForCurrentStudent, universityId2);
									m.allocate(studentId, universityId2);
									m.deleteOption(studentId);studentId++;
									count++;
									if(count == 250)
									{
										count = 0;
										System.out.println("Allocating agent is still allocating universities.");
									}
									continue;
								}
									else{
											currentTotalCapacity = m.getCurrentTotalCapacity(universityId3);
											limitTotalCapacity = m.getTotalCapacity(universityId3);
											noGender = m.getNoGender(universityId3);
											if(genderForCurrentStudent.equals("m"))
											{
												 capacity = m.getCurrentMaleCapacity(universityId3);
												 limitCapacity = m.getMaleCapacity(universityId3);
												 minMark = m.getMinMarkForMale(universityId3);
												 markNeed = minMark - markForCurrentStudent;
												 capacityNeed = limitTotalCapacity - currentTotalCapacity;
											}
											else
											{
											 capacity = m.getCurrentFemaleCapacity(universityId3);
											 limitCapacity = m.getFemaleCapacity(universityId3);
											 minMark = m.getMinMarkForFemale(universityId3);
											 markNeed = minMark - markForCurrentStudent;
											 capacityNeed = limitTotalCapacity - currentTotalCapacity;
											}
											
											if(noGender.equals("yes"))
											{
												capacity = 1;
												limitCapacity = 2;
											}
											
											if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity || markNeed == 1 && capacityNeed == 1)
											{
												m.increaseCapacity(genderForCurrentStudent, universityId3);
												m.allocate(studentId, universityId3);
												m.deleteOption(studentId);studentId++;
												count++;
												if(count == 250)
												{
													count = 0;
													System.out.println("Allocating agent is still allocating universities.");
												}
												continue;
											}
												else{
														currentTotalCapacity = m.getCurrentTotalCapacity(universityId4);
														limitTotalCapacity = m.getTotalCapacity(universityId4);
														noGender = m.getNoGender(universityId4);
														if(genderForCurrentStudent.equals("m"))
														{
															 capacity = m.getCurrentMaleCapacity(universityId4);
															 limitCapacity = m.getMaleCapacity(universityId4);
															 minMark = m.getMinMarkForMale(universityId4);
															 markNeed = minMark - markForCurrentStudent;
															 capacityNeed = limitTotalCapacity - currentTotalCapacity;
														}
														else
														{
														 capacity = m.getCurrentFemaleCapacity(universityId4);
														 limitCapacity = m.getFemaleCapacity(universityId4);
														 minMark = m.getMinMarkForFemale(universityId4);
														 markNeed = minMark - markForCurrentStudent;
														 capacityNeed = limitTotalCapacity - currentTotalCapacity;
														}
														
														if(noGender.equals("yes"))
														{
															capacity = 1;
															limitCapacity = 2;
														}
														
														if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity || markNeed == 1 && capacityNeed == 1)
														{
															m.increaseCapacity(genderForCurrentStudent, universityId4);
															m.allocate(studentId, universityId4);
															m.deleteOption(studentId);studentId++;
															count++;
															if(count == 250)
															{
																count = 0;
																System.out.println("Allocating agent is still allocating universities.");
															}
															continue;
														}
															else{
																	currentTotalCapacity = m.getCurrentTotalCapacity(universityId5);
																	limitTotalCapacity = m.getTotalCapacity(universityId5);
																	noGender = m.getNoGender(universityId5);
																	if(genderForCurrentStudent.equals("m"))
																	{
																		 capacity = m.getCurrentMaleCapacity(universityId5);
																		 limitCapacity = m.getMaleCapacity(universityId5);
																		 minMark = m.getMinMarkForMale(universityId5);
																		 markNeed = minMark - markForCurrentStudent;
																		 capacityNeed = limitTotalCapacity - currentTotalCapacity;
																	}
																	else
																	{
																	 capacity = m.getCurrentFemaleCapacity(universityId5);
																	 limitCapacity = m.getFemaleCapacity(universityId5);
																	 minMark = m.getMinMarkForFemale(universityId5);
																	 markNeed = minMark - markForCurrentStudent;
																	 capacityNeed = limitTotalCapacity - currentTotalCapacity;
																	}
																	
																	if(noGender.equals("yes"))
																	{
																		capacity = 1;
																		limitCapacity = 2;
																	}
																	
																	if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity || markNeed == 1 && capacityNeed == 1)
																	{
																		m.increaseCapacity(genderForCurrentStudent, universityId5);
																		m.allocate(studentId, universityId5);
																		m.deleteOption(studentId);studentId++;
																		count++;
																		if(count == 250)
																		{
																			count = 0;
																			System.out.println("Allocating agent is still allocating universities.");
																		}
																		continue;
																	}
																		else{
																				currentTotalCapacity = m.getCurrentTotalCapacity(universityId6);
																				limitTotalCapacity = m.getTotalCapacity(universityId6);
																				noGender = m.getNoGender(universityId6);
																				if(genderForCurrentStudent.equals("m"))
																				{
																					 capacity = m.getCurrentMaleCapacity(universityId6);
																					 limitCapacity = m.getMaleCapacity(universityId6);
																					 minMark = m.getMinMarkForMale(universityId6);
																					 markNeed = minMark - markForCurrentStudent;
																					 capacityNeed = limitTotalCapacity - currentTotalCapacity;
																				}
																				else
																				{
																				 capacity = m.getCurrentFemaleCapacity(universityId6);
																				 limitCapacity = m.getFemaleCapacity(universityId6);
																				 minMark = m.getMinMarkForFemale(universityId6);
																				 markNeed = minMark - markForCurrentStudent;
																				 capacityNeed = limitTotalCapacity - currentTotalCapacity;
																				}
																				
																				if(noGender.equals("yes"))
																				{
																					capacity = 1;
																					limitCapacity = 2;
																				}
																				
																				if(markForCurrentStudent >= minMark && currentTotalCapacity < limitTotalCapacity && capacity < limitCapacity || markNeed == 1 && capacityNeed == 1)
																				{
																					m.increaseCapacity(genderForCurrentStudent, universityId6);
																					m.allocate(studentId, universityId6);
																					m.deleteOption(studentId);studentId++;
																					count++;
																					if(count == 250)
																					{
																						count = 0;
																						System.out.println("Allocating agent is still allocating universities.");
																					}
																					continue;
																				}
																		}
															}
												}
									}
								
						}
					
					
					studentId++;
					count++;
					if(count == 250)
					{
						count = 0;
						System.out.println("Allocating agent is still allocating universities.");
					}
					
				}
		System.out.println("Allcating-agent finishes allocating universities.");
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
		        //Thread.sleep(500);
		        AllocateUniversities a = new AllocateUniversities();
		        a.allocate();
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
