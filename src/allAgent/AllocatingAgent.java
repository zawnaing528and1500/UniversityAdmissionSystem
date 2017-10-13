package allAgent;
//import jade.domain.DFService;
import java.sql.SQLException;

import com.DB.DBTest;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import distribute.SyncUniversityDetail;

import com.DB.*;
public class AllocatingAgent extends Agent {
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
	                	System.out.println("Allocating-agent receives the following message from main-agent");
	                	System.out.println();
	                	System.out.println("-----------------------------------------------------------------");
	                	System.out.println();
		            	System.out.println(msg);
		            	System.out.println();
		            	System.out.println("-----------------------------------------------------------------");
		            	System.out.println();
		            	
	                	System.out.println("Allocating-agent is allocating universities now.");
	                	AllocateUniversities a = new AllocateUniversities();
	                	a.allocate();
	                	System.out.println();
	                	System.out.println("allocating universities have successfully finished.");
	                	System.out.println();
	                	System.out.println("*****************************************************************");
	                	System.out.println();
	                
	                    
	                    DBTest d = new DBTest();
	                    d.getConnection();
	                    d.deleteApplyList();
	                    
	                    msg = new ACLMessage(ACLMessage.INFORM);	
						msg.setLanguage(null);
						msg.setOntology(null);
						msg.clearAllReceiver();
						msg.addReceiver(new AID("mainAgent",AID.ISLOCALNAME));
						msg.setContent("Main-agent needs to send emails to students");
						send(msg); 
	                    
	                	SendEmail s = new SendEmail();
	                    s.sendEmailToAdmissibleStudent();
	                }
	                else { 
	                	block(); 
	                	} 
	             }
	        });
			
			/*
			addBehaviour(new CyclicBehaviour(this) 
	        {
	             public void action() 
	             {
	            	 msg = new ACLMessage(ACLMessage.INFORM);	
						msg.setLanguage(null);
						msg.setOntology(null);
						msg.clearAllReceiver();
						msg.addReceiver(new AID("mainAgent",AID.ISLOCALNAME));
						msg.setContent("Main-agent needs to send emails to students");
						send(msg); 
	             }
	        });
	        */
		}
	
		public void action() {
			System.out.println("hello");
		}
}