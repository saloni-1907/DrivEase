<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/property-grid-sidebar-left.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:22 GMT -->
<head>
<!-- Required meta tags -->
<%@include file="head.jsp"%>
<title>Motorbike master</title>
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
       <%@include file="userheader.jsp" %>
        <!--	Banner
		===============================================================-->
        <div class="bg-gray full-row py-5 page-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h3 class="page-name float-left text-secondary mt-1 mb-0">Cars</h3>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!--	Property Grid
		===============================================================-->
        <div class="full-row">
            <div class="container">
            
                <div class="row">
                
                    <div class="col-lg-4">
                        <div class="sidebar-widget">
                            <h4 class="double-down-line-left text-secondary position-relative pb-4 mb-4">Advance Search</h4>
                            <form method="post" action="http://unicoderbd.com/theme/html//userdrivease/resources/homex/action-page-post.html">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <select class="form-control bg-gray">
                                                <option>Vehicle Type</option>
                                                <option>Scooters</option>
                                                <option>Bikes</option>
                                                <option>Cars</option>
                                            </select>
                                        </div>
                                    </div>
                                   <!-- <div class="col-md-12">
                                        <div class="form-group">
                                            <select class="form-control bg-gray">
                                                <option>Any Type</option>
                                                <option>Appartment</option>
                                                <option>Condose</option>
                                                <option>Land</option>
                                                <option>Commercial</option>
                                                <option>Villah</option>
                                            </select>
                                        </div>
                                    </div> --> 
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <select class="form-control bg-gray">
                                                <option>City</option>
                                                <option>Ahmedabad</option>
                                                <option>Gandhinagar</option>
                                                <option>Baroda</option>
                                                
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <select class="form-control bg-gray">
                                                <option>Location</option>
                                                <option>Ambawadi</option>
                                                <option>Navrangpura</option>
                                                <option>Naranpura</option>
                                                <option>Vasna</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- <div class="col-md-12">
                                        <div class="form-group">
                                            <select class="form-control bg-gray">
                                                <option>All City</option>
                                                <option>USA</option>
                                                <option>Australia</option>
                                                <option>Russia</option>
                                                <option>France</option>
                                            </select>
                                        </div>
                                    </div> -->
                                    <!-- <div class="col-md-6">
                                        <div class="form-group">
                                            <select class="form-control bg-gray">
                                                <option>Beds</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>6</option>
                                            </select>
                                        </div>
                                    </div> -->
                                    <!-- <div class="col-md-6">
                                        <div class="form-group">
                                            <select class="form-control bg-gray">
                                                <option>Baths</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>4</option>
                                                <option>4</option>
                                            </select>
                                        </div>
                                    </div> -->
                                    <div class="col-md-12">
                                        <div class="py-4 mb-5">
                                            <label>Rent Per Hour :</label>
                                            <div class="price-range font-12 text-ordinary">
                                                <div class="price-filter"> <span class="price-slider">
                                                    <input class="filter-price" type="text" name="price" value="50;500" />
                                                    </span> </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="py-4 mb-5">
                                            <label>Rent Per Day :</label>
                                            <div class="layout-slider font-12 text-ordinary"> <span>
                                                <input id="Slider1" type="text" name="price" value="300; 1000" />
                                                </span> </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="d-inline-block text-ordinary hover-text-primary formicon mt-4"> <a class="checkbox-collapse" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Additional Features</a> </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="collapse" id="multiCollapseExample1">
                                                    <div class="card card-body px-0 border-0">
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <ul class="check-submit">
                                                                    <li>
                                                                        <input id="feature-1" class="d-none" type="checkbox">
                                                                        <label for="feature-1">Parking Garage</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-2" class="d-none" type="checkbox">
                                                                        <label for="feature-2">Security System</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-3" class="d-none" type="checkbox">
                                                                        <label for="feature-3">Cover Window</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-4" class="d-none" type="checkbox">
                                                                        <label for="feature-4">Swiming Pool</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-5" class="d-none" type="checkbox">
                                                                        <label for="feature-5">Air Condition</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-8" class="d-none" type="checkbox">
                                                                        <label for="feature-8">Fire Protection</label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <ul class="check-submit">
                                                                    <li>
                                                                        <input id="feature-9" class="d-none" type="checkbox">
                                                                        <label for="feature-9">Garden</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-10" class="d-none" type="checkbox">
                                                                        <label for="feature-10">Fire Place</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-11" class="d-none" type="checkbox">
                                                                        <label for="feature-11">Emeargency Exit</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-12" class="d-none" type="checkbox">
                                                                        <label for="feature-12">Home Theater</label>
                                                                    </li>
                                                                    <li>
                                                                        <input id="feature-13" class="d-none" type="checkbox">
                                                                        <label for="feature-13">Gym & Sports</label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <div class="form-group">
                                                                    <button type="submit" class="btn btn-primary mt-4">Search</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    <div class="col-md-12">
                                        <div class="form-group mt-4">
                                            <button type="submit" class="btn btn-primary w-100">Search Vehicle</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        
                        <div class="sidebar-widget mt-5">
                           <!-- <h4 class="double-down-line-left text-secondary position-relative pb-4 mb-4">Recent Property</h4>
                            <ul class="property_list_widget">
                                <li> <img src="/userdrivease/resources/homex/images/thumbnaillist/01.jpg" alt="">
                                    <h6 class="text-secondary hover-text-primary"><a href="property-single-1.html">Nirala Appartment</a></h6>
                                    <span class="font-14"><i class="fas fa-map-marker-alt icon-primary icon-small"></i> Avenue South Burlington, Los Angles</span>
                                    <div class="mt-2 d-flex"> <span class="text-primary h6">$1280 <sub>/ Mo</sub></span> <span class="mx-2">|</span> <span class="text-secondary">Housing</span> </div>
                                </li>
                                <li> <img src="/userdrivease/resources/homex/images/thumbnaillist/02.jpg" alt="">
                                    <h6 class="text-secondary hover-text-primary"><a href="property-single-1.html">New Luxury Condos</a></h6>
                                    <span class="font-14"><i class="fas fa-map-marker-alt icon-primary icon-small"></i> Avenue South Burlington, Los Angles</span>
                                    <div class="mt-2 d-flex"> <span class="text-primary h6">$1280 <sub>/ Mo</sub></span> <span class="mx-2">|</span> <span class="text-secondary">Housing</span> </div>
                                </li>
                                <li> <img src="/userdrivease/resources/homex/images/thumbnaillist/03.jpg" alt="">
                                    <h6 class="text-secondary hover-text-primary"><a href="property-single-1.html">Zarafaloz Appartment</a></h6>
                                    <span class="font-14"><i class="fas fa-map-marker-alt icon-primary icon-small"></i> Avenue South Burlington, Los Angles</span>
                                    <div class="mt-2 d-flex"> <span class="text-primary h6">$1280 <sub>/ Mo</sub></span> <span class="mx-2">|</span> <span class="text-secondary">Housing</span> </div>
                                </li>
                                <li> <img src="/userdrivease/resources/homex/images/thumbnaillist/04.jpg" alt="">
                                    <h6 class="text-secondary hover-text-primary"><a href="property-single-1.html">Monopuly Trade Center</a></h6>
                                    <span class="font-14"><i class="fas fa-map-marker-alt icon-primary icon-small"></i> Avenue South Burlington, Los Angles</span>
                                    <div class="mt-2 d-flex"> <span class="text-primary h6">$1280 <sub>/ Mo</sub></span> <span class="mx-2">|</span> <span class="text-secondary">Housing</span> </div>
                                </li>
                            </ul> --> 
                        </div>
                    </div>
                    
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="pb-4 mt-md-50">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/01.jpg" alt="">
                                        <div class="featured bg-primary text-white">New</div>
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$352,000 <span class="text-white">$1200/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Nirala Appartment</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/02.jpg" alt="">
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$212,000 <span class="text-white">$1200/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Apolo Family Appartment</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/03.jpg" alt="">
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$52,000 <span class="text-white">$1200/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Office Floor In Trade Center</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/04.jpg" alt="">
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$172,000 <span class="text-white">$170/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Himalia Luxury Condos</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/05.jpg" alt="">
                                        <div class="featured bg-primary text-white">10% Sals</div>
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$386,000 <span class="text-white">Fixed Amount</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Gulfishan 2 Story Building</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/06.jpg" alt="">
                                        <div class="featured bg-primary text-white">New</div>
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$582,000 <span class="text-white">$2430/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Office Floor In Trade Center</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/01.jpg" alt="">
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$582,000 <span class="text-white">$2430/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Office Floor In Trade Center</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/02.jpg" alt="">
                                        <div class="featured bg-primary text-white">Featured</div>
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$582,000 <span class="text-white">$2430/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Office Floor In Trade Center</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/03.jpg" alt="">
                                        <div class="featured bg-primary text-white">Featured</div>
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$582,000 <span class="text-white">$2430/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Office Floor In Trade Center</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/04.jpg" alt="">
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$582,000 <span class="text-white">$2430/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Office Floor In Trade Center</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/05.jpg" alt="">
                                        <div class="featured bg-primary text-white">Featured</div>
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$582,000 <span class="text-white">$2430/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Office Floor In Trade Center</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="featured-thumb hover-zoomer mb-4">
                                    <div class="overlay-black overflow-hidden position-relative"> <img src="/userdrivease/resources/homex/images/thumbnail/06.jpg" alt="">
                                        <div class="sale bg-secondary text-white">For Sale</div>
                                        <div class="price text-primary">$582,000 <span class="text-white">$2430/Sqft</span></div>
                                        <div class="starmark text-white"><i class="far fa-star"></i></div>
                                    </div>
                                    <div class="featured-thumb-data shadow-one">
                                        <div class="p-4">
                                            <h5 class="text-secondary hover-text-primary mb-2"><a href="#">Office Floor In Trade Center</a></h5>
                                            <span class="location"><i class="fas fa-map-marker-alt text-primary"></i> Avenue South Burlington, Los Angles</span> </div>
                                        <div class="px-4 pb-4 d-inline-block w-100">
                                            <div class="float-left"><i class="fas fa-user text-primary mr-1"></i> Jeson Billiam</div>
                                            <div class="float-right"><i class="far fa-calendar-alt text-primary mr-1"></i> 6 Months Ago</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center mt-4">
                                        <li class="page-item disabled"> <span class="page-link">Previous</span> </li>
                                        <li class="page-item active" aria-current="page"> <span class="page-link"> 1 <span class="sr-only">(current)</span> </span> </li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">...</li>
                                        <li class="page-item"><a class="page-link" href="#">45</a></li>
                                        <li class="page-item"> <a class="page-link" href="#">Next</a> </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <%@include file="userfooter.jsp" %>      
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
    </div>
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
<script src="/userdrivease/resources/homex/js/wow.js"></script> 
<script src="/userdrivease/resources/homex/js/YouTubePopUp.jquery.js"></script> 
<script src="/userdrivease/resources/homex/js/validate.js"></script> 
<script src="/userdrivease/resources/homex/js/jquery.cookie.js"></script> 
<script src="/userdrivease/resources/homex/js/custom.js"></script>
</body>

<!-- Mirrored from unicoderbd.com/theme/html//userdrivease/resources/homex/property-grid-sidebar-left.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 09 Feb 2020 08:35:22 GMT -->
</html>