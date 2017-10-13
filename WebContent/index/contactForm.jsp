<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



 			<div class="box">
			    <center><p class="bodyText">If any feedback you have, please contact us.<br>We will reply you within 24 hours.</p></center>
				 <form class="cf" action="contact.jsp" method="POST">
					<div class="half left cf">
					<input type="text" id="input-name" placeholder="Name" name="contactName" required>
					<input type="email" id="input-email" placeholder="Email address" name="contactEmail" required>
					<input type="text" id="input-subject" placeholder="Subject" name="contactSubject" required>
					</div>
					<div class="half right cf">
					<textarea type="text" id="input-message" placeholder="Message" name="contactMessage" required></textarea>
					</div>  
					<input type="submit" value="Submit" id="input-submit">
				</form>
            </div>
    
</body>
</html>