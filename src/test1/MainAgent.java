package test1;
//import jade.domain.DFService;
import jade.core.AID;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.TickerBehaviour;
import jade.core.behaviours.WakerBehaviour;
import jade.lang.acl.ACLMessage;
import allAgent.CheckChanges;
import allocate.*;


public class MainAgent extends Agent {
	ACLMessage msg;
	public int deadline = 0;
	
		@SuppressWarnings("serial")
		public void setup() {
			Deadline d = new Deadline();
			deadline = d.getDeadline();
			CheckChanges c = new CheckChanges();
			
		addBehaviour(new CyclicBehaviour(this) { 
			public void action() { 
				
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