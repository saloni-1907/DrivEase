<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.drivease.model.VehicleCompany"%>
<%@page import="com.drivease.model.VehicleModel"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-submit-property.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
<head>
<!-- Required meta tags -->
<%@include file="head.jsp"%>
<title>Vehicle Form</title>
</head>
<body>

	<%@include file="userheader.jsp"%>
	<div class="bg-gray full-row py-5 page-banner">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h3 class="page-name float-left text-secondary mt-1 mb-0">
						<c:choose>
							<c:when test="${edit}">
								Update vehicle Details
							</c:when>
							<c:otherwise>
								Vehicle Registration Form
							</c:otherwise>
						</c:choose>
					</h3>
				</div>

			</div>
		</div>
	</div>

	<div id="page-wrapper"></div>
	<div class="full-row dashboard py-0  ">
		<div class="container-fluid">
			<div class="row">

				<div class="col-md-11 col-xl-10">
					<div class="row">
						<div class="dashboard-panel w-100">

						<div class="submit-form p-5 bg-white">
						<form:form method="post" enctype="multipart/form-data" modelAttribute="vehicle">

									<div class="description">
										<h5 class="text-secondary">Vehicle Details</h5>
										<hr>
										<div class="col-lg-12 col-md-12">
											<form:input type="hidden" name="vehicleId" path="vehicleId"
												id="vehicleId" />
											<form:input type="hidden" name="userId" path="userId"
												id="userId" />

											<div class="form-group">
												<label>Vehicle Number</label> <span class="ml-2 fa-2x"></span>
												<form:input type="text" name="title" class="form-control"
													path="vehicleNumber" />
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>Company Name</label>
													<form:select class="form-control" path="companyId"
														id="companyId">
														<form:option value="0" disabled="true">Select Vehicle Company</form:option>
														<c:forEach var="c" items="${companyList}">
															<form:option value="${c.companyId}"
																label="${c.companyName}" />
														</c:forEach>
													</form:select>
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>Model Name</label>
													<form:select class="form-control" path="modelId">
														<form:option value="0" disabled="true">Select Vehicle Model</form:option>
														<c:forEach var="m" items="${modelList}">
															<form:option value="${m.modelId}" label="${m.modelName}" />
														</c:forEach>
													</form:select>
												</div>
											</div>
										</div>


										<div class="col-lg-6 col-md-12">
											<div class="form-group">
												<label>Upload File</label> 
								<c:choose>
								  <c:when test="${edit}">
								  	 <div>
											<div id="dvPreview">
												<img alt="" src="/userdrivease/resources/images/vehiclePicture/${vehicle.vehiclePicture}" style="height:100px;width: 200px">
											</div>
											<input type="file" id="vehiclePicture" name="vehiclePicture"
												path="vehiclePicture"  />
											<hr />
											<br />

										</div>
								  	
								  </c:when>
								  <c:otherwise>
								  	 <div>
											<div id="dvPreview"></div>
											<input type="file" id="vehiclePicture" name="vehiclePicture"
												path="vehiclePicture" />
											<hr />
											<br />

										</div>
								  	
								  </c:otherwise>
								  </c:choose>


											</div>
										</div>
										</div>
										<div class="description">
										<h5 class="text-secondary">Pick Up Location</h5>
										<hr>
									
										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group address">
													<label>Pick Up Address</label>
													<form:textarea class="form-control bg-gray"
														placeholder="Enter Pickup Address For The Vehicle"
														name="address" path="pickUpAdd" />
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>State</label>

													<form:select class="form-control bg-gray" path="stateId"
														id="stateId">
														<form:option value="0" disabled="true">Select State</form:option>
														<c:forEach var="s" items="${liststate}">
															<form:option value="${s.stateId}" label="${s.stateName}" />
														</c:forEach>
													</form:select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>City</label>
													<form:select class="form-control bg-gray" path="cityId"
														id="cityId">
														<form:option value="0" disabled="true">Select City</form:option>
														<c:forEach var="c" items="${listcity}">
															<form:option value="${c.cityId}" label="${c.cityName}" />
														</c:forEach>
													</form:select>
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>Area</label>
													<form:select class="form-control bg-gray" path="areaId"
														id="areaId">
														<form:option value="0" disabled="true">Select Area</form:option>
														<c:forEach var="a" items="${listarea}">
															<form:option value="${a.areaId}" label="${a.areaName}" />
														</c:forEach>
													</form:select>
												</div>
											</div>
										</div>
									</div>
							<div class="description">
								<h5 class="text-secondary">Rent Details</h5>
								<hr>
								<div class="row">

									<div class="col-lg-6 col-md-12">
										<div class="form-group">
											<label>Rent on hourly basis</label>
											<form:input type="number" class="form-control"
												path="hourlyRent" />
										</div>
									</div>
									<div class="col-lg-6 col-md-12">
										<div class="form-group">
											<label>Rent on daily basis</label>
											<form:input type="number" class="form-control"
												path="dailyRent" />

										</div>
									</div>
								</div>
							</div>
							<c:choose>
								<c:when test="${editDriver}">
									<div class="row">

										<div class="property-location mt-4">
											<h5 class="text-secondary">Driver Details</h5>
											<hr>
											<div class="row">
												<div class="col-lg-6 col-md-6">
													<div class="form-group">
														<label>Name</label>
														<form:input type="text" name="title" class="form-control"
															path="name" />
													</div>
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="form-group">
														<label>Date Of Birth</label>
														<form:input type="date" name="title" class="form-control"
															path="dob" />

													</div>
												</div>


												<div class="col-lg-6 col-md-6">

													<div class="form-group">
														<label>Gender</label><br>
														<form:radiobutton name="gender" value="Male" path="gender"
															id="male" />
														Male &nbsp; &nbsp; &nbsp;
														<form:radiobutton id="female" name="gender" value="Female"
															path="gender" />
														Female &nbsp; &nbsp; &nbsp;
														<form:radiobutton id="other" name="gender" value="Other"
															path="gender" />
														Other<br>
													</div>

												</div>
												<div class="col-lg-6 col-md-6">
													<div class="form-group">
														<label>Mobile Number</label>
														<form:input type="text" class="form-control"
															path="mobileNumber" />

													</div>
												</div>


											</div>
										</div>
									</div>

								</c:when>
								<c:otherwise>
								
									<c:choose>
										<c:when test="${edit}">
										</c:when>
										<c:otherwise>
										
									<div class="row">
										<div class="d-inline-block d-sm-flex my-4 w-100">
											<label class="align-self-center">Are you providing
												your vehicle with driver?</label> &nbsp; &nbsp;
											<div class="radio-check ml-auto">
												<abbr title="Click button to slide the radio button">
													<input type="checkbox" id="radio-1" class="d-none"
													name="question" value="Yes"> <label for="radio-1"><span>No</span><span
														class="text-white">Yes</span></label> 
														<form:input type="hidden"
														id="cd" path="withDriver" />
												</abbr>
											</div>
										</div>
										<hr />
										<div id="divWithDriver" style="display: none">
											<div class="row">
												<div class="property-location mt-4">
													<h5 class="text-secondary">Driver Details</h5>
													<hr>
													<div class="row">
														<div class="col-lg-6 col-md-6">
															<div class="form-group">
																<label>Name</label>
																<form:input type="text" name="title"
																	class="form-control" path="name" />
															</div>
														</div>
														<div class="col-lg-6 col-md-6">
															<div class="form-group">
																<label>Date Of Birth</label>
																<form:input type="date" name="title"
																	class="form-control" path="dob" />

															</div>
														</div>


														<div class="col-lg-6 col-md-6">

															<div class="form-group">
																<label>Gender</label><br>
																<form:radiobutton name="gender" value="Male"
																	path="gender" id="male" />
																Male &nbsp; &nbsp; &nbsp;
																<form:radiobutton id="female" name="gender"
																	value="Female" path="gender" />
																Female &nbsp; &nbsp; &nbsp;
																<form:radiobutton id="other" name="gender" value="Other"
																	path="gender" />
																Other<br>
															</div>

														</div>
														<div class="col-lg-6 col-md-6">
															<div class="form-group">
																<label>Mobile Number</label>
																<form:input type="text" class="form-control"
																	path="mobileNumber" />

															</div>
														</div>


													</div>
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
								</c:choose>
								</c:otherwise>
							</c:choose>
							<div class="row">
								<div class="description col-lg-12 mt-4">
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<div class="form-group">
												<label>Add Description</label>
												<form:textarea class="form-control bg-gray"
													placeholder="Write Details..." rows="4" path="description" />

											</div>
											<div class="form-group">
												<center>
													<c:choose>
														<c:when test="${edit}">
															<input type="submit" name="Update"
																class="btn btn-primary" value="Update"
																style="width: 200px;"
																formaction="/userdrivease/vehicle/updateVehicle">
																<input type="reset" name="cancel" class="btn btn-primary"
														value="Cancel" style="width: 200px;" formaction="/userdrivease/vehicle/manageMyVehicles">
												
																
														</c:when>
														<c:otherwise>
															<input type="submit" name="submit"
																class="btn btn-primary" value="Submit"
																style="width: 200px;"
																formaction="/userdrivease/vehicle/saveVehicle">
																<input type="reset" name="cancel" class="btn btn-primary"
														value="Cancel" style="width: 200px;" formaction="/userdrivease/user/home">
												
														</c:otherwise>
													</c:choose>
													</center>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</form:form>
				
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
	<script src="/userdrivease/resources/homex/js/chart.min.js"></script>
	<script src="/userdrivease/resources/homex/js/wow.js"></script>
	<script
		src="/userdrivease/resources/homex/js/YouTubePopUchart.min.html"></script>
	<script src="/userdrivease/resources/homex/js/validate.js"></script>
	<script src="/userdrivease/resources/homex/js/jquery.cookie.js"></script>
	<script src="/userdrivease/resources/homex/js/custom.js"></script>

	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script language="javascript" type="text/javascript">
		$(function() {
			$("#vehiclePicture")
					.change(
							function() {
								if (typeof (FileReader) != "undefined") {
									var dvPreview = $("#dvPreview");
									dvPreview.html("");
									var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
									$($(this)[0].files)
											.each(
													function() {
														var file = $(this);
														if (regex
																.test(file[0].name
																		.toLowerCase())) {
															var reader = new FileReader();
															reader.onload = function(
																	e) {
																var img = $("<img />");
																img
																		.attr(
																				"style",
																				"height:100px;width: 200px");
																img
																		.attr(
																				"src",
																				e.target.result);
																dvPreview
																		.append(img);
															}
															reader
																	.readAsDataURL(file[0]);
														} else {
															alert(file[0].name
																	+ " is not a valid image file.");
															dvPreview.html("");
															return false;
														}
													});
								} else {
									alert("This browser does not support HTML5 FileReader.");
								}
							});
		});
	</script>
	
	
	<script type="text/javascript">
		$(function() {
			$("#radio-1").click(function() {
				if ($(this).val() == "Yes") {

					$("#divWithDriver").show();
					$('#cd').val(1);

					$(this).val("No");
				} else {

					$("#divWithDriver").hide();
					$('#cd').val(0);
					$(this).val("Yes");
				}
			});
		});
	</script>

	<script>
		function validateForm() {
			var submit = true;
			var fname = document.userRegistrationForm.fname.value;
			var lname = document.userRegistrationForm.lname.value;
			var num = document.userRegistrationForm.mobileNo.value;
			var dob = document.userRegistrationForm.dob.value;
			var gender = document.userRegistrationForm.gender.value;
			var address = document.userRegistrationForm.address.value;
			var emailId = document.userRegistrationForm.emailId.value;
			var password = document.userRegistrationForm.password.value;
			var cpassword = document.userRegistrationForm.cpassword.value;

			if (fname == "" || fname == null) {
				document.getElementById("fname-error").innerHTML = "First Name cannot be blank!";
				submit = false;
			}

			if (lname == "" || lname == null) {
				document.getElementById("lname-error").innerHTML = "Last Name cannot be blank!";
				submit = false;
			}

			if (num == "" || num == null) {
				document.getElementById("mobile-error").innerHTML = "Phone number cannot be blank!";
				submit = false;
			}
			if (isNaN(num)) {
				document.getElementById("mobile-error").innerHTML = "Enter numeric values only";
				submit = false;
			}
			if (num.length != 10) {
				document.getElementById("mobile-error").innerHTML = "Phone number must be of 10 digits only";
				submit = false;
			}
			if (dob == "" || dob == null) {
				document.getElementById("dob-error").innerHTML = "Please enter your date of birth!";
				submit = false;
			}
			if (gender == "" || gender == null) {
				document.getElementById("gender-error").innerHTML = "Please select your gender!";
				submit = false;
			}
			if (address == "" || address == null) {
				document.getElementById("address-error").innerHTML = "Please enter your address!";
				submit = false;
			}
			if (emailId == "" || emailId == null) {
				document.getElementById("email-error").innerHTML = "Please enter your email address!";
				submit = false;
			}
			if (password == "" || password == null) {
				document.getElementById("password-error").innerHTML = "Please enter your password!";
				submit = false;
			}

			if (cpassword == "" || cpassword == null) {
				document.getElementById("cpassword-error").innerHTML = "Please re-enter your password!";
				submit = false;
			}
			if (password != cpassword) {

				document.getElementById("cpassword-error").innerHTML = "Your password does not match!Try again!";
				submit = false;
			}
			return submit;
		}
	</script>

</body>

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-submit-property.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
</html>