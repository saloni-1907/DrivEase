<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@page import="com.drivease.model.Driver"%>
    <%@page import="com.drivease.model.User"%>
    <!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources//userdrivease/resources/homex/agent-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:33 GMT -->
<head>
<!-- Required meta tags -->
<%@include file="head.jsp"%>
<title>DrivEase</title>
</head>
<body>

	<!--Page Loader
============================================================= -->
<!-- <div class="page-loader position-fixed z-index-9999 w-100 bg-white vh-100">
	<div class="d-flex justify-content-center y-middle position-relative">
	  <div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
	  </div>
	</div>
</div>
 -->
<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("error");
		}
	%>

 <%@include file="userheader.jsp" %>
       
<div id="page-wrapper">
    <div class="row"> 
        
        <!--	Agents Details
		==================================================================-->
        <div class="full-row">
            <div class="container">
            <div class="row">
				<div class="col-lg-12">
					<h3 class="text-secondary double-down-line text-center">Your Driver Profile
						</h3>
				</div>
			</div>
			
                <div class="row">
                    <div class="col-lg-12">
                        <div class="profile-details bg-white shadow-one mb-4">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="h-100"> <img src="/userdrivease/resources/images/profilePicture/${driverUser.profilePicture}" alt=""> </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="profile-data py-4 pr-4 text-ordinary hover-primary position-relative">
                                        <h5 class="text-primary hover-text-secondary"><a href="#">${driverUser.fname} ${driverUser.lname}</a></h5>
                                        <div class="bio-data text-secondary">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                         <th>Date Of Birth :</th>
                                                        <td>${driverUser.dob}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Gender :</th>
                                                        <td>${driverUser.gender}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Address :</th>
                                                        <td>${driverUser.address}, ${driverUser.areaName}, ${driverUser.cityName}, ${driverUser.stateName}</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <th>Email Id :</th>
                                                        <td>${driverUser.emailId} </td>
                                                    </tr>
                                                    <tr>
                                                    	<th>Mobile Number:</th>
                                                    	<td>${driverUser.mobileNo}</td>
                                                    </tr>
                                                    <tr>
                                                    	<th>License Number:</th>
                                                    	<td>${driver.licenseNo}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Rent :</th>
                                                        <td>Rs.${driver.hourlyRent} per hour &  Rs. ${driver.dailyRent} per day</td>
                                                    </tr>
                                                     <tr>
                                                        <th>Preferable Vehicle Type :</th>
                                                        <td>${driver.vehicleTypeName}</td>
                                                    </tr>
                                                   
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="py-3">
                                        <a href="/userdrivease/user/editProfile"><button class="btn btn-primary mt-8" style="width: 30%;">Edit Personal Details</button></a>
                                        <a href="/userdrivease/driver/editDetails"><button class="btn btn-primary mt-8" style="width: 30%;">Edit Driver Details</button></a>
                                        <a href="/userdrivease/driver/deactivateAccount"><button class="btn btn-primary mt-8" style="width: 30%;">Deactivate Account</button></a>
                                        
                                            <div class="float-left"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
            </div>
        </div>
        
        
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
    </div>
</div>
<%@include file="userfooter.jsp" %>
<!-- Wrapper End --> 

<!--	Js Link
============================================================--> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/jquery.min.js"></script> 
<!--jQuery Layer Slider --> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/greensock.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/layerslider.transitions.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/layerslider.kreaturamedia.jquery.js"></script> 
<!--jQuery Layer Slider --> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/popper.min.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/bootstrap.min.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/owl.carousel.min.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/tmpl.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/jquery.dependClass-0.1.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/draggable-0.1.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/jquery.slider.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/wow.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/YouTubePopUp.jquery.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/validate.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/jquery.cookie.js"></script> 
<script src="/userdrivease/resources//userdrivease/resources/homex/js/custom.js"></script>
</body>

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources//userdrivease/resources/homex/agent-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:33 GMT -->
</html>