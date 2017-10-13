<%@page import="allocate.*" %>
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
		                <li class="hvr-shadow-radial"><a href="allocatedUniversity.jsp">Universities</a>
                     	<ul>
                     		<li class="hvr-shadow-radial"><a href="getTechnologicalUniversity.jsp">Technology</a></li>
                     		<li class="hvr-shadow-radial"><a href="getMedicalUniversity.jsp">Medical</a></li>
                     		<li class="hvr-shadow-radial"><a href="getComputerUniversity.jsp">Computer</a></li>
                     		<li class="hvr-shadow-radial"><a href="getEducationUniversity.jsp">Education</a></li>
                     		<li class="hvr-shadow-radial"><a href="getEconomicUniversity.jsp">Economic</a></li>
                     		<li class="hvr-shadow-radial"><a href="getLiberalUniversity.jsp">Liberal Arts and Science</a></li>
                     		<li class="hvr-shadow-radial"><a href="getLanguageUniversity.jsp">Foreign Language</a></li>
                     	</ul>
                     </li>
		              <li class="hvr-shadow-radial"><a href="">Manage</a>
		              		<ul>
		                     <li class="hvr-shadow-radial"><a  href="#allAds" id="allAdsClick">Manage University</a></li>
		                     <li class="hvr-shadow-radial"><a href="searchStudent.jsp" id="contactClick">Manage Student</a></li>
                      		</ul>
                      </li>
                     <!--  <li class="hvr-shadow-radial"><a href="http://localhost:8080/UniversityAdmissionSystem/report/reportOnAllocatedStudentList.jsp" id="contactClick">Admissible Students</a></li>  
                     <li class="hvr-shadow-radial"><a href="rejectedStudent.jsp">Rejected Students</a></li> -->
                     <li class=""><a href="setDeadline.jsp" ><font color="orange">Set Deadline</font></a></li>
                     <li class=""><a href="logout.jsp" id="contactClick"><font color="orange">Log Out</font></a></li>
                     
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
		
		 <br>
		 <br>
		 
	
		 
		 <!-- RULE AND HELP BLOCK -->      
         <div class="line" id="help">
		 <div class="box">
		  <p class="s-4 m-6 l-12">
							<b><font color="violet">The following is the important information every applicant should know.</font></b>
							<ol type="1">
								<li>This website was started in 12th December 2016.</li>
								<li>Students can apply university within 4 months.</li>
								<li>The deadline for applying university is 4th April 2017.</li>
								<li>This is the website where the student can see universities' details. The website displays the information that is extracted from other universities' website.</li>
								<li>Only the students who have been registered are allowed to apply universities.</li>
								<li>After deadline is over, students are no longer allowed to apply universities. </li>
								<li>After deadline is reached, the UAS(University  Admission System) will start to allocate.</li>
								<li>Once the UAS has been allocated, UAS will send email to students according to the university they apply, saying "the university you need to attend is... ". </li>
								<li>For the students who are in the rejected track, the UAS will send email to those students.</li>
							</ol>
			</p>
		 </div>
		 <a href="#top"><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/back.png" class="shake-hard" align="right"></a>
		 </div>
		 <br>
		 <br>
		 <br>

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
				<font align="center">Copyright (c) 2017 InnoStarMyanmar.</font>
              </div>
         </div>
      </footer>
	  
	  
      <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/owl-carousel/owl.carousel.js"></script>  
      <script type="text/javascript">
      
      $(window).unload(function(){alert("Good Buy");});
      
         jQuery(document).ready(function($) {	
        	 
        	$(".loader").fadeOut("fast");
			$("#myCart").hide();
			$("#help").hide();
			$("#apply").hide();


			$("#allAdsClick").click(function(){
			$("#allAds").show();
			$("#help").hide();
			$("#contact").show();
			$("#apply").hide();
			});
			
			$("#applyClick").click(function(){
				$("#apply").show();
				$("#allAds").show();
				$("#help").hide();
				$("#contact").hide();
				});
		
			
			$("#contactClick").click(function(){
			$("#contact").show();
			$("#help").hide();
			$("#allAds").show();
			$("#apply").hide();
			});

			
			
			$("#helpClick").click(function(){
			$("#myCart").hide();
			$("#help").show();
			$("#allAds").hide();
			$("#apply").hide();
			$("#contact").hide();
			});

			
			$("#close").click(function(){
			$("#gettingStart").show();
			$("#apply").hide();
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