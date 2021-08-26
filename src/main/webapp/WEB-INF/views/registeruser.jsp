<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.drivease.model.State"%>
<%@page import="com.drivease.model.City"%>
<%@page import="com.drivease.model.Area"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>

</head>
<body>
<%@include file="userheader.jsp"%>
	<div id="page-wrapper">
		<div class="row">
			

			<!--	Page Loader
=============================================================-->
			<div
				class="page-loader position-fixed z-index-9999 w-100 bg-white vh-100">
				<div
					class="d-flex justify-content-center y-middle position-relative">
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

							<h3 class="text-secondary double-down-line text-center">
								<c:choose>
									<c:when test="${edit}">
													Edit Profile
												</c:when>
									<c:otherwise>
													Registration
												</c:otherwise>
								</c:choose>
							</h3>

						</div>
					</div>

					<div class="row">


						<div class="col-md-11">
							<div class="mt-sm-50">


								<div class="text-center">
									<%
										if (request.getParameter("errorMsg") != null) {
									%>
									<div style="color: red;"><%=request.getParameter("errorMsg")%></div>
									<%
										}
									%>
								</div>
								<form:form class="mt-5 icon-form" name="userRegistrationForm"
									method="post" enctype="multipart/form-data"
									modelAttribute="user" onsubmit="return validateForm()">

									<form:input type="hidden" name="userId" path="userId"
										id="userId" />
								<div class="row">
										<div class="col-lg-6 col-md-12">
									
								<div class="form-group">
								  <c:choose>
								  <c:when test="${edit}">
								  	 <div>
											<div id="dvPreview" class="img-80 float-left mr-3 mb-4 rounded-circle">
												<img alt="" src="/userdrivease/resources/images/profilePicture/${user.profilePicture}" style="height:100px;width: 100px">
											</div>
											<input type="file" id="profilePicture" name="profilePicture"
												path="profilePicture"  />
										
											<br />

										</div>
								  	
								  </c:when>
								  <c:otherwise>
								  	 <div>
											<div id="dvPreview" class="img-80 float-left mr-3 mb-4 rounded-circle"></div>
											<input type="file" id="profilePicture" name="profilePicture"
												path="profilePicture" />
											
											<br />

										</div>
								  	
								  </c:otherwise>
								  </c:choose>
                                  </div>
									</div></div>
									
									
									
									<div class="row">
										<div class="col-lg-6 col-md-12">
											<div class="form-group user">
												<label>First Name</label>
												<form:input type="text" class="form-control bg-gray"
													placeholder="Enter First Name" name="fname" path="fname"
													id="fname" />
												<span id="fname-error"></span>
											</div>
										</div>



										<div class="col-lg-6 col-md-12">
											<div class="form-group user">
												<label>Last Name</label>
												<form:input type="text" class="form-control bg-gray"
													placeholder="Enter Last Name" name="lname" path="lname" />
												<span id="lname-error"></span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6 col-md-12">

											<div class="form-group phone">
												<label>Mobile Number</label>
												<form:input type="text" class="form-control bg-gray"
													placeholder="Enter Mobile Number" name="mobileNo"
													path="mobileNo" />
												<span id="mobile-error"></span>
											</div>
										</div>

										<div class="col-lg-6 col-md-12">

											<div class="form-group calender">
												<label>Date Of Birth</label> <br>
												<form:input type="date" class="form-control bg-gray"
													name="dob" path="dob" />
												<span id="dob-error"></span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6 col-md-12">
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
												Other<br> <span id="gender-error"></span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6 col-md-12">
											<div class="form-group address">
												<label>Residential Address</label>
												<form:textarea class="form-control bg-gray"
													placeholder="Enter Your Address" name="address"
													path="address" />
												<span id="address-error"></span>
											</div>
										</div>

										<div class="col-lg-6 col-md-12">
											<div class="form-group">
												<label>State</label>

												<form:select class="form-control bg-gray" path="stateId"
													id="stateId">
													<option value="0" label="Select State" disabled="disabled">
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

													<c:forEach var="a" items="${listarea}">
														<form:option value="${a.areaId}" label="${a.areaName}" />
													</c:forEach>
												</form:select>
											</div>
										</div>

									</div>
									<div class="form-group email">
										<label for="exampleInputEmail2">Email address</label>
										<form:input id="exampleInputEmail2" type="email"
											name="emailId" path="emailId" class="form-control bg-gray"
											placeholder="Enter Email Address" />
										<span id="email-error"></span>
									</div>
									<c:choose>
										<c:when test="${edit}">
											<input type="hidden" path="password" id="password">
										</c:when>

										<c:otherwise>
											<div class="row">
												<div class="col-lg-6 col-md-12">
													<div class="form-group password">
														<label for="exampleInputPassword1">Password</label>
														<form:input id="exampleInputPassword1" name="password"
															path="password" type="password"
															class="form-control bg-gray" placeholder="Enter Password" />
														<span id="password-error"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group password">
														<label for="exampleInputPassword2">Confirm
															Password</label>
														<form:input id="exampleInputPassword2" name="cpassword"
															path="cpassword" type="password"
															class="form-control bg-gray"
															placeholder="Confirm Password" />
														<span id="cpassword-error"></span>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
									<div class="text-center">
										<%
											if (request.getParameter("errorMsg") != null) {
										%>
										<div style="color: red;"><%=request.getParameter("errorMsg")%></div>
										<%
											}
										%>

										<%-- <div class="form-group form-check">
                                    <form:input type="checkbox" class="form-check-input" id="exampleCheck1" path="term" name="term"/>
                                    <label class="form-check-label" for="exampleCheck1">Accept Terms and Condition</label>
                                </div>
								 --%>
										<!-- <button type="submit" class="btn btn-primary mt-15">Reset</button>
                                <button type="submit" class="btn btn-primary mt-15">Register</button> -->
										<c:choose>
											<c:when test="${edit}">
												<input class="btn btn-primary btn-round" type="submit"
													value="Update" formaction="/userdrivease/user/updateUser" />
												<input value="Cancel" class="btn btn-primary btn-round"
													type="submit" formaction="/userdrivease/user/home">

											</c:when>
											<c:otherwise>
												<input class="btn btn-primary btn-round" type="submit"
													value="Register" formaction="/userdrivease/user/saveUser" />
												<input value="Cancel" class="btn btn-primary btn-round"
													type="submit" formaction="/userdrivease/user/login">

											</c:otherwise>

										</c:choose>

										<a class="text-secondary hover-text-primary d-block mt-4"
											href="#">View Terms and Conditions</a>
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


	<%@include file="script.jsp"%>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script language="javascript" type="text/javascript">
		$(function() {
			$("#profilePicture")
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
																				"height:100px;width: 100px");
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
		$("#stateId")
				.change(
						function() {
							var stateId = $(this).val();
							//alert("stateId : "+stateId);
							$
									.ajax({
										type : 'GET',
										url : "/userdrivease/area/getCities/"
												+ stateId,
										success : function(data) {

											var slctSubcat = $('#cityId'), option = "";
											slctSubcat.empty();
											for (var i = 0; i < data.length; i++) {
												option = option
														+ "<option value='"+data[i].cityId + "'>"
														+ data[i].cityName
														+ "</option>";
											}
											slctSubcat.append(option);
										},
										error : function() {
											alert("error");
										}
									});
						});
	</script>
	<script type="text/javascript">
		$("#cityId")
				.change(
						function() {
							var cityId = $(this).val();
							//alert("stateId : "+stateId);
							$
									.ajax({
										type : 'GET',
										url : "/userdrivease/area/getAreas/"
												+ cityId,
										success : function(data) {

											var slctSubcat = $('#areaId'), option = "";
											slctSubcat.empty();
											for (var i = 0; i < data.length; i++) {
												option = option
														+ "<option value='"+data[i].areaId + "'>"
														+ data[i].areaName
														+ "</option>";
											}
											slctSubcat.append(option);
										},
										error : function() {
											alert("error");
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
</html>










<%-- <c:choose>
												<c:when test="${edit}">
													<img
													src="/easypgadmin/resources/images/userProfile/${user.profilePicture}"
													class="picture-src" id="wizardPicturePreview" title="" />
												</c:when>
												<c:otherwise>
															<img
																src="/easypgadmin/resources/demos.creative-tim.com/bs3/material-dashboard-pro/assets/img/default-avatar.png"
																class="picture-src" id="wizardPicturePreview" title="" />
																</c:otherwise>	
										</c:choose>
											<div
													class="fileinput-preview fileinput-exists thumbnail img-circle"
													style=""></div>
												<div>
													<span class="btn btn-round btn-rose btn-file"> <span
														class="fileinput-new">Add Photo</span> <span
														class="fileinput-exists">Change</span> <form:input
															type="hidden" path="UserId" /> <form:input type="hidden"
															path="password" /> <form:input type="file"
															path="profileImage" name="profileImage" id="profileImage" /></span> <br>
													<a href="#pablo"
														class="btn btn-danger btn-round fileinput-exists"
														data-dismiss="fileinput"><i class="fa fa-times"></i>
														Remove</a>
												</div>
											 --%>
