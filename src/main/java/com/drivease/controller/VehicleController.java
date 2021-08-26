package com.drivease.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.drivease.dao.VehicleDao;
import com.drivease.dao.UserDao;
import com.drivease.model.Area;
import com.drivease.model.Booking;
import com.drivease.model.City;
import com.drivease.model.Driver;
import com.drivease.model.LenderDriver;
import com.drivease.model.Vehicle;
import com.drivease.model.VehicleCompany;
import com.drivease.model.VehicleModel;
import com.drivease.model.License;
import com.drivease.model.Review;
import com.drivease.model.State;
import com.drivease.model.User;
import com.drivease.model.VehicleType;
import com.drivease.service.AreaService;
import com.drivease.service.BookingService;
import com.drivease.service.CityService;
import com.drivease.service.LenderDriverService;
import com.drivease.service.VehicleService;
import com.drivease.service.LicenseService;
import com.drivease.service.ReviewService;
import com.drivease.service.StateService;
import com.drivease.service.UserService;
import com.drivease.service.VehicleCompanyService;
import com.drivease.service.VehicleModelService;
import com.drivease.service.VehicleTypeService;
import com.drivease.serviceimpl.VehicleCompanyServiceImpl;



@Controller
@RequestMapping("/vehicle")
@SessionAttributes("user")
public class VehicleController {

	@Autowired
	VehicleService vehicleservice;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	LenderDriverService lenderdriverservice;
	
	@Autowired
	VehicleCompanyService companyservice;
	
	@Autowired
	VehicleModelService modelservice;
	
	@Autowired
	StateService stateservice;
	
	@Autowired
	CityService cityservice;
	
	@Autowired
	AreaService areaservice;
	
	@Autowired
	VehicleTypeService typeservice;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	BookingService bookingService;
	
	
	@RequestMapping("/addVehicle")
	public String vehicleRegistration(Model model) {
		Vehicle vehicle = new Vehicle();
		List<VehicleCompany> companylist=companyservice.getAll();
		List<VehicleModel> modellist=modelservice.getAll();
		model.addAttribute("companyList",companylist);
		model.addAttribute("modelList",modellist);
		List<State> liststate=stateservice.getAll();
		model.addAttribute("liststate", liststate);
		List<City> listcity=cityservice.getAll();
		model.addAttribute("listcity", listcity);
		List<Area> listarea=areaservice.getAll();
		model.addAttribute("listarea", listarea);
		model.addAttribute("vehicle", vehicle);
		model.addAttribute("edit", false);
		model.addAttribute("editDriver",false);
		return "useraddvehicle";
	}
	
	@RequestMapping("/saveVehicle")
	public String saveVehicle(@ModelAttribute("vehicle") Vehicle vehicle, BindingResult result, Model model,
			@RequestParam("vehiclePicture") MultipartFile file1) {
		
		LenderDriver driver = new LenderDriver();
		driver.setName(vehicle.getName());
		driver.setDob(vehicle.getDob());
		driver.setGender(vehicle.getGender());
		driver.setMobileNumber(vehicle.getMobileNumber());
		long result1=vehicleservice.saveVehicle(vehicle,file1);
		if(result1==0)
		{
			model.addAttribute("error", "This Vehicle Number is Already registered or something else went wrong.. Try Again!");
			return "redirect:/vehicle/addVehicle";
		}
		Vehicle v = vehicleservice.getById(result1);
		if(v.getWithDriver()==1)
		{
			driver.setVehicleId(v.getVehicleId());
			long result2 = lenderdriverservice.saveLenderDriver(driver);
			
			if(result2==0)
			{
				model.addAttribute("error", "Try again!");
				return "redirect:/vehicle/addVehicle";
			}
		}
		
		 return "redirect:/vehicle/manageMyVehicles";
	}
	
	
	@RequestMapping("/vehiclegrid")
	public ModelAndView vehicleGrid() {
		List<Vehicle> vehiclelist = vehicleservice.getAll();
		List<City> cityList = cityservice.getAll();
		List<VehicleType> vtList = typeservice.getAll();
		Vehicle vehicleFilter = new Vehicle();
		ModelAndView model = new ModelAndView();
		model.setViewName("uservehiclegrid");
		model.addObject("vehicleFilter", vehicleFilter);
		model.addObject("vtList",vtList);
		model.addObject("cityList", cityList);
		model.addObject("vehicleList",vehiclelist);
		return model;
	}
	
	@RequestMapping("/filterSearch")
	public String getpropertyFilter(@ModelAttribute("vehicleFilter") Vehicle vehicleFilter, ModelMap model) {
		List<Vehicle> vehiclelist = vehicleservice.getVehicleFilter(vehicleFilter);
		List<City> cityList = cityservice.getAll();
		//Driver driverFilter = new Driver();
		List<VehicleType> vtList = typeservice.getAll();
		model.addAttribute("vehicleFilter", vehicleFilter);
		model.addAttribute("vtList",vtList);
		model.addAttribute("cityList", cityList);
		model.addAttribute("vehicleList",vehiclelist);
		return "uservehiclegrid";
	}
	
	
	@RequestMapping("/allVehicles")
	public ModelAndView getAllVehicles()
	{
		List<Vehicle> vehiclelist = vehicleservice.getAll();
		ModelAndView model = new ModelAndView();
		model.setViewName("uservehiclegrid");
		model.addObject("vehicleList",vehiclelist);
		return model;
	}
	@RequestMapping("/manageMyVehicles")
	public ModelAndView manageMyVehicles()
	{
		List<Vehicle> vehiclelist = vehicleservice.getMyVehicles();
		for (Vehicle vehicle : vehiclelist) {
			int check = bookingService.isVehicleBooked(vehicle.getVehicleId());
			if(check>0)
			{
				vehicle.setStatus("Booked");
			}else {
				vehicle.setStatus("Available");
			}
		}
		ModelAndView model = new ModelAndView();
		model.setViewName("usermanagevehicles");
		model.addObject("vehicleList",vehiclelist);
		return model;
	}
	@RequestMapping("/editVehicle/{id}")
	public String editVehicle(@PathVariable long id,Model model) {
		
		Vehicle vehicle = vehicleservice.getAllDetails(id);
		List<VehicleCompany> companylist=companyservice.getAll();
		List<VehicleModel> modellist=modelservice.getAll();
		model.addAttribute("companyList",companylist);
		model.addAttribute("modelList",modellist);
		List<State> liststate=stateservice.getAll();
		model.addAttribute("liststate", liststate);
		List<City> listcity=cityservice.getAll();
		model.addAttribute("listcity", listcity);
		List<Area> listarea=areaservice.getAll();
		model.addAttribute("listarea", listarea);
		
		if(vehicle.getWithDriver()==1)
		{
			LenderDriver ld =lenderdriverservice.getByVehicleId(vehicle.getVehicleId());
			vehicle.setName(ld.getName());
			vehicle.setGender(ld.getGender());
			vehicle.setDob(ld.getDob());
			vehicle.setMobileNumber(ld.getMobileNumber());
			model.addAttribute("editDriver",true);
		}
		else {
			model.addAttribute("editDriver",false);
		}
		model.addAttribute("vehicle", vehicle);
		model.addAttribute("edit", true);
		return "useraddvehicle";
	}
	
	@RequestMapping("/updateVehicle")
	public String updateVehicle(@ModelAttribute("vehicle") Vehicle vehicle, BindingResult result, Model model,
			@RequestParam("vehiclePicture") MultipartFile file) {
		Vehicle newV=vehicleservice.updateVehicle(vehicle, file);
		if(newV==null) {
			model.addAttribute("error", "Try again!");
			return "redirect:/vehicle/addVehicle";
		}
		if(newV.getWithDriver()==1)
		{
			LenderDriver driver = lenderdriverservice.getByVehicleId(vehicle.getVehicleId());
			driver.setName(vehicle.getName());
			driver.setDob(vehicle.getDob());
			driver.setGender(vehicle.getGender());
			driver.setMobileNumber(vehicle.getMobileNumber());
			long res1 = lenderdriverservice.updateLenderDriver(driver);
			if(res1==0) {
				model.addAttribute("error", "Try again!");
				return "redirect:/vehicle/addVehicle";
			}	
		}
		return "redirect:/vehicle/manageMyVehicles";
	}
	
	
	@RequestMapping("/deleteVehicle/{id}")
	public String deleteVehicle(@PathVariable long id) {
		boolean result=vehicleservice.deleteVehicle(id);
		return "redirect:/vehicle/manageMyVehicles";
		
	}
	
	@RequestMapping("/viewVehicle/{id}")
	public String viewVehicle(@PathVariable long id,Model model) {
		Vehicle vehicle = vehicleservice.getAllDetails(id);
		if(vehicle.getWithDriver()==1)
		{
			LenderDriver ld =lenderdriverservice.getByVehicleId(vehicle.getVehicleId());
			vehicle.setName(ld.getName());
			vehicle.setGender(ld.getGender());
			vehicle.setDob(ld.getDob());
			vehicle.setMobileNumber(ld.getMobileNumber());
			model.addAttribute("driverPresent",true);
		}
		model.addAttribute("vehicle", vehicle);
		Booking booking = new Booking();
		model.addAttribute("booking", booking);
		Review review = new Review();
		model.addAttribute("review", review);
		List<Review> reviewList = reviewService.getReviewsByVehicleId(vehicle.getVehicleId());
		model.addAttribute("reviewList", reviewList);
		return "uservehiclesinglepage";
	}
	
	@RequestMapping("/datetimepicker")
	public String datetimepicker()
	{
		return "datetimepicker";
	}
	
	
}

