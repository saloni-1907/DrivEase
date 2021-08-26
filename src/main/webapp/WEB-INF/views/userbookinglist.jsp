<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.drivease.model.Vehicle"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
<head>

<%@include file="head.jsp"%>




<title>DrivEase Manage Vehicles</title>
</head>
<body>

	<%@include file="userheader.jsp"%>
	<div id="page-wrapper">
		
		<div class="row">
			<div class="col-lg-12">
				<h3 class="text-secondary double-down-line text-center">Your
					Vehicle Bookings</h3>
			</div>
		</div>

		<c:choose>
			<c:when test="${vehicle}">
				<div class="row">

					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12 col-xl-12">
								<div class="row">

									<table class="w-100 items-list bg-transparent">
										<thead>
											<tr class="bg-white">
												<th>Vehicles</th>
												<th>Lender Details</th>
												<th>Date-Time</th>
												<th>Amount</th>
												<th>Current Status</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="vl" items="${vehicleList}">


												<tr>
													<td><a
														href="/userdrivease/vehicle/viewVehicle/${vl.vehicleId}">
															<img
															src="/userdrivease/resources/images/vehiclePicture/${vl.vehiclePicture}"
															width="40" height="140" alt="">
													</a>
														<div class="property-info d-table">
															<h5 class="text-secondary">
																<c:out value="${vl.vehicleNo}" />
															</h5>
															<span class="font-14">${vl.vehicleName} </span>
															<div class="price mt-3">
																<span class="text-primary"></span> <span></span>
															</div>
														</div></td>
													<td>${vl.lenderName}<br> ${vl.lenderEmail} <br>
														${vl.lenderMobile}
													</td>
													<td>From: <c:out value="${vl.startingDate}" /><br />Till:
														${vl.endingDate}
													</td>
													<td>Rs. <c:out value="${vl.finalAmount}" />
													</td>
													<td><c:out value="${vl.status}" /></td>


												</tr>
											</c:forEach>
										</tbody>

									</table>



								</div>
								<div class="dashboard-copyright bg-white py-4 text-center w-100"></div>
							</div>
						</div>
			</c:when>
			<c:otherwise><center>No Vehicle Bookings</center></c:otherwise>
		</c:choose>
		<br>
		<div class="row">
			<div class="col-lg-12">
				<h3 class="text-secondary double-down-line text-center">Your
					Driver Bookings</h3>
			</div>
		</div>
		
		<c:choose>
			<c:when test="${driver}">
				<div class="row">
					<div class="col-md-12 col-xl-12">
						<div class="row">

							<table class="w-100 items-list bg-transparent">
								<thead>
									<tr class="bg-white">
										<th>Drivers</th>
										<th>Contact Details</th>
										<th>Date-Time</th>
										<th>Amount</th>
										<th>Current Status</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="dl" items="${driverList}">


										<tr>
											<td><a
												href="/userdrivease/driver/viewDriver/${dl.driverId}"> <img
													src="/userdrivease/resources/images/profilePicture/${dl.driverPicture}"
													width="40" height="140" alt="">
											</a>
												<div class="property-info d-table">
													<h5 class="text-secondary">
														<c:out value="${dl.driverName}" />
													</h5>
													<span class="font-14">${dl.driverVehicleType} </span>
													<div class="price mt-3">
														<span class="text-primary"></span> <span></span>
													</div>
												</div></td>
											<td>${dl.driverEmail}<br> ${dl.driverMobile}
											</td>
											<td>From: <c:out value="${dl.startingDate}" /><br />Till:
												${dl.endingDate}
											</td>
											<td>Rs. <c:out value="${dl.finalAmount}" />
											</td>
											<td><c:out value="${dl.status}" /></td>


										</tr>
									</c:forEach>
								</tbody>

							</table>



						</div>
						<div class="dashboard-copyright bg-white py-4 text-center w-100"></div>
					</div>
				</div>
			</c:when>
			<c:otherwise><center>
					No Driver Bookings</center>
				</c:otherwise>
		</c:choose>
	</div>
	</div>
	</div>
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