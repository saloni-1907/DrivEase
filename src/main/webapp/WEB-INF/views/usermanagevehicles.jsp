<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.drivease.model.Vehicle"%>
    <!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/dashboard-listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:20 GMT -->
<head>
<!-- Required meta tags -->
<%@include file="head.jsp"%>
</head>
<body>

<%@include file="userheader.jsp" %>
<div id="page-wrapper">
 <div class="bg-gray full-row py-5 page-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h3 class="page-name float-left text-secondary mt-1 mb-0">Manage Your Vehicles</h3>
                         
                    </div>
                    
                </div>
                
            </div>
            <a href="/userdrivease/vehicle/addVehicle" class="btn btn-primary mr-1 mb-1" style="float:right;">View Vehicle Requests</a>
            <a href="/userdrivease/vehicle/addVehicle" class="btn btn-primary mr-1 mb-1" style="float:right;">Add New Vehicle</a>

        </div>
      
    <div class="row">
        
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-xl-12">
                        <div class="row">
                            
                                <table class="w-100 items-list bg-transparent">
                                    <thead>
                                        <tr class="bg-white">
                                            <th>Vehicles</th>
                                            <th>Rent</th>
                                            <th>Current Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="vl" items="${vehicleList}">
                                       
                                        
                                        <tr>
                                            <td><img src="/userdrivease/resources/images/vehiclePicture/${vl.vehiclePicture}" width="40" height="140" alt="">
                                                <div class="property-info d-table">
                                                    <h5 class="text-secondary">${vl.companyName} ${vl.modelName} <c:out value="${vl.vehicleNumber}" /></h5>
                                                    <span class="font-14"><i class="fas fa-map-marker-alt text-primary font-13"></i> <c:out value="${vl.pickUpAdd}" /></span>
                                                    <div class="price mt-3"> <span class="text-primary"></span> <span></span> </div>
                                                </div></td>
                                           
                                            <td>Rs. <c:out value="${vl.hourlyRent}" /> / Hour And Rs.<c:out value="${vl.dailyRent}" />/ Day</td>
                                            <td><c:out value="${vl.status}" /></td>
                                            <c:if test = "${vl.status == 'Available'}">
                                            <td><a href="/userdrivease/vehicle/editVehicle/<c:out value="${vl.vehicleId}" />" class="btn btn-primary mr-1 mb-1">Edit</a>
                                             <a href="/userdrivease/vehicle/deleteVehicle/<c:out value="${vl.vehicleId}" />"class="btn btn-primary mb-1">Delete</a>
                                             <a href="/userdrivease/vehicle/viewVehicle/<c:out value="${vl.vehicleId}" />"class="btn btn-primary mb-1">View Vehicle</a></td>
                                       		</c:if>
                                       		<c:if test = "${vl.status == 'Booked'}">
                                            <td><button disabled="disabled"  class="btn btn-primary mr-1 mb-1">Edit</button>
                                             <button disabled="disabled" class="btn btn-primary mb-1">Delete</button>
                                             <br>You cannot edit or delete vehicle while it is booked..</td>
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