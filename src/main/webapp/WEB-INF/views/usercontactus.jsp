<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:46 GMT -->
<head>
<!-- Required meta tags -->
<%@include file="head.jsp"%>
<title>Contact Us</title>

</head>
<body>

<!--	Page Loader
=============================================================
<div class="page-loader position-fixed z-index-9999 w-100 bg-white vh-100">
	<div class="d-flex justify-content-center y-middle position-relative">
	  <div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
	  </div>
	</div>
</div>
--> 


<div id="page-wrapper">
		<%@include file="userheader.jsp" %>
    <div class="row"> 	
    	
       <!--=============================================================-->
                <!--	Banner
		===============================================================-->
     
            <div class="container">
                <div class="row">
                   <center> <h3 class="text-secondary double-down-line text-center" style="margin-left:420px;margin-top:30px;">Contact Us</h3></center>
                </div>
            </div>
       
        
        <!--	Contact Information
===============================================================-->
        <div class="full-row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="contact-info">
                            <h3 class="mb-4 text-secondary">Support</h3>
                            <div class="d-flex">
                                <div class="circle mr-4"><img src="/userdrivease/resources/homex/images/team/02.jpg" alt=""></div>
                                <div class="contact-details">
                                    <h5>Bijesh Sheth</h5>
                                    <span class="d-block">Support Member</span> <a class="text-primary" href="#">bijesh@gmail.com</a> </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="contact-info">
                            <h3 class="mb-4 text-secondary">Contacts</h3>
                            <ul>
                                <li class="d-flex mb-4"> <i class="fas fa-map-marker-alt text-primary mr-2 font-13 mt-1"></i>
                                    <div class="contact-address">
                                        <h5 class="text-secondary">Address</h5>
                                        <span>Praxware Technologies, Ahmedabad,Indiaa</span> </div>
                                </li>
                                <li class="d-flex mb-4"> <i class="fas fa-phone-alt text-primary mr-2 font-13 mt-1"></i>
                                    <div class="contact-address">
                                        <h5 class="text-secondary">Call Us</h5>
                                        <span class="d-table">+91-9016647480(or)</span> <span>+91-9016647481 </span> </div>
                                </li>
                                <li class="d-flex mb-4"> <i class="fas fa-envelope text-primary mr-2 font-13 mt-1"></i>
                                    <div class="contact-address">
                                        <h5 class="text-secondary">Email Adderss</h5>
                                        <span>info@praxware.com</span> </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-4">
                        <div class="contact-info">
                            <h3 class="mb-5 text-secondary">Social</h3>
                            <div class="text-secondary hover-text-primary"> <a class="mr-4" href="#"><i class="fab fa-facebook-f"></i></a> <a class="mr-4" href="#"><i class="fab fa-twitter"></i></a> <a class="mr-4" href="#"><i class="fab fa-google-plus-g"></i></a> <a class="mr-4" href="#"><i class="fab fa-linkedin-in"></i></a> <a class="mr-4" href="#"><i class="fas fa-rss"></i></a> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!--	Get In Touch
===============================================================-->
        <div class="full-row pt-0">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="text-secondary double-down-line text-center">Get In Touch</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form:form role="form" name="contactform" modelAttribute="feedback" class="w-100" action="/userdrivease/feedback/savefeedback" method="post" onsubmit="return validate()">
                            <div class="row">
                                <div class="col-lg-6">
                                 <div class="form-group">
										<form:input type="hidden" class="form-control bggray" id="feedbackId"   placeholder=""  path="feedbackId" />
            					  </div>
                                    <div class="form-group">
                                        <form:input type="text" id="name" path="name" name="name" class="form-control bg-gray" placeholder="Your Name*" />
                                        <span id="name-error" style="color:red"></span>
                                    </div>
                                    <div class="form-group">
                                        <form:input type="email" id="emailId" path="emailId" name="emailId" class="form-control bg-gray" placeholder="Email Address*"  />
                           		         <span id="email-error" style="color:red"></span>
                                    </div>
                                    
                                    <div class="form-group">
                                        <form:select class="form-control bg-gray" path="subject" id="subject" name="subject">
                                      
                                        	<form:option value="Subject" />Subject
                                        	<form:option value="Appreciation" />Appreciation
                                        	<form:option value="Suggestion" />Suggestion
                                        	<form:option value="Complaint" />Complaint
                                        	<form:option value="Other" />Other
                                        </form:select>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <form:textarea id="message" path="message" name="message"  class="form-control bg-gray" rows="5" placeholder="Type Comments..." />
                                    	<span id="message-error" style="color:red"></span>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                	<center><button type="submit" class="btn btn-primary">Send Message</button></center>
                                </div>
                                <div class="col-lg-12">
                                    <div class="error-handel">
                                        <div class="d-none" id="success">Your email sent Successfully, Thank you.</div>
                                        <div class="d-none" id="error"> Error occurred while sending email. Please try again later.</div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        
        <!--	Map
		===============================================================-->
		
        
        
       
                 
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
      
    </div>
</div>
 <%@include file="userfooter.jsp" %>
<!-- Wrapper End --> 

<!--	Js Link
============================================================--> 
<script src="/userdrivease/resources/homex/js/jquery.min.js"></script> 
<!--jQuery Layer Slider --> 
<script src="/userdrivease/resources/homex/js/greensock.js"></script> 
<script src="/userdrivease/resources/homex/js/layerslider.transitions.js"></script> 
<script src="/userdrivease/resources/homex/js/layerslider.kreaturamedia.jquery.js"></script> 
<!--jQuery Layer Slider --> 
<script src="/userdrivease/resources/homex/js/popper.min.js"></script> 
<script src="/userdrivease/resources/homex/js/bootstrap.min.js"></script> 
<script src="/userdrivease/resources/homex/js/owl.carousel.min.js"></script> 
<script src="/userdrivease/resources/homex/js/tmpl.js"></script> 
<script src="/userdrivease/resources/homex/js/jquery.dependClass-0.1.js"></script> 
<script src="/userdrivease/resources/homex/js/draggable-0.1.js"></script> 
<script src="/userdrivease/resources/homex/js/jquery.slider.js"></script> 
<script src="/userdrivease/resources/homex/js/wow.js"></script> 
<script src="/userdrivease/resources/homex/js/YouTubePopUp.jquery.js"></script> 
<script src="/userdrivease/resources/homex/js/validate.js"></script> 
<script src="/userdrivease/resources/homex/js/jquery.cookie.js"></script> 
<script src="/userdrivease/resources/homex/js/custom.js"></script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPZ-Erd-14Vf2AoPW2Pzlxssf6-2R3PPs"></script> 
<script src="/userdrivease/resources/homex/js/map/markerwithlabel_packed.js"></script> 
<script src="/userdrivease/resources/homex/js/map/infobox.js"></script> 
<script src="/userdrivease/resources/homex/js/map/custom-map.js"></script> 
<script>
(function($){
	var _latitude = 36.596165;
	var _longitude = -97.062988;
	createHomepageGoogleMap(_latitude,_longitude);
})(jQuery);
</script>


</body>
<script>
  		function validate()
  		{
  	  		var submit=true;
  	  		var name=document.contactform.name.value;
  	  	  	var emailId=document.contactform.emailId.value;
  	  	  	var message=document.contactform.message.value;
  	  		
			if(name==""||name==null)
  	  	  	{
  	  			document.getElementById("name-error").innerHTML="Please enter your name.";
  	  		document.contactform.name.focus();
	  	  	  	submit=false;	
  	  	  	}
  	  		 if(emailId==""||emailId==null)
	  	  	{
	  			document.getElementById("email-error").innerHTML="Please enter your email.";
  	  	  		submit=false;	
	  	  	}

			if(message==""||message==null)
			{
				document.getElementById("message-error").innerHTML="This field can not be blank";
				submit=false;
			}
			
			 return submit;
  		}
  		
  		
  	
  </script>

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:46 GMT -->
</html>