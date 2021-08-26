<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.drivease.model.User"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/index-6.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:33:47 GMT -->
<head>

<title>Drivease</title>

</head>
<body>

	<div id="page-wrapper">

		<%@include file="userheader.jsp"%>
		<center>
			<label style="color: #17C788; font-size: 25px;">Hi,<%
				User user = (User) session.getAttribute("user");
			%> <%
 	out.println(user.getFname());
 %> <%
 	out.print(user.getLname());
 %> <b class="caret"></b>!
			</label>
		</center>
		<div class="full-row py-5 bg-gray">
			<div>
				<center>
					<h2 style="display: inline-block;">
						Search for:
						</h1>
				</center>
			</div>

			<center>
				<input type="radio" name="search1" value="vehicle" id="vehicle">Vehicle&ensp;&ensp;
				<input type="radio" name="search1" value="driver" id="driver">Driver
			</center>

			<div class="container">
				<%-- <form:form class="font-12 formicon text-ordinary" name="searchvehicleform" method="post"  onsubmit="return validate()">
                    <div class="row">
                      <div class="container">
   						 
   						     <div class='col-sm-12'>
       						     <div class="form-group" style="float:left;">
        					        <div class='input-group date' id='datetimepicker1'  >
        					      
        				        	<label style="font-size:15px;font-weight:bold;margin-top:25px;display:block;">Start date and time:&ensp; <input type='datetime-local' class="form-control" name="start" id="start" path="startdatetime"/></label>
									
									</div> 
								 </div> 
							</div>
							  <div>
								<div class="form-group" style="float:left;margin-left:100px;">
									 <div class='input-group date' id='datetimepicker2' >                  	            
                    	             <label style="font-size:15px;font-weight:bold;margin-top:25px;">End date and time:&ensp;<span id="end-error" style="color:red;"></span><input type='datetime-local' class="form-control" name="end" id="end" path="enddatetime"/></label>
               					
               						</div> 
               						
           						 </div>
       						 </div>  
       						  <div class="col-md-4 col-lg-3" style="float:right;margin-top:52px;display:block;">
                            	<div class="form-group" >
                                	<button type="submit" class="btn btn-primary w-100">Search Vehicle</button>
                            	</div>
                        	</div> 
       						 
  					  	</div>
						</div>     
                
                </form:form> --%>
			</div>


		</div>

	</div>

	
	<!--	Recent Vehicles
        =======================================================-->
	<div class="full-row">
		<div class="container">
			<div class="row">
			
				<div class="col-lg-12">
				<h1 class="text-secondary double-down-line text-center">Recent
						Vehicles</h1>
				<div style="float:right;margin-right:10px;margin-top:15px;">
				<a class="btn btn-primary mt-5 d-table mx-auto" href="/userdrivease/vehicle/vehiclegrid" >More Vehicles</a> </div>
				</div>
		
				
		
			
			</div>
			<br>
			<div class="row">
				<c:forEach var="v" items="${vehicleList}">
					<a href="/userdrivease/vehicle/viewVehicle/${v.vehicleId}">
						<div class="col-md-6 col-lg-4">
							<div class="featured-thumb hover-zoomer mb-4">
								<div class="overlay-black overflow-hidden position-relative">
									<img
										src="/userdrivease/resources/images/vehiclePicture/${v.vehiclePicture}"
										height="300" alt="">
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
			<br>
			<div class="row">
				<div class="col-lg-12">
				<h1 class="text-secondary double-down-line text-center">Recent
						Drivers</h1>
				<div style="float:right;margin-right:10px;margin-bottom:10px;">
				<a class="btn btn-primary mt-5 d-table mx-auto" href="/userdrivease/driver/drivergrid" >More drivers</a> </div>
				</div>
				
			</div>
			<div class="row">
				<c:forEach var="d" items="${driverList}">
					<a href="/userdrivease/driver/viewDriver/${d.driverId}">
						<div class="col-md-6 col-lg-4">
							<div class="featured-thumb hover-zoomer mb-4">
								<div class="overlay-black overflow-hidden position-relative">
									<img
										src="/userdrivease/resources/images/profilePicture/${d.profilePicture}" height="300" 
										alt="">
									<div class="sale bg-secondary text-white">${d.status}</div>
									<div class="price text-primary">
										Rs.${d.hourlyRent}/Hour <br>Rs.${d.dailyRent}/Day
									</div>
								</div>
								<div class="featured-thumb-data shadow-one">
									<div class="p-4">
										<h5 class="text-secondary hover-text-primary mb-2">
											<a href="#">${d.driverName}</a>
										</h5>
										<span class="location"><b>Preferable Vehicle Type</b><br>
											Type:${d.vehicleTypeName}</span>
									</div>

								</div>
							</div>

						</div>
					</a>
				</c:forEach>

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
	<script src="/userdrivease/resources/homex/js/wow.js"></script>
	<script src="/userdrivease/resources/homex/js/YouTubePopUp.jquery.js"></script>
	<script src="/userdrivease/resources/homex/js/validate.js"></script>
	<script src="/userdrivease/resources/homex/js/jquery.cookie.js"></script>
	<script src="/userdrivease/resources/homex/js/custom.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#datetimepicker1').datetimepicker();
		});
	</script>

	<script>
		function validate() {
			var submit = true;
			var start = document.searchvehicleform.start.value;
			var end = document.searchvehicleform.end.value;

			if (start == "" || start == null) {
				document.getElementById("start-error").innerHTML = "Please select start date and time!";
				submit = false;
			}
			if (end == "" || end == null) {
				document.getElementById("end-error").innerHTML = "Please select end date and time!";
				submit = false;
			}

			return submit;
		}
	</script>
</body>

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/index-6.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:34:26 GMT -->
</html>