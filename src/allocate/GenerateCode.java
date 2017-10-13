package allocate;
import java.util.Collections;
import java.util.ArrayList;
public class GenerateCode {
	public GenerateCode()
	{
		
	}

  public static void main(String[] args) {

  //define ArrayList to hold Integer objects
  ArrayList<Integer> numbers = new ArrayList<Integer>();
  for(int i = 2000; i < 5000; i++)
  {
    numbers.add(i+1);
  }
  Collections.shuffle(numbers);
  System.out.print("This six random numbers are: ");
  for(int j =0; j < 1; j++)
  {
    System.out.print(numbers.get(j) + " ");
  }
}
  
  public int generateRandom()
  {
	  int num = 0;
	  ArrayList<Integer> numbers = new ArrayList<Integer>();
	  for(int i = 2000; i < 5000; i++)
	  {
	    numbers.add(i+1);
	  }
	  Collections.shuffle(numbers);
	 
	  for(int j =0; j < 1; j++)
	  {
	    num = numbers.get(j);
	  } 
	  
	  return num;
  }
} 