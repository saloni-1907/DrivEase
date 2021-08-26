<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.drivease.model.Vehicle"%>
    <!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
<head>
<%@include file="head.jsp"%>
<!--	Title
	=========================================================-->
<title>DrivEase</title>
</head>
<body>

<%@include file="userheader.jsp" %>
<div id="page-wrapper">
 <div class="row">
			<div class="col-lg-12">
				<h3 class="text-secondary double-down-line text-center">Requests to hire you as driver</h3>
			</div>
		</div>
		
    <div class="row">
        
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-xl-12">
                        <div class="row">
                            
                                <table class="w-100 items-list bg-transparent">
                                    <thead>
                                        <tr class="bg-white">
                                            <th>User Details</th>
                                            <th>Date-Time</th>
                                            <th>Amount</th>
                                            <th>Current Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="dl" items="${driverList}">
                                       
                                        
                                        <tr>
                                            <td>${dl.userName} <br> ${dl.userEmail} <br> ${dl.userMobile} </td>
                                            <td>From: <c:out value="${dl.startingDate}" /><br/>Till: ${dl.endingDate} </td>
                                            <td>Rs. <c:out value="${dl.finalAmount}" /> </td>
                                            <td><c:out value="${dl.status}" /></td>
                                             
                                             <c:if test = "${dl.status == 'Requested'}">
											<td><a href="/userdrivease/booking/bookingStatus/${dl.bookingId}/Accepted/Driver" class="btn btn-sm bg-success-light">
												<i class="fas fa-check"></i> Accept
											</a></td>
											<td><a href="/userdrivease/booking/bookingStatus/${dl.bookingId}/Declined/Driver" class="btn btn-sm bg-danger-light">
												<i class="fas fa-times"></i> Decline
											</a></td>
										</c:if>
										<c:if test = "${dl.status == 'Declined'}">
											
											<td><button disabled="disabled" href="/userdrivease/booking/bookingStatus/${dl.bookingId}/Decline/Driver" class="btn btn-sm bg-danger-light">
												<i class="fas fa-times"></i> Declined
											</button></td>
										</c:if>
										<c:if test = "${dl.status == 'Accepted'}">
											<td><button disabled="disabled" href="/userdrivease/booking/bookingStatus/${dl.bookingId}/Accept/Driver" class="btn btn-sm bg-success-light">
												<i class="fas fa-check"></i> Accepted
											</button></td>
											
										</c:if>
                                        </tr>
                                        </c:forEach>
                                            </tbody>
                                            
                                </table>
								
                
                         
                            </div>
                            <div class="dashboard-copyright bg-white py-4 text-center w-100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="userfooter.jsp" %>
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
   
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
<script src="/userdrivease/resources/homex/js/chart.min.js"></script> 
<script src="/userdrivease/resources/homex/js/wow.js"></script> 
<script src="/userdrivease/resources/homex/js/YouTubePopUchart.min.html"></script> 
<script src="/userdrivease/resources/homex/js/validate.js"></script> 
<script src="/userdrivease/resources/homex/js/jquery.cookie.js"></script> 
<script src="/userdrivease/resources/homex/js/custom.js"></script>
<script src="/userdrivease/resources/js/jquery.min.js"></script> 
<!--jQuery Layer Slider --> 
<script src="/userdrivease/resources/js/greensock.js"></script> 
<script src="/userdrivease/resources/js/layerslider.transitions.js"></script> 
<script src="/userdrivease/resources/js/layerslider.kreaturamedia.jquery.js"></script> 
<!--jQuery Layer Slider --> 
<script src="/userdrivease/resources/js/popper.min.js"></script> 
<script src="/userdrivease/resources/js/bootstrap.min.js"></script> 
<script src="/userdrivease/resources/js/owl.carousel.min.js"></script> 
<script src="/userdrivease/resources/js/tmpl.js"></script> 
<script src="/userdrivease/resources/js/jquery.dependClass-0.1.js"></script> 
<script src="/userdrivease/resources/js/draggable-0.1.js"></script> 
<script src="/userdrivease/resources/js/jquery.slider.js"></script> 
<script src="/userdrivease/resources/js/wow.js"></script> 
<script src="/userdrivease/resources/js/YouTubePopUp.jquery.js"></script> 
<script src="/userdrivease/resources/js/validate.js"></script> 
<script src="/userdrivease/resources/js/jquery.cookie.js"></script> 
<script src="/userdrivease/resources/js/custom.js"></script>
</body>

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
</html>