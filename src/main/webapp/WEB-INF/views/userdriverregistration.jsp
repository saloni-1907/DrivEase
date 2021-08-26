<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.drivease.model.VehicleType"%>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-submit-property.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
<head>
<!-- Required meta tags -->
<%@include file="head.jsp"%>
<title>Driver Registration page</title>

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
							Edit Your Driver Details
						</c:when>
							<c:otherwise>Activate
						Your Driver Account</c:otherwise>
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
							<div class="text-center">
								<%
									if (request.getParameter("error") != null) {
								%>
								<div style="color: red;"><%=request.getParameter("error")%></div>
								<%
									}
								%>
							</div>
							<div class="submit-form p-5 bg-white">
								<form:form enctype="multipart/form-data" modelAttribute="driver"
									method="post" name="driverform"
									onsubmit="return validateDriverForm()">
									<form:input type="hidden" path="driverId" class="form-control" />
									<form:input type="hidden" path="userId" class="form-control" />
									<form:input type="hidden" path="licenseId" class="form-control" />
									<div class="description">
										<h5 class="text-secondary">License Details</h5>
										<hr>
										<div class="row">
											<div class="col-lg-12 col-md-12">
												<div class="form-group">
													<label>License Number</label> <span class="ml-2 fa-2x"><i
														title="Property Title"></i></span>
													<form:input type="text" name="licenseNo" id="licenseNo"
														path="licenseNo" class="form-control" />
													<span id="licenseNo-error"></span>
												</div>
											</div>

											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>Date Of Issue</label> <span class="ml-2 fa-2x"><i
														title="Property Title"></i></span>
													<form:input type="date" name="date_of_issue"
														id="date_of_issue" path="dateOfIssue" class="form-control" />
													<span id="issuedate-error"></span>
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>Date Of Expiry</label> <span class="ml-2 fa-2x"><i
														title="Property Title"></i></span>
													<form:input type="date" name="date_of_expiry"
														id="date_of_expiry" path="dateOfExpiry"
														class="form-control" />
													<span id="expirydate-error"></span>
												</div>
											</div>
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>Upload License Copy</label>
													<c:choose>
														<c:when test="${edit}">
															<div>
																<div id="dvPreview">
																	<img alt=""
																		src="/userdrivease/resources/images/licensePicture/${driver.licensePicture}"
																		style="height: 100px; width: 200px">
																</div>
																<input type="file" id="licensePicture"
																	name="licensePicture" path="licensePicture" />
																<hr />
																<br />

															</div>

														</c:when>
														<c:otherwise>
															<div>
																<div id="dvPreview"></div>
																<input type="file" id="licensePicture"
																	name="licensePicture" path="licensePicture" />
																<hr />
																<br />

															</div>

														</c:otherwise>
													</c:choose>
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
														<form:input type="number" path="hourlyRent"
															name="hourlyRent" id="hourlyRent" class="form-control" />
														<span id="hourlyrent-error"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label>Rent on daily basis</label>
														<form:input type="number" path="dailyRent"
															class="form-control" name="dailyRent" id="dailyRent" />
														<span id="dailyrent-error"></span>
													</div>
												</div>


											</div>

										</div>
									</div>

									<div class="property-location mt-4">
										<h5 class="text-secondary">Other Details</h5>
										<hr>
										<div class="row">
											<div class="col-lg-6 col-md-12">
												<div class="form-group">
													<label>Preferable Vehicle Type</label>

													<form:select class="form-control" path="vehicleTypeId">
														<c:forEach var="t" items="${typeList}">

															<form:option value="${t.vehicleTypeId}"
																label="${t.vehicleTypeName}" />
														</c:forEach>
													</form:select>
												</div>
											</div>

										</div>
									</div>
									<div class="description col-lg-12 mt-4">
										<div class="row">
											<div class="col-lg-12 col-md-12">
												<div class="form-group">
													<label>Add Description</label>
													<form:textarea class="form-control bg-gray"
														placeholder="Add Description" path="description" rows="5"
														name="description" id="description"></form:textarea>
													<span id="description-error"></span>
												</div>
												<div class="form-group">
													<center>
														<c:choose>
															<c:when test="${edit}">
																<input type="submit" name="submit"
																	class="btn btn-primary" value="Update"
																	style="width: 200px;"
																	formaction="/userdrivease/driver/updateDriver" />
																<input type="submit" name="cancel"
																	class="btn btn-primary" value="Cancel"
																	style="width: 200px;"
																	formaction="/userdrivease/driver/myAccount" />
															</c:when>
															<c:otherwise>
																<input type="submit" name="submit"
																	class="btn btn-primary" value="Submit"
																	style="width: 200px;"
																	formaction="/userdrivease/driver/saveDriver" />
																<input type="submit" name="cancel"
																	class="btn btn-primary" value="Cancel"
																	style="width: 200px;"
																	formaction="/userdrivease/user/home" />
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
	<script language="javascript" type="text/javascript">
		$(function() {
			$("#licensePicture")
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
	
	<script>
		function validateDriverForm() {
			var submit = true;
			var licenseNo = document.driverform.licenseNo.value;
			var date_of_issue = document.driverform.date_of_issue.value;
			var date_of_expiry = document.driverform.date_of_expiry.value;
			var avail_from = document.driverform.avail_from.value;
			var avail_till = document.driverform.avail_till.value;
			var hourlyRent = document.driverform.hourlyRent.value;
			var dailyRent = document.driverform.dailyRent.value;
			var description = document.driverform.description.value;

			if (licenseNo == "" || licenseNo == null) {
				document.getElementById("licenseNo-error").innerHTML = "*This field can not be empty";
				submit = false;
			}

			if (date_of_issue == "" || date_of_issue == null) {
				document.getElementById("issuedate-error").innerHTML = "*This field can not be empty";
				submit = false;
			}

			if (date_of_expiry == "" || date_of_expiry == null) {
				document.getElementById("expirydate-error").innerHTML = "*This field can not be empty";
				submit = false;
			}

			if (avail_from == "" || avail_from == null) {
				document.getElementById("availfrom-error").innerHTML = "*This field can not be empty";
				submit = false;
			}
			if (avail_till == "" || avail_till == null) {
				document.getElementById("availtill-error").innerHTML = "*This field can not be empty";
				submit = false;
			}
			if (hourlyRent == "" || hourlyRent == null) {
				document.getElementById("hourlyrent-error").innerHTML = "*This field can not be empty";
				submit = false;
			}
			if (dailyRent == "" || dailyRent == null) {
				document.getElementById("dailyrent-error").innerHTML = "*This field can not be empty";
				submit = false;
			}
			if (password == "" || password == null) {
				document.getElementById("password-error").innerHTML = "*This field can not be empty";
				submit = false;
			}

			if (description == "" || description == null) {
				document.getElementById("description-error").innerHTML = "Please re-enter your password!";
				submit = false;
			}

			return submit;
		}
	</script>
</body>


<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-submit-property.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
</html>

