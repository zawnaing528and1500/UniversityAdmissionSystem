<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css">
<script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery.autocomplete.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/currency-autocomplete.js"></script>
<title>Member Post Ads</title>
</head>
<body>
	<form class=".form-basic" action="newPost.jsp" method="POST">
					<input type='file' onchange="readURL(this);" name="uploadImage" accept="image/gif, image/jpeg, image/png"/>
					<img id="blah" src="#" alt=" "/><br>
					<input type="text" name="title" placeholder="Enter title" required><br>
					
					<font class="bodyText" color="#8FBC8F">Ads Type</font>
					<table>
				        <tr>
				        <td>
				         <INPUT TYPE="radio" NAME="type" VALUE="selling" onclick="document.getElementById('price').disabled = false;document.getElementById('freeShipping').hidden = false;document.getElementById('price').hidden = false; document.getElementById('count').hidden = false;document.getElementById('count').disabled = false;  " required>
				             Selling
				        </td>
				        <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="renting" onclick="document.getElementById('price').disabled = false;document.getElementById('freeShipping').hidden = true;document.getElementById('price').hidden = false; document.getElementById('count').hidden = false;document.getElementById('freeShipping').disabled = true;  " required>
				             Renting
				        </td>
				        <td>
				            <INPUT TYPE="radio" NAME="type" VALUE="advertising" onclick="document.getElementById('price').disabled = true;document.getElementById('price').hidden = true; document.getElementById('count').disabled = true;document.getElementById('count').hidden = true; document.getElementById('freeShipping').disabled = true; document.getElementById('freeShipping').hidden = true;" required>
				            Advertising
				        </td>
				         </tr>
			         </table>
			         
			         <br>
			         
			         <font class="bodyText" color="#8FBC8F">Choose category</font>
			         <select name="category" title="Please select category" id="check" required>
							<option value="" >Select</option>
							<option value="camera" >camera</option>
							<option value="furniture" >furniture</option>
						    <option value="mobile" >Mobile Phone</option>
						     <option value="tablet" >Tablets</option>
			     		    <option value="electronic" >Electronics</option>
							<option value="vehicles" >Vehicles</option>
							<option value="camera" >Cameras</option>
							<option value="fashion" >Fashion & Beauty</option>
							<option value="clothing" >Clothing,Shoes & Accessories</option>
							<option value="hobby" >Hobby & Sports </option>
							<option value="house" >House</option>
							<option value="jobs" >Jobs & Service </option>
							<option value="medicine" >medicine </option>
							<option value="sport" >sport </option>
							<option value="pet" >pet </option>
							<option value="computer" >Computer & Accessories </option>
						</select>
						<input type="number" min="100" name="price" id="price" placeholder="Enter price in Kyats" required>
						<input type="number" min="1" name="productCount" placeholder="Enter product count" id="count" required>
						<div id="freeShipping">
						<font class="bodyText" color="#8FBC8F">Free shipping</font>
							<select name="freeShipping"  required>
							<option>yes</option>
							<option>no</option>
							</select>
						</div>
						<input type="number" min="1" name="duration" placeholder="Duration in month" required alt="twelve month is allowed">
						<input type="textarea" name="description" placeholder="Description" required row="30">
						<input type="text" name="currency" placeholder="Location" class="biginput" id="autocomplete" required>
						<input type="number" min="1" name="account" placeholder="Enter master card account" class="biginput" id="autocomplete" required>
							
						
					<input type="submit" value="POST" id="input-submit">
	</form>

			
<script type="text/javascript">
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(200)
                    .height(200);
            };
			
            reader.readAsDataURL(input.files[0]);
            
        }
    }
</script>
</body>
</html>