<%@page import="allocate.*" %>
<%@page import="com.DB.*" %>
<%@page import="allocateUniversity.*" %>
<%@ page import="java.io.*,java.util.*" %>

<!DOCTYPE html>
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	  <link href="http://localhost:8080/UniversityAdmissionSystem/external/css/hover.css" rel="stylesheet" media="all">
	  <link rel="stylesheet" type="text/css" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/csshake.min.css">
	  <link rel="stylesheet" type="text/css" href="http://localhost:8080/UniversityAdmissionSystem/external/css/style.css">
      <title>University Admission System</title>
	  <link href="http://localhost:8080/UniversityAdmissionSystem/external/css/animate.css" rel="stylesheet" />
	  <link href="http://localhost:8080/UniversityAdmissionSystem/external/css/animate.min.css" rel="stylesheet" />	  
	  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/owl-carousel/owl.theme.css">
	  <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/normalize.css">
	  <link href="http://localhost:8080/UniversityAdmissionSystem/external/css/hover.css" rel="stylesheet" media="all">
      <link href='external/http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-ui.min.js"></script>    
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/modernizr.js"></script>
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/responsee.js"></script>
	  <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/plus.js"></script>
	  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/prefixfree.min.js"></script>
	  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/login.js"></script>
	  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/register.js"></script>
	  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/tab.js"></script>
	  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/tab1.js"></script>
	  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/wow.min.js"></script>
	  <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
  
              <script>
                 wow = new WOW(
                      {
                      boxClass:     'wow',      // default
                      animateClass: 'animated', // default
                      offset:       0,          // default
                      mobile:       true,       // default
                      live:         true        // default
                    }
                    )
                    wow.init();
              </script>
	  
	   	<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.9.1.min.js"></script>
  		<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery.autocomplete.min.js"></script>
 		<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/currency-autocomplete.js"></script>
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
		<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/buttons/buttons.css">
   </head>
   
   
   <body class="size-1140"> 
   <div class="loader"></div>
	  
	   <!-- HEADER -->
	  <header>
         <div class="line">
            <div class="box">
               <div class="s-6 l-2">
					<div class="up">
					<img src="http://localhost:8080/UniversityAdmissionSystem/external/img/logo1.png">	
					</div>
               </div>
            </div>
         </div>
		 
         <!-- TOP NAV -->  
         <div class="line">
            <nav class="margin-bottom">
               <p class="nav-text">University Admission System</p>
			 <div style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInDown;" class="row small center wow fadeInDown top__element" data-wow-delay="0.5s">  
               <div class="top-nav s-12 l-10" id="top">
                  <ul>
                     <li class="shake-slow"><a href="#home">Home</a></li>
                     <li class="shake-slow">
                        <a  href="#allAds" id="allAdsClick">All Universities</a>
                     </li>
					 <li class="shake-slow"><a href="#gettingStart" id="gettingStartClick">Getting Start</a></li>
                     <li class="shake-slow">
                        <a href="#help" id="helpClick">About</a>
                     </li class="shake-slow">
                     <li class="shake-slow"><a href="#contact" id="contactClick">Contact</a></li>
                  </ul> 
                  </div>
			  </div> 
            </nav>
         </div>
      </header>

	  <section>
         <!-- HOME BLOCK -->  
         <div class="line" id="home">
         <div class="report">
		 <jsp:include page="wowslider.jsp" flush="true" />
		 </div>
		 </div>
		 

        <br>
		<br>
		<br>	
		
		<!-- ALL ADS BLOCK -->  
        <div class="line" id="allAds">
 			<jsp:include page="searchUniversity.jsp" flush="true" />
		</div>
		
		
		<!-- ADD TO CART BLOCK -->	 
         <div class="line" id="myCart">
            <div class="margin">
				//include file here
            </div>
         </div>	
         	 
		 
		<!-- GETTING START LOGIN BLOCK -->	 
		<div class="line" id="gettingStart">
			<div class="box" align="center">
				<form class="login" action="login.jsp" method="POST">
					<font color="white" class="bodyText">Log in</font>
					<input type="text" placeholder="Email" name="username" autofocus required/>
					<i class="fa fa-user"></i>
					<input type="password" placeholder="Password" name="password" required/>
					<i class="fa fa-key"></i>
					<a href="#register" id="newUser"><font color="lightyellow">New Applicant?</font></a>	
					<a href="forgot.jsp" id="forgotPw"><font color="lightyellow">Forgot Password?</font></a>		
					<button>
					<i class="spinner"></i>
					<span class="state">Log in</span>
					</button>
				</form>
				
			<a href="#top"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/back.png" class="shake-hard" align="right"></a>
			</div>
		</div>
	
	
	
	
		<!-- REGISTER BLOCK -->	 
         <div class="line" id="register">
            <div class="margin">
				<div class="box">
				<jsp:include page="newRegisterationForm.jsp" flush="true" />
				 <a href="#top"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/back.png" class="shake-hard" align="right"></a>
				</div>
            </div>
         </div>	     
		 
		 <br>
		 <br>
	
		 
		 <!-- RULE AND HELP BLOCK -->      
         <div class="line" id="help">
		 <div class="box">
		 <br>
		 <br>
		  <p class="s-4 m-6 l-12">
							<b><font color="violet">The following is the important information every applicant should know.</font></b>
							<ol type="1">
								<li>This website was started in 12th December 2016.</li>
								<li>Students can apply university within 4 months.</li>
								<li>The deadline for applying university is 4th April 2017.</li>
								<li>This is the website where the student can see universities' details. The website displays the information from other universities' website.</li>
								<li>Only the students who have been registered are allowed to apply universities.</li>
								<li>After deadline is reached, students are no longer allowed to apply universities.</li>
								<li>After deadline is reached, the University  Admission System (UAS) will start to allocate.</li>
								<li>Once the UAS has been allocated, UAS will send email to students according to the university they apply.</li>
								<li>For the students who are in the rejected track, the UAS will send email to those students.</li>
							</ol>
			</p>
		 </div>
		 <a href="#top"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/back.png" class="shake-hard" align="right"></a>
		 </div>
		 <br>
		 <br>
		 <br>
		 
		
		
		 <!-- CONTACT BLOCK -->      
         <div class="line" id="contact">
  			 <jsp:include page="contactForm.jsp" flush="true" />
  			  <a href="#top"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/back.png" class="shake-hard" align="right"></a>
         </div>

		</section>
		 
      <!-- FOOTER -->
	
      <footer class="line">
         <div class="box">
            <div class="s-12 l-6">
			<div class="hvr-wobble-vertical">
			    <ul class="share-buttons">
					<li><a href="https://www.facebook.com/sharer/sharer.php?u=http%3A//localhost%3A8080/UniversityAdmissionSystem/index/index.jsp"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/facebook.png"/></a>	</li>
				    <li><a href="https://twitter.com/home?status=http%3A//localhost%3A8080/UniversityAdmissionSystem/index/index.jsp"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/twitter.png"/></a>	</li>
					<li><a href="https://plus.google.com/share?url=http%3A//localhost%3A8080/UniversityAdmissionSystem/index/index.jsp"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/Google+.png"/></a>	</li>
					<li><a href="https://www.linkedin.com/shareArticle?mini=true&url=http%3A//localhost%3A8080/UniversityAdmissionSystem/index/index.jsp&title=UniversityAdmissionSystem&summary=The%20best%20website%20for%20you&source="><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/linkIn.png"/></a>	</li>
					<li><a href="https://pinterest.com/pin/create/button/?url=http%3A//localhost%3A8080/UniversityAdmissionSystem/img/s2.jpg&media=http%3A//localhost%3A8080/UniversityAdmissionSystem/index/index.jsp&description="><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/pinterest.png"/></a>	</li>
				</ul>
					<center>Copyright (c) 2017 InnoStarMyanmar.</center>
              </div>
         </div>
      </footer>
	  
	  
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/owl-carousel/owl.carousel.js"></script>  
      <script type="text/javascript">
      
      $(window).unload(function(){alert("Good Buy");});
      
         jQuery(document).ready(function($) {	
        	 
        	
			
        	$(".loader").fadeOut("slow");
			$("#myCart").hide();
			$("#register").hide();
			$("#gettingStart").hide();
			$("#help").hide();


			
			$("#allAdsClick").click(function(){
			$("#allAds").show();
			$("#myCart").hide();
			$("#register").hide();
			$("#gettingStart").hide();
			$("#help").hide();
	
			$("#contact").show();
			});
		
			$("#contactClick").click(function(){
			$("#myCart").hide();
			$("#contact").show();
			$("#register").hide();
			$("#gettingStart").hide();
			$("#help").hide();
			$("#allAds").show();
		
			});
			
			
			$("#myCartClick").click(function(){
			$("#myCart").show();
			$("#register").hide();
			$("#gettingStart").hide();
			$("#help").hide();
			$("#allAds").hide();
			
			$("#contact").hide();
			
			});
			
			
			$("#helpClick").click(function(){
			$("#myCart").hide();
			$("#register").hide();
			$("#gettingStart").hide();
			$("#help").show();
			$("#allAds").hide();
			
			$("#contact").hide();
			});
				
			
			$("#gettingStartClick").click(function(){
			$("#myCart").hide();
			$("#register").hide();
			$("#gettingStart").show();
			$("#help").hide();
			$("#allAds").hide();
		
			$("#contact").hide();
			});
			
			
				
			$("#newUser").click(function(){
			$("#myCart").hide();
			$("#register").fadeIn(3000);
			$("#register").show();
			$("#gettingStart").hide();
			$("#help").hide();
			$("#allAds").hide();
		
			$("#contact").hide();
			});	

			
			$("#start").click(function(){
			$("#gettingStart").fadeIn(3000);
			$("#gettingStart").show();
			
			});
			
			$("#close").click(function(){
			$("#gettingStart").show();
			});

			
			$("#input-submit").click(function(){
			
			$("#gettingStart").hide();
				});
			
		   
		    $(".up").hover(function(){
			$(".up").slideUp(2000).slideDown(2000);
			});
			
			
				$('a[href^="#"]').on('click', function(event) {
				var target = $(this.getAttribute('href'));
				if( target.length ) {
					event.preventDefault();
					$('html, body').stop().animate({
						scrollTop: target.offset().top
					}, 1000);
				}
			   });
		   
         });	 
		 
      </script>
   </body>
</html>