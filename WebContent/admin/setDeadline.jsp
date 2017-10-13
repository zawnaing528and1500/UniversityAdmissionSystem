<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set Deadline</title>

 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
 <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>
<div class="" id="email">
            <div class="margin">
				<div class="box">
					 <form action="processSetDeadline.jsp" method="POST">
					 <p>Please Set Deadline for Application Form</p>
					<input type="text" id="datepicker" placeholder="please enter date" required>
					<input type="number" name="hour" placeholder="please enter hour" min= 1 max = 24 required>
					<input type="number" name="minute" placeholder="please enter minute" min= 1 max = 60 required>
					<input type="number" name="second" placeholder="please enter second" min= 1 max = 60 required>
					
					<input type="submit" value="SET DEADLINE" class="sendButton">
					</form>
				
				</div>
            </div>
         </div>	  
</body>
</html>