package allAgent;
//import jade.domain.DFService;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.WakerBehaviour;
import jade.lang.acl.ACLMessage;
public class Receiver extends Agent {
	ACLMessage msg;
	String title;
		@SuppressWarnings("serial")
		public void setup() {
		// Printout a welcome message
		System.out.println("I was so so happy because this is the first jade program I have got. Everybody on the world may got peace!!!!.This is agent2");
		
		addBehaviour(new CyclicBehaviour(this) 
        {
             public void action() 
             {
                ACLMessage msg= receive();
                if (msg != null)
                {
                	 title = msg.getContent(); 
                    System.out.println(title);  
                    
                    ACLMessage reply = new ACLMessage( ACLMessage.INFORM );
                    reply.addReceiver( msg.getSender() );
                    reply.setContent("Yes This is my reply"); 
                    send(reply);
                    
                }
               else { 
                   block(); 
                    } 
             }
        });
		
		addBehaviour(new WakerBehaviour(this, 3000) { 
			protected void handleElapsedTimeout() { 
			System.out.println("This is waker behaviour!!");
			} 
			} );
		}
	
		public void action() {
			System.out.println("hello");
		}
}