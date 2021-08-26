package com.drivease.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.drivease.dao.UserDao;
import com.drivease.model.Area;
import com.drivease.model.City;
import com.drivease.model.Driver;
import com.drivease.model.State;
import com.drivease.model.User;
import com.drivease.model.Vehicle;
import com.drivease.model.VehicleType;
import com.drivease.service.AreaService;
import com.drivease.service.CityService;
import com.drivease.service.DriverService;
import com.drivease.service.StateService;
import com.drivease.service.UserService;
import com.drivease.service.VehicleService;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	UserService userservice;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	StateService stateservice;
	
	@Autowired
	CityService cityservice;
	
	@Autowired
	AreaService areaservice;
	
	@Autowired
	VehicleService vehicleservice;
	
	@Autowired
	DriverService driverservice;
	
	
	@RequestMapping("/home")
	public String home(ModelMap model) {
		List<Vehicle> vehicleList = vehicleservice.getRecentVehicles();
		List<Driver> driverList = driverservice.getRecentDrivers();
		model.addAttribute("vehicleList", vehicleList);
		model.addAttribute("driverList", driverList);
		return "userhomepage";
	}
	
	@RequestMapping("/registrationPage")
	public String registrationpage(Model model) {
		User user = new User();
		List<State> liststate=stateservice.getAll();
		model.addAttribute("liststate", liststate);
		List<City> listcity=cityservice.getAll();
		model.addAttribute("listcity", listcity);
		List<Area> listarea=areaservice.getAll();
		model.addAttribute("listarea", listarea);
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		return "registeruser";
	}
	
	@RequestMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user, BindingResult result, Model model,
			@RequestParam("profilePicture") MultipartFile file1) {
		long result1=userservice.saveUser(user, file1);
		if(result1==0)
		{
			model.addAttribute("error", "Try again!");
			return "redirect:/user/registratationPage";
		}
		 return "redirect:/user/home";
	}
	
	@RequestMapping("/editProfile")
	public String editProfile(Model model) {
		User user1 = (User) session.getAttribute("user");
		User user = userservice.getAllDetails(user1.getUserId()); 
		List<State> liststate=stateservice.getAll();
		model.addAttribute("liststate", liststate);
		List<City> listcity=cityservice.getAll();
		model.addAttribute("listcity", listcity);
		List<Area> listarea=areaservice.getAll();
		model.addAttribute("listarea", listarea);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		return "registeruser";
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") User user, BindingResult result, Model model,
			@RequestParam("profilePicture") MultipartFile file1) {
		long result1=userservice.updateUser(user, file1);
		if(result1==0)
		{
			model.addAttribute("error", "Try again!");
			return "redirect:/user/registratationPage";
		}
		 return "redirect:/user/home";
	}
	

}
