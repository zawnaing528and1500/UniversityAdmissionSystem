package allAgent;
//import jade.domain.DFService;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.TickerBehaviour;
import jade.core.behaviours.WakerBehaviour;
import jade.lang.acl.ACLMessage;
import allocate.*;

import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.management.RuntimeMXBean;


public class MainAgent extends Agent {
	ACLMessage msg;
	public int deadline = 0;
	
		@SuppressWarnings("serial")
		public void setup() {
			Deadline d = new Deadline();
			deadline = d.getDeadline();
			
		addBehaviour(new TickerBehaviour(this, 20000) { 
			protected void onTick() { 
					CheckChanges c = new CheckChanges();
					if(c.checkChanges() == true)
					{
					System.out.println("Main-agent found information Changes in other universities!");
					System.out.println();
					msg = new ACLMessage(ACLMessage.INFORM);	
					msg.setLanguage(null);
					msg.setOntology(null);
					msg.clearAllReceiver();
					msg.addReceiver(new AID("informationAgent",AID.ISLOCALNAME));
					msg.setContent("Information-agent needs to update university information");
					send(msg);
					System.out.println();
					}
					else
					{
						System.out.println("Main-agent is sensing for universities' information changes");
						//System.out.println("Information changes in other univerties is not found!");
						System.out.println();
					}
			} 
			});
	
		
		addBehaviour(new WakerBehaviour(this, deadline) { 
			protected void handleElapsedTimeout() { 
			msg = new ACLMessage(ACLMessage.INFORM);	
			msg.setLanguage(null);
			msg.setOntology(null);
			msg.clearAllReceiver();
			msg.addReceiver(new AID("allocatingAgent",AID.ISLOCALNAME));
			msg.setContent(" allocating-agent needs to allocate universities");
			send(msg);
			} 
			});
			
			
		addBehaviour(new CyclicBehaviour(this) 
        {
             public void action() 
             {
            	 ACLMessage msg= receive();
                if (msg != null)
                {
                	String body = msg.getContent();
                	if(body.equals("Main-agent needs to send emails to students"))
                	{
         
                	System.out.println("Main-agent receives the following message from allocating-agent");
                	System.out.println();
                	System.out.println("-----------------------------------------------------------------");
                	System.out.println();
	            	System.out.println(msg);
	            	System.out.println();
	            	System.out.println("-----------------------------------------------------------------");
	            	System.out.println();
                	//SendEmail s = new SendEmail();
                   //s.sendEmailToAdmissibleStudent();
	            
	            	System.out.println("Main-agent is sending emails now.");
                	System.out.println();
                	System.out.println("Main-agent have successfully sent.");
                	System.out.println();
                	System.out.println("*****************************************************************");
                	System.out.println();
                	
                	}
                }
                else { 
                	block(); 
                	} 
             }
        });
        
		}
		public void action() {
			System.out.println("hello");
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