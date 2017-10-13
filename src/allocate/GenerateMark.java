package allocate;

import java.util.ArrayList;
import java.util.Collections;

public class GenerateMark {

	public GenerateMark() {
		// TODO Auto-generated constructor stub
	}
	  public int generate6Marks()
	  {
		  int num = 0;
		  ArrayList<Integer> numbers = new ArrayList<Integer>();
		  for(int i = 1; i < 6; i++)
		  {
		    numbers.add(i);
		  }
		  Collections.shuffle(numbers);
		 
		  for(int j =0; j < 1; j++)
		  {
		    num = numbers.get(j);
		  } 
		  
		  return num;
	  }
	  
	  public int generateSubject1Mark()
	  {
		  int num = 0;
		  ArrayList<Integer> numbers = new ArrayList<Integer>();
		  for(int i = 40; i < 50; i++)
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
	  
	  public int generateSubject2Mark()
	  {
		  int num = 0;
		  ArrayList<Integer> numbers = new ArrayList<Integer>();
		  for(int i = 50; i < 56; i++)
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
	  
	  public int generateSubject3Mark()
	  {
		  int num = 0;
		  ArrayList<Integer> numbers = new ArrayList<Integer>();
		  for(int i = 57; i < 74; i++)
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
	  
	  public int generateSubject4Mark()
	  {
		  int num = 0;
		  ArrayList<Integer> numbers = new ArrayList<Integer>();
		  for(int i = 77; i < 80; i++)
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
	  
	  
	  public int generateSubject5Mark()
	  {
		  int num = 0;
		  ArrayList<Integer> numbers = new ArrayList<Integer>();
		  for(int i = 80; i < 94; i++)
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
	  
	  public int generateSubject6Mark()
	  {
		  int num = 0;
		  ArrayList<Integer> numbers = new ArrayList<Integer>();
		  for(int i = 57; i < 66; i++)
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
	  
	  
	  public int generate()
	  {
		  int check = generate6Marks();
		  int mark = 0;
		  if(check == 1)
		  {
			  mark = generateSubject1Mark();
		  }
		  else if(check == 2)
		  {
			  mark = generateSubject2Mark();
		  }
		  else if(check == 3)
		  {
			  mark = generateSubject3Mark();
		  }
		  else if(check == 4)
		  {
			  mark = generateSubject4Mark();
		  }
		  else if(check == 5)
		  {
			  mark = generateSubject5Mark();
		  }
		  else if(check == 6)
		  {
			  mark = generateSubject6Mark();
		  }
		  return mark;
	  }
	  
}
