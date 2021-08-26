<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp" %>
</head>
<body>
	<div id="page-wrapper">
    	<div class="row">
    
    	<div class="col-lg-25" >
    		<img class="nav-logo" src="/userdrivease/resources/homex/images/logo/logo-01.png" alt="" height="300" width="350" style="text-align:center;display:block;margin-left:320px;"></a>
   		</div>
  
<!--	Page Loader
=============================================================-->
<div class="page-loader position-fixed z-index-9999 w-100 bg-white vh-100">
	<div class="d-flex justify-content-center y-middle position-relative">
	  <div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
	  </div>
	</div>
</div>

        
        <!--	Banner
		===============================================================-->
        <div class="full-row">
            <div class="container">
            <div class="row">
				<div class="col-lg-12">
					<h3 class="text-secondary double-down-line text-center">Login</h3>
				</div>
			</div>
			
                <div class="row">
                    <div class="col-md-7">
                        <div class="mb-5">
                            <h1 class="mb-4 text-secondary">Welcome To DrivEase</h1>
                            <p></p>
                        </div>
                        <div class="login-condition flat-small flat-primary">
                           
                            <div class="row">
                                <div class="col-md-8 col-xl-6">
                                    <ul>
                                        <li><i class="flaticon-checked text-primary"></i>Choose from amongst a wide range of vehicles.</li>
                                        <li><i class="flaticon-checked text-primary"></i>Get yourself some extra earning by lending your vehicles.</li>
                                        <li><i class="flaticon-checked text-primary"></i>Come,let's go driving! Register yourself as a driver now. </li>
                                    </ul>
                                </div>
                            </div>
                            <h2>Enjoy the journey!!</h2>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="mt-sm-50"> <a href="login.html" class="down-active text-secondary mr-3">Login</a>
                            </li>
                          
                            <form method="post" action="/userdrivease/user/loggingIn" name="loginform" modelAttribute="log" class="mt-5 icon-form" onsubmit="return validateForm()">
                                <div class="form-group user">
                              <label for="exampleInputEmail1">Email Id</label>
                                    <input id="emailId" type="email" name="emailId" id="emailId" path="emailId" class="form-control bg-gray" placeholder="Email Id">
                                    <span id="email-error" style="color:red"></span>
                                </div>
                                <div class="form-group password">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input id="exampleInputPassword1" type="password" id="password" name="password" path="password" class="form-control bg-gray" placeholder="Password">
                               		 <span id="password-error" style="color:red"></span>
                                </div>
                                <%if(request.getParameter("errorMsg") != null){ %>
                                <div style="color: red;margin-left:70px"><%= request.getParameter("errorMsg") %></div>
                                <%} %>
                               
                                <button type="submit" class="btn btn-primary mt-3">Login</button>
                                <a  class="text-secondary hover-text-primary d-block mt-4" href="/userdrivease/user/forgotPassword">Forgot Password </a>
								<a  class="text-secondary hover-text-primary d-block mt-4" href="/userdrivease/user/registrationPage">Don't have an account? Register</a>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="full-row bg-gray p-0">
            <div class="container">
                <div  class="row">
                    <div class="col-lg-12">
                        
                    </div>
                </div>
            </div>
        </div>                                        
       </div>
</div>
    	<%@include file="userfooter.jsp" %>
    	
    	
    	<!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
    	
    	
   <%@include file="script.jsp" %> 
</body>
<script>
    	function validateForm()
  		{
  	  		var submit=true;
  	  		var emailId=document.loginform.emailId.value;
  	  	  	var password=document.loginform.password.value;
  	  	  	

  	  		if(emailId==""||emailId==null)
  	  	  	{
  	  			document.getElementById("email-error").innerHTML="*Email Required!";
	  	  	  	submit=false;	
  	  	  	}
  	  		 if(password==""||password==null)
	  	  	{
	  			document.getElementById("password-error").innerHTML="*Password Required!";
  	  	  		submit=false;	
	  	  	}
 	  	  	return submit;
  		}
    	
    	</script>
</html>