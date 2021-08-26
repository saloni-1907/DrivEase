package com.drivease.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.model.Booking;
import com.drivease.model.Review;
import com.drivease.service.BookingService;
import com.drivease.service.DriverService;
import com.drivease.service.ReviewService;
import com.drivease.service.UserService;
import com.drivease.service.VehicleService;

@Controller
@RequestMapping("/review")
@SessionAttributes("user")
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	VehicleService vehicleservice;
	
	@Autowired
	UserService userservice;
	
	@Autowired
	DriverService driverservice;
	
	@RequestMapping("/addReview/{reviewFor}/{id}")
	public String reviewVehicle(@PathVariable("id") long id,@PathVariable("reviewFor") String reviewFor,@ModelAttribute("review") Review review,BindingResult result,Model model)
	{
		long result1=reviewService.addReview(review,reviewFor,id);
		if(result1==0)
		{
			model.addAttribute("reviewError", "Something went wrong..Try again!");
		}
		if("Vehicle".equalsIgnoreCase(reviewFor)) 
			return "redirect:/vehicle/viewVehicle/"+id;
		else
			return "redirect:/driver/viewDriver/"+id;

	}
	

}
