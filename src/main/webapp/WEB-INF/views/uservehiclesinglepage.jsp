<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.drivease.model.Vehicle"%>
<%@page import="com.drivease.model.User"%>
<!DOCTYPE html>
<html lang="en">
<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/property-single-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:29 GMT -->
<head>
<%@include file="head.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

</head>
<body>

	<%
		if (session.getAttribute("user") == null) {
			response.sendRedirect("error");
		}
	%>
	<%@include file="userheader.jsp"%>
	<div id="page-wrapper">

		<div class="row">


			<div class="full-row">
				<div class="container">
					<div class="row">
						<div class="col-lg-8">
							<div class="row">
								<div class="col-md-6">
									<h3 class="mt-2 text-secondary">${vehicle.companyName}
										${vehicle.modelName} ${vehicle.vehicleNumber}</h3>
									<span class="mb-sm-20 d-block"><i
										class="fas fa-map-marker-alt text-primary font-16"></i> &nbsp;
										Pick-up Location</span>${vehicle.pickUpAdd}, <br>
									${vehicle.areaName}, ${vehicle.cityName}, ${vehicle.stateName}.
								</div>
								<div class="col-md-6">
									<span class="d-block text-left text-secondary text-md-right"></span>
									<div class="text-primary text-left my-2 text-md-right">
										<label style="color: black; font-weight: bold;">Rent
											per hour:</label> Rs.<span id="perHour">${vehicle.hourlyRent}</span>
									</div>
									<div class="text-primary text-left my-2 text-md-right">
										<label style="color: black; font-weight: bold;">Rent
											per day:</label> Rs. <span id="perDay">${vehicle.dailyRent}</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div id="single-property"
										style="width: 1200px; height: 700px; margin: 30px auto 50px;">
										<!-- Slide 1-->
										<div class="ls-slide"
											data-ls="duration:7500; transition2d:5; kenburnszoom:in; kenburnsscale:1.2;">
											<img width="900" height="700"
												src="/userdrivease/resources/images/vehiclePicture/${vehicle.vehiclePicture}"
												class="ls-bg" alt="" />
										</div>


									</div>
								</div>
							</div>
							<div class="property-details">
								<h2 class="text-secondary my-4">Description</h2>
								<p>${vehicle.description}</p>

								<h2 class="mt-5 mb-4 text-secondary">Vehicle Summary</h2>
								<div class="table-striped font-14 overflow-x-scroll pb-2">
									<table class="w-100">
										<tbody>
											<tr>
												<td>Vehicle Number :</td>
												<td>${vehicle.vehicleNumber}</td>
												<td>Vehicle Type :</td>
												<td>${vehicle.vehicleTypeName}</td>
											</tr>
											<tr>
												<td>Company Name :</td>
												<td>${vehicle.companyName}</td>
												<td>Model Name :</td>
												<td>${vehicle.modelName}</td>
											</tr>

										</tbody>
									</table>
								</div>
								<c:choose>
									<c:when test="${driverPresent}">

										<h2 class="mt-5 mb-4 text-secondary">Driver Details</h2>
										<div class="row">
											<div class="col-md-5">
												<ul>
													<li class="mb-6"><span
														class="text-secondary font-weight-bold">Name: </span>${vehicle.name}</li>
													<li class="mb-6"><span
														class="text-secondary font-weight-bold">Date Of
															Birth: </span>${vehicle.dob}</li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul>
													<li class="mb-6"><span
														class="text-secondary font-weight-bold">Gender: </span>${vehicle.gender}</li>
													<li class="mb-6"><span
														class="text-secondary font-weight-bold">Mobile
															number: </span>${vehicle.mobileNumber}</li>
												</ul>
											</div>
										</div>
									</c:when>
								</c:choose>
								<h2 class="mt-5 mb-4 text-secondary">User Reviews</h2>
								<ul class="post-comments">
									<c:forEach items="${reviewList}" var="review">
										<li class="py-4">
											<div class="avata">
												<img src="/userdrivease/resources/images/profilePicture/${review.userProfilePicture}"
													alt="">
											</div>
											<div class="comment-detail">
												<div class="d-inline-block mb-3">
													<h5 class="text-secondary">${review.userName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</h5>

												</div>
												<div class="float-right">
													<span class="text-ordinary"> ${review.reviewTime}</span>
												</div>
												<p>${review.reviewDesc}</p>

											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>


						<div class="col-lg-4">
							<h2
								class="double-down-line-left text-secondary position-relative pb-4 my-4">Make
								A Reservation</h2>
							<form:form class="d-inline-block w-100" modelAttribute="booking"
								action="/userdrivease/booking/bookVehicle" method="post">

								<form:input type="hidden" class="form-control"
									id="inlineFormInputGroupUsername3" path="bookingId" />
								<form:input type="hidden" class="form-control"
									id="inlineFormInputGroupUsername3" path="userId" />

								<label style="font-size: 15px;"><b>Start Date And
										Time</b></label>
								<div class='input-group date' id='startDateTime'>
									<form:input type='text' class="form-control"
										id='startDateTime1' path="startDate" />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
								<label><b>End Date And Time</b></label>
								<div class='input-group date' id='endDateTime'>
									<form:input type='text' class="form-control" id='endDateTime1'
										path="endDate" />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>

								<label><b>Payable Amount</b></label>
								<div class="form-group mb-2 mr-sm-2">
									<form:input type="number" class="form-control" id="finalAmount"
										placeholder="Payable Amount" path="finalAmount" />
								</div>
								<%
									if (request.getParameter("error") != null) {
								%>
								<div style="color: red; margin-left: 70px"><%=request.getParameter("error")%></div>
								<%
									}
								%>

								<input class="btn btn-primary mt-8" style="width: 49%;"
									type="submit" value="Book Now"
									formaction="/userdrivease/booking/bookVehicle/${vehicle.vehicleId}" />
								<input class="btn btn-primary mt-8" style="width: 49%;"
									type="submit" value="Cancel"
									formaction="/userdrivease/vehicle/viewVehicle/${vehicle.vehicleId}" />


							</form:form>
							<h2
								class="double-down-line-left text-secondary position-relative pb-4 my-4">Lender
								Details</h2>
							<div class="mt-4 p-4 shadow-one">
								<div class="img-80 float-left mr-3 mb-4 rounded-circle">
									<img src="/userdrivease/resources/images/profilePicture/${vehicle.lenderPicture}"
										alt="">
								</div>
								<h3 class="mt-2 text-primary">${vehicle.lenderName}</h3>
								<span>${vehicle.lenderMobile}</span> <span>${vehicle.lenderEmail}</span>

							</div>
							<h2
								class="double-down-line-left text-secondary position-relative pb-4 my-4">Give
								Your Review</h2>
							<div class="mt-4 p-4 shadow-one">
								<h3 class="mt-2 text-primary">
									<%
										User user = (User) session.getAttribute("user");
									%>
									<%
										out.println(user.getFname());
									%>
									<%
										out.println(user.getLname());
									%>
								</h3>

								<form:form class="bg-gray-input d-inline-block"
									modelAttribute="review"
									action="/userdrivease/review/addReview/Vehicle/${vehicle.vehicleId}"
									method="post">
									<div class="row">
										<br> <br>
										<%
											if (request.getParameter("reviewError") != null) {
										%>
										<div style="color: red; margin-left: 70px"><%=request.getParameter("reviewError")%></div>
										<%
											}
										%>

										<form:input type="hidden" class="form-control"
											id="inlineFormInputGroupUsername3" path="reviewId" />
										<form:input type="hidden" class="form-control"
											id="inlineFormInputGroupUsername3" path="userId" />

										<div class="col-md-12">
											<div class="form-group">

												<form:textarea class="form-control" id="review"
													name="review" path="reviewDesc" cols="30" rows="5"
													placeholder="Review" />
											</div>
										</div>
										<div class="col-md-12">
											<button type="submit" id="send" value="submit"
												class="btn btn-primary w-100">Submit</button>
										</div>
									</div>
								</form:form>
							</div>

						</div>
					</div>
				</div>
			</div>


	

			<!-- Scroll to top -->
			<a href="#" class="bg-secondary text-white hover-text-secondary"
				id="scroll"><i class="fas fa-angle-up"></i></a>
			<!-- End Scroll To top -->
		</div>
	</div>
	<!-- Wrapper End -->
		<%@include file="userfooter.jsp"%>
	<!--	Js Link
============================================================-->
	<!-- <script src="/userdrivease/resources/homex/js/jquery.min.js"></script> -->
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPZ-Erd-14Vf2AoPW2Pzlxssf6-2R3PPs"></script>
	<script
		src="/userdrivease/resources/homex/js/map/markerwithlabel_packed.js"></script>
	<script src="/userdrivease/resources/homex/js/map/infobox.js"></script>
	<script src="/userdrivease/resources/homex/js/map/custom-map.js"></script>
	<script>
	$(function() {
		alert("Hello");
		$('#startDateTime, #endDateTime').datetimepicker();
		$("#endDateTime1").blur(function() {
			alert("Hello1");
			var startDateTime = $("#startDateTime1").val();
			var endDateTime = $("#endDateTime1").val();
			var isValid = validateDate(startDateTime, endDateTime);
			var dateTimediff = findDiff(startDateTime, endDateTime);
			var finalAmount = findAmount(dateTimediff);
			$("#finalAmount").val(finalAmount)
		});
	});

	function validateDate(startDateTime, endDateTime) {
		var mStart = moment(startDateTime);
		var mEnd = moment(endDateTime);
		var result = mStart.isBefore(mEnd);
		if (!result) {
			alert("Start date should before end date !!!");
		}
		return mStart.isBefore(mEnd);
	}

	function findDiff(startDateTimeP, endDateTimeP) {
		
		 var date1 = new Date(startDateTimeP);
         var date2 = new Date(endDateTimeP);
         var oneDay = 24 * 60 * 60; // hours*minutes*seconds
         var oneHour = 60 * 60; // minutes*seconds
         var oneMinute = 60; // 60 seconds
         var firstDate = date1.getTime(); // convert to milliseconds
         var secondDate = date2.getTime(); // convert to milliseconds
         var seconds = Math.round(Math.abs(firstDate - secondDate) / 1000); //calculate  diffrence in seconds
         //var seconds = 1000;
         // the difference object
         var difference = {
             "days": 0,
             "hours": 0,
             "minutes": 0,
         }
         //calculate all the days and substract it from the total
         while (seconds >= oneDay) {
             difference.days++;
             seconds -= oneDay;
         }
         //calculate all the remaining hours then substract it from the total
         while (seconds >= oneHour) {
             difference.hours++;
             seconds -= oneHour;
         }
         //calculate all the remaining minutes then substract it from the total 
         while (seconds >= oneMinute) {
             difference.minutes++;
             seconds -= oneMinute;
         }
         
         //return the difference object
         var result = difference.days + ' Days ' + difference.hours + ' Hours ' + difference.minutes + ' Minutes ';
       	//alert(result);
       	return difference;
	}
   
	function findAmount(difference) {
    	var result = difference.days + ' Days ' + difference.hours + ' Hours ' + difference.minutes + ' Minutes ';
        var parDay = $("#perDay").text();
        var parHour = $("#perHour").text();
        var hour = difference.hours;
  		if(difference.minutes > 5)
  		{
  			hour++;
  		}
        
        var total = 0;
  		var perDayAmount = parseInt(parDay) * parseInt(difference.days);
  		var perHourAmount = parseInt(parHour) * parseInt(hour);
  		return perDayAmount + perHourAmount;
     }
</script>
</body>

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/property-single-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:29 GMT -->
</html>