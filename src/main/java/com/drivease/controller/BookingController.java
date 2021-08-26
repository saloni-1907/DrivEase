package com.drivease.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.BookingDao;
import com.drivease.dao.VehicleDao;
import com.drivease.model.Booking;
import com.drivease.model.Driver;
import com.drivease.model.User;
import com.drivease.model.Vehicle;
import com.drivease.service.BookingService;
import com.drivease.service.DriverService;
import com.drivease.service.UserService;
import com.drivease.service.VehicleService;

@Controller
@RequestMapping("/booking")
@SessionAttributes("user")

public class BookingController {
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	VehicleService vehicleservice;
	
	@Autowired
	UserService userservice;
	
	@Autowired
	DriverService driverservice;

	@RequestMapping("/bookVehicle/{id}")
	public String bookingVehicle(@PathVariable("id") long id,@ModelAttribute("booking") Booking booking,BindingResult result,Model model)
	{
		int check = bookingService.checkVehicleBooking(booking,id);
		if(check > 0) {
			model.addAttribute("error", "This vehicle is already booked between this time period..!");
			return "redirect:/vehicle/viewVehicle/"+id;
		}
		long result1=bookingService.addBooking(booking);
		if(result1==0)
		{
			model.addAttribute("error", "Something went wrong..Try again!");
			return "redirect:/vehicle/viewVehicle/"+id;
		}
		long result2 = bookingService.bookVehicle(result1,id);
		if(result2==0)
		{
			model.addAttribute("error", "Something went wrong..Try again!");
			return "redirect:/vehicle/viewVehicle/"+id;
		}
		
		return "redirect:/booking/myBookings";
		
	}
	
	@RequestMapping("/bookDriver/{id}")
	public String bookingDriver(@PathVariable("id") long id,@ModelAttribute("booking") Booking booking,BindingResult result,Model model)
	{
		int check = bookingService.checkDriverBooking(booking,id);
		if(check > 0) {
			model.addAttribute("booking", booking);
			model.addAttribute("error", "This driver is already booked between this time period..!");
			return "redirect:/driver/viewDriver/"+id;
		}
		
		long result1=bookingService.addBooking(booking);
		if(result1==0)
		{
			model.addAttribute("error", "Something went wrong..Try again!");
			return "redirect:/driver/viewDriver/"+id;
		}
		long result2 = bookingService.bookDriver(result1,id);
		if(result2==0)
		{
			model.addAttribute("error", "Something went wrong..Try again!");
			return "redirect:/driver/viewDriver/"+id;
		}
		
		return "redirect:/booking/myBookings";
		
	}
	
	
	@RequestMapping("/myBookings")
	public String myBookinglist(Model model) {
		List<Booking> vehiclelist=bookingService.getMyVehicleBookings();
		for (Booking booking : vehiclelist) {
			Vehicle v = vehicleservice.getAllDetails(booking.getVehicleId());
			booking.setVehicleNo(v.getVehicleNumber());
			booking.setVehicleName(v.getCompanyName()+" "+v.getModelName());
			booking.setVehiclePicture(v.getVehiclePicture());
			booking.setLenderName(v.getLenderName());
			booking.setLenderEmail(v.getLenderEmail());
			booking.setLenderMobile(v.getLenderMobile());
		}
		if(vehiclelist.size()>0)
		{
			model.addAttribute("vehicle", true);
			model.addAttribute("vehicleList",vehiclelist);
		}
		List<Booking> driverlist=bookingService.getMyDriverBookings();
		for (Booking booking : driverlist) {
			Driver d = driverservice.getAllDetails(booking.getDriverId());
			booking.setDriverVehicleType(d.getVehicleTypeName());
			User driver = userservice.getAllDetails(d.getUserId());
			booking.setDriverName(driver.getFname()+" "+driver.getLname());
			booking.setDriverEmail(driver.getEmailId());
			booking.setDriverMobile(driver.getMobileNo());
			booking.setDriverPicture(driver.getProfilePicture());
		}
		if(driverlist.size()>0)
		{
			model.addAttribute("driver", true);
			model.addAttribute("driverList",driverlist);
		}
		return "userbookinglist";
	}
	
	@RequestMapping("/myVehicleRequests")
	public String myVehicleRequestlist(Model model) {
		List<Booking> vehiclelist=bookingService.getMyVehicleRequests();
		for (Booking booking : vehiclelist) {
			User br = userservice.getAllDetails(booking.getUserId());
			booking.setUserName(br.getFname()+" "+br.getLname());
			booking.setUserEmail(br.getEmailId());
			booking.setUserMobile(br.getMobileNo());
			Vehicle v = vehicleservice.getAllDetails(booking.getVehicleId());
			booking.setVehicleNo(v.getVehicleNumber());
			booking.setVehicleName(v.getCompanyName()+" "+v.getModelName());
			booking.setVehiclePicture(v.getVehiclePicture());
		}
		model.addAttribute("vehicleList",vehiclelist);
		return "uservehiclerequests";
	}
	
	@RequestMapping("/myDriverRequests")
	public String myRequestlist(Model model) {
		List<Booking> driverlist=bookingService.getMyDriverRequests();
		for (Booking booking : driverlist) {
			User br = userservice.getAllDetails(booking.getUserId());
			booking.setUserName(br.getFname()+" "+br.getLname());
			booking.setUserEmail(br.getEmailId());
			booking.setUserMobile(br.getMobileNo());
		}
		model.addAttribute("driverList",driverlist);
		return "userdriverrequests";
	}
	
	@RequestMapping("/bookingStatus/{bid}/{status}/{bookingfor}")
	public String bookingStatus(@PathVariable long bid, @PathVariable String status,@PathVariable String bookingfor,Model model) {
		long result = bookingService.updateBookingStatus(bid, status,bookingfor);
		if(result==0)
		{
			model.addAttribute("error", "Something went wrong..Try again!");
			return "redirect:/booking/myRequests";
		}
		if("Vehicle".equalsIgnoreCase(bookingfor))
			return "redirect:/booking/myVehicleRequests";
		else
			return "redirect:/booking/myDriverRequests";
	}
	
}
