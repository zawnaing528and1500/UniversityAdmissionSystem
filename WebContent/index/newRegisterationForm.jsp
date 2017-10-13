<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
 <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>

  </script>
</head>
<body>
	<div class="bodyText"><center>Registration Form</center></div>
	<form class=".form-basic" action="checkNrc.jsp" method="POST">
					<div class="">
					<div class="s-12 m-6 l-4 margin-bottom"><input type="text" id="input-name" placeholder="Name"  name="name" required></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="text" id="input-name" placeholder="NRC"  name="nrc" required></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="text" id="input-name" placeholder="Father Name"  name="fatherName" required></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="text" id="input-name" placeholder="Religion"  name="religion" required></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="text" id="input-name" placeholder="Roll Number"  name="roll" required></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="text" id="input-name" placeholder="Secured Code"  name="code"></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="email" id="input-email" placeholder="Email Address" name="email" required></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="phone" id="phoneNumber" placeholder="Phone Number" name="phone" required><span id="Phone_Number"></span></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="password" id="txtPassword" placeholder="Password" name="password" required><span id="password_strength"></span></div>
					<div class="s-12 m-6 l-4 margin-bottom"><input type="password" id="txtConfirmPassword" placeholder="Confirm Password" name="confirm" required><span id="compare"></span></div>
					</div> 
					<input type="submit" value="Register" id="input-submit">
	</form>
	
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