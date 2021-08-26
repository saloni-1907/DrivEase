<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.drivease.model.Vehicle"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
<head>
<%@include file="head.jsp"%>

</head>
<body>

	<%@include file="userheader.jsp"%>
			<div class="full-row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="w-50 m-auto w-sm-100">
                        <c:choose>
                        <c:when test="${changePassword}">
                            <div class="login-form">
                                <h4 class="text-secondary mb-4">Change Your Password</h4>
                                <form:form  method="post" 
								modelAttribute="cpass" class="icon-form">
                                    <div class="form-group password">
                                        <label>Old Password</label>
                                        <input type="password" path="oldPassword" name="oldPassword" class="form-control bg-gray" placeholder="">
                                    </div>
                                    <div class="form-group password">
                                        <label>New Password</label>
                                        <input type="password" path="password" name="password" class="form-control bg-gray" placeholder="">
                                    </div>
                                    <div class="form-group password">
                                        <label>Confirm Password</label>
                                        <input type="password" path="cpassword" name="cpassword" class="form-control bg-gray" placeholder="">
                                    </div>
                                    <%if(request.getParameter("errorMsg") != null){ %>
                                <div style="color: red;margin-left:70px"><%= request.getParameter("errorMsg") %></div>
                                <%} %>
								<center>
                                  <div>
                                        <input type="submit" class="btn btn-primary mt-3" formaction="/userdrivease/user/change" value="Submit" >
                                        <input type="submit" class="btn btn-primary mt-3" formaction="/userdrivease/user/home" value="Cancel">
                                        
                                        </div></center>
                                </form:form>
                            </div>
                            </c:when>
                            <c:otherwise>
                            	<div class="login-form">
                                <h4 class="text-secondary mb-4">Create New Password</h4>
                                <form  method="post" 
								modelAttribute="npass" action="/userdrivease/user/newpass" class="icon-form">
                                    <div class="form-group password">
                                        <label>New Password</label>
                                        <input type="password" path="password" name="password" class="form-control bg-gray" placeholder="">
                                    </div>
                                    <div class="form-group password">
                                        <label>Confirm Password</label>
                                        <input type="password" path="cpassword" name="cpassword" class="form-control bg-gray" placeholder="">
                                    </div>
                                    <%if(request.getParameter("errorMsg") != null){ %>
                                <div style="color: red;margin-left:70px"><%= request.getParameter("errorMsg") %></div>
                                <%} %>
								<center>
                                  <div>
                                        <button type="submit" class="btn btn-primary mt-3">Submit</button>
                                        </div></center>
                                </form>
                            </div>
                            
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>	</div>
	<%@include file="userfooter.jsp"%>
	<!-- Scroll to top -->
	<a href="#" class="bg-secondary text-white hover-text-secondary"
		id="scroll"><i class="fas fa-angle-up"></i></a>
	<!-- End Scroll To top -->

	<!-- Wrapper End -->

	<!--	Js Link
============================================================-->
	<script src="/userdrivease/resources/homex/js/jquery.min.js"></script>
	<!--jQuery Layer Slider -->
	<script src="/userdrivease/resources/homex/js/greensock.js"></script>
	<script
		src="/userdrivease/resources/homex/js/layerslider.transitions.js"></script>
	<script
		src="/userdrivease/resources/homex/js/layerslider.kreaturamedia.jquery.js"></script>
	<!--jQuery Layer Slider -->
	<script src="/userdrivease/resources/homex/js/popper.min.js"></script>
	<script src="/userdrivease/resources/homex/js/bootstrap.min.js"></script>
	<script src="/userdrivease/resources/homex/js/owl.carousel.min.js"></script>
	<script src="/userdrivease/resources/homex/js/tmpl.js"></script>
	<script
		src="/userdrivease/resources/homex/js/jquery.dependClass-0.1.js"></script>
	<script src="/userdrivease/resources/homex/js/draggable-0.1.js"></script>
	<script src="/userdrivease/resources/homex/js/jquery.slider.js"></script>
	<script src="/userdrivease/resources/homex/js/chart.min.js"></script>
	<script src="/userdrivease/resources/homex/js/wow.js"></script>
	<script
		src="/userdrivease/resources/homex/js/YouTubePopUchart.min.html"></script>
	<script src="/userdrivease/resources/homex/js/validate.js"></script>
	<script src="/userdrivease/resources/homex/js/jquery.cookie.js"></script>
	<script src="/userdrivease/resources/homex/js/custom.js"></script>
	<script src="/userdrivease/resources/js/jquery.min.js"></script>
	<!--jQuery Layer Slider -->
	<script src="/userdrivease/resources/js/greensock.js"></script>
	<script src="/userdrivease/resources/js/layerslider.transitions.js"></script>
	<script
		src="/userdrivease/resources/js/layerslider.kreaturamedia.jquery.js"></script>
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