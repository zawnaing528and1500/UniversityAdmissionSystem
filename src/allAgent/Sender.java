package allAgent;
//import jade.domain.DFService;
import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
public class Sender extends Agent {
	ACLMessage msg;
	String title;
		public void setup() {
		// Printout a welcome message
		System.out.println("I was so so happy because this is the first jade program I have got. Everybody on the world may got peace!!!!");
		msg = new ACLMessage(ACLMessage.INFORM);	
		msg.setLanguage(null);
		msg.setOntology(null);
		msg.clearAllReceiver();
		msg.addReceiver(new AID("agent2",AID.ISLOCALNAME));
		msg.setContent("I have finish Allocating!");
		send(msg);
		
		addBehaviour(new CyclicBehaviour(this) 
        {
             public void action() 
             {
            	 ACLMessage msg= receive();
                if (msg != null)
                {
                	title = msg.getContent();
                    System.out.println(title);
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