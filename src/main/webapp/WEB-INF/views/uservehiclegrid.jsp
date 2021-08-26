<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.drivease.model.Vehicle"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/property-grid-sidebar-left.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:22 GMT -->
<head>
<!-- Required meta tags -->
<%@include file="head.jsp"%>

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
		<%@include file="userheader.jsp"%>
		<!--	Banner
		===============================================================-->
		
		<!--	Property Grid
		===============================================================-->
		<div class="full-row">
			<div class="container">

				<div class="row">

					<div class="col-lg-4">
						<div class="sidebar-widget">
							<h4
								class="double-down-line-left text-secondary position-relative pb-4 mb-4">Advance
								Search</h4>
							<form:form method="post" modelAttribute="vehicleFilter"
								action="/userdrivease/vehicle/filterSearch">
								<div class="row">
									 <div class="col-md-12">
										<div class="form-group">
											<span class ="text-primary">Driver Availability</span> <br>
											<form:checkbox path="withDriverFilter"
													value="1" class="filters" />
											&nbsp;With Driver
											<form:checkbox path="withDriverFilter"
													value="0" class="filters" />
											&nbsp;Without Driver
											<br>
										</div>
									</div>
							 
									<div class="col-md-12">
										<div class="form-group">
											<span class ="text-primary">Vehicle Type</span> <br>
											<c:forEach items="${vtList}" var="type">
												<form:checkbox path="vehicleTypeFilter"
													value="${type.vehicleTypeName}" class="filters" />
											&nbsp;${type.vehicleTypeName}
											<br>
											</c:forEach>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<span class ="text-primary">Hourly Rent (In Rupees)</span> <br>
											<form:checkbox path="hourlyRentFilter" value="Below 100"
												class="filters" />
											&nbsp;Below 100 &nbsp; &nbsp;
											<form:checkbox path="hourlyRentFilter" value="100-300"
												class="filters" />
											&nbsp;Between 100-300 &nbsp; <br>
											<form:checkbox path="hourlyRentFilter" value="Above 300"
												class="filters" />
											&nbsp;Above 300

										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<span class ="text-primary">Daily Rent (In Rupees)</span> <br>
											<form:checkbox path="dailyRentFilter" value="Below 500"
												class="filters" />
											&nbsp;Below 500 &nbsp; &nbsp;
											<form:checkbox path="dailyRentFilter" value="500-1000"
												class="filters" />
											&nbsp;Between 500-1000 &nbsp;<br> 
											<form:checkbox path="dailyRentFilter" value="Above 1000"
												class="filters" />
											&nbsp;Above 1000

										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<span class ="text-primary">City</span> <br>
											<form:select class="form-control bg-gray" path="cityId" name="cityId">
												<option value=0 label="Select City" />
												<c:forEach var="c" items="${cityList}">
													<form:option value="${c.cityId}" label="${c.cityName}" />
												</c:forEach>
											</form:select>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group mt-4">
											<input type="submit" class="btn btn-primary" style="width:49%;" value="Search Driver">
											<input type="reset" class="btn btn-primary" style="width:49%;" value="Reset">
											
										</div>
									</div>
								</div>
							</form:form>
						</div>

						<div class="sidebar-widget mt-5">
							
						</div>
					</div>

					<div class="col-lg-8">
						<div class="row">
							<div class="col-lg-12">
								<div class="pb-4 mt-md-50"></div>
							</div>
						</div>
						<div class="row">
						<c:forEach var="v" items="${vehicleList}">
						<a href="/userdrivease/vehicle/viewVehicle/${v.vehicleId}">
							<div class="col-md-6">
								<div class="featured-thumb hover-zoomer mb-4">
									<div class="overlay-black overflow-hidden position-relative">
										<img
											src="/userdrivease/resources/images/vehiclePicture/${v.vehiclePicture}" height="300"
											alt="">
										<div class="sale bg-secondary text-white">${v.status}</div>
										<div class="price text-primary">
											Rs.${v.hourlyRent}/Hour <br>Rs.${v.dailyRent}/Day
										</div>
										
									</div>
									<div class="featured-thumb-data shadow-one">
										<div class="p-4">
											<h5 class="text-secondary hover-text-primary mb-2">
												<a href="#">${v.companyName} ${v.modelName}</a>
											</h5>
											<span class="location">${v.vehicleNumber}</span>
										</div>
										
									</div>
								</div>
								
							</div>
							</a>
							</c:forEach>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="userfooter.jsp"%>
		<!-- Scroll to top -->
		<a href="#" class="bg-secondary text-white hover-text-secondary"
			id="scroll"><i class="fas fa-angle-up"></i></a>
		<!-- End Scroll To top -->
	</div>
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
	<script src="/userdrivease/resources/homex/js/wow.js"></script>
	<script src="/userdrivease/resources/homex/js/YouTubePopUp.jquery.js"></script>
	<script src="/userdrivease/resources/homex/js/validate.js"></script>
	<script src="/userdrivease/resources/homex/js/jquery.cookie.js"></script>
	<script src="/userdrivease/resources/homex/js/custom.js"></script>
</body>

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/property-grid-sidebar-left.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:22 GMT -->
</html>