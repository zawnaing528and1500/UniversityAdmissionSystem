<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Send email</title>
    
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/buttons.css">
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-ui.min.js"></script>    
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/responsee.js"></script>
      <script src='http://localhost:8080/UniversityAdmissionSystem/external/js/buttons.js'></script>
      <style type="text/css">
      #contactButton{font-family:"Monotype Corsiva";background-color:rbg(62,173,154);}
      </style>
    </head>
    <body>
				
				<br><br><br><br><br>

			<%String email=session.getAttribute("email").toString(); %>
			<div class="box">
			<center>Create your new password</center>
			<form class=".form-basic" action="updatePassword.jsp" method="POST">
					<div class="">
					<input type="password" id="txtPassword" placeholder="New Password" name="password" required><span id="password_strength"></span>
					<input type="password" id="txtConfirmPassword" placeholder="Confirm Password" name="confirm" required><span id="compare"></span>
					</div> 
					<input type="submit" value="CHANGE" id="input-submit">
			</form>
			</div>
	
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
          <script type="text/javascript">
          $(function () {
              $("#txtPassword").bind("keyup", function () {
                  //TextBox left blank.
                  if ($(this).val().length == 0) {
                      $("#password_strength").html("");
                      return;
                  }
       
                  //Regular Expressions.
                  var regex = new Array();
                  regex.push("[A-Z]"); //Uppercase Alphabet.
                  regex.push("[a-z]"); //Lowercase Alphabet.
                  regex.push("[0-9]"); //Digit.
                  regex.push("[$@$!%*#?&]"); //Special Character.
       
                  var passed = 0;
       
                  //Validate for each Regular Expression.
                  for (var i = 0; i < regex.length; i++) {
                      if (new RegExp(regex[i]).test($(this).val())) {
                          passed++;
                      }
                  }
       
       
                  //Validate for length of Password.
                  if (passed > 2 && $(this).val().length > 8) {
                      passed++;
                  }
       
                  //Display status.
                  var color = "";
                  var strength = "";
                  switch (passed) {
                      case 0:
                      case 1:
                          strength = "Weak";
                          color = "red";
                          break;
                      case 2:
                          strength = "Good";
                          color = "darkorange";
                          break;
                      case 3:
                      case 4:
                          strength = "Strong";
                          color = "green";
                          break;
                      case 5:
                          strength = "Very Strong";
                          color = "darkgreen";
                          break;
                  }
                  $("#password_strength").html(strength);
                  $("#password_strength").css("color", color);
              });
          });
          
          
           //confrim password
          
          $(function () {
        	  $("#txtConfirmPassword").bind("keyup", function () {
        	 var compare = "";
        	 var color = "";
            var password = $("#txtPassword").val();
            var confirmPassword = $("#txtConfirmPassword").val();
            if (password != confirmPassword) {
                compare = "Password do not match!!";
                color = "red";
                $("#compare").html(compare)
                $("#compare").css("color",color)
                return false;
            }
            else {
                compare = "Password match!!";
                color = "green";
                $("#compare").html(compare)
                $("#compare").css("color",color)
                return false;
            }
            
            
            return true;
        });
    });
         
          
          //phone number validate
          
           $(function () {
        	   $("#phoneNumber").bind("keyup", function () {       		    		 
        
        		   
        	  var phoneno = /^[0,9]{2}\d[0-9]{7,9}$/;
        	  var compare = "";
        	 var color = "";
            var ph = $("#phoneNumber").val();
            if (ph.match(phoneno)) {
            	
            	compare = "Valid PhoneNumber!!";
                color = "green";
                $("#Phone_Number").html(compare)
                $("#Phone_Number").css("color",color)
                return false;
                            }
            else
            	{
            	compare = "Invalid PhoneNumber!!";
                color = "red";
                $("#Phone_Number").html(compare)
                $("#Phone_Number").css("color",color)
                return false;

            
            	}
            return true;
        });
    });
          
          
	
		</script>  
		
	
</body>
</html>