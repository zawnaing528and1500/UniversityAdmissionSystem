package test3;
import java.sql.SQLException;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import distribute.SyncUniversityDetail;
public class InformationAgent extends Agent {
	ACLMessage msg;
	String title;
		@SuppressWarnings("serial")
		public void setup() {
		
			addBehaviour(new CyclicBehaviour(this) 
	        {
	             public void action() 
	             {
	            	 ACLMessage msg= receive();
	                if (msg != null)
	                {
	                	String body = msg.getContent();
	                	if(body.equals("Information-agent needs to update university information"))
	                	{
	         
	                	System.out.println("Information-agent receives the following message from main-agent");
	                	System.out.println();
	                	System.out.println("-----------------------------------------------------------------");
	                	System.out.println();
		            	System.out.println(msg);
		            	System.out.println();
		            	System.out.println("-----------------------------------------------------------------");
		            	System.out.println();
	                	System.out.println("Information-agent is updating universities' information.");
	                	
	                	SyncUniversityDetail s = new SyncUniversityDetail();
	                	try {
							s.syncUniversityDetail();
							System.out.println("Universities' information is updated successfully.");
							System.out.println();
							System.out.println("******************************************************");
							System.out.println();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
	                	}
	                }
	                else { 
	                	block(); 
	                	} 
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
	                	if(body.equals("Information-Agent needs to be killed"))
	                	{
	                	try {
							Thread.sleep(150000);
							doDelete();
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
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
}