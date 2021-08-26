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

import com.drivease.dao.DriverDao;
import com.drivease.dao.UserDao;
import com.drivease.model.Area;
import com.drivease.model.Booking;
import com.drivease.model.City;
import com.drivease.model.Driver;
import com.drivease.model.License;
import com.drivease.model.Review;
import com.drivease.model.State;
import com.drivease.model.User;
import com.drivease.model.VehicleType;
import com.drivease.service.AreaService;
import com.drivease.service.CityService;
import com.drivease.service.DriverService;
import com.drivease.service.LicenseService;
import com.drivease.service.ReviewService;
import com.drivease.service.StateService;
import com.drivease.service.UserService;
import com.drivease.service.VehicleTypeService;


@Controller
@RequestMapping("/driver")
@SessionAttributes("user")
public class DriverController {

	@Autowired
	DriverService driverservice;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UserService userservice;
	
	@Autowired
	VehicleTypeService typeservice;
	
	@Autowired
	LicenseService licenseservice;
	
	@Autowired
	CityService cityservice;
	
	@Autowired
	ReviewService reviewService;


	@RequestMapping("/registration")
	public String driverRegistration(Model model) {
		Driver driver = new Driver();
		List<VehicleType> typelist=typeservice.getAll();
		model.addAttribute("typeList", typelist);
		model.addAttribute("driver", driver);
		model.addAttribute("edit", false);
		return "userdriverregistration";
	}
	
	@RequestMapping("/saveDriver")
	public String saveDriver(@ModelAttribute("driver") Driver driver, BindingResult result, Model model,
			@RequestParam("licensePicture") MultipartFile file1) {
		License license = new License();
		license.setLicenseNo(driver.getLicenseNo());
		license.setDateOfIssue(driver.getDateOfIssue());
		license.setDateOfExpiry(driver.getDateOfExpiry());
		long result2=licenseservice.saveLicense(license,file1);
		if(result2==0)
		{
			model.addAttribute("error", "This Licence Number is Already registered or something else went wrong.. Try Again!");
			return "redirect:/driver/registration";
		}
		driver.setLicenseId(result2);
		long result1=driverservice.saveDriver(driver);

		if(result1==0)
		{
			model.addAttribute("error", "Something went wrong..Try again!");
			return "redirect:/driver/registration";
		}
		 return "redirect:/driver/myAccount";
	}
	
	
	@RequestMapping("/drivergrid")
	public ModelAndView showDriver() {
		List<Driver> driverlist = driverservice.getAll();
		List<City> cityList = cityservice.getAll();
		Driver driverFilter = new Driver();
		List<VehicleType> vtList = typeservice.getAll();
		ModelAndView model = new ModelAndView();
		model.setViewName("userdrivergrid");
		model.addObject("driverFilter", driverFilter);
		model.addObject("vtList",vtList);
		model.addObject("cityList", cityList);
		model.addObject("driverList",driverlist);
		return model;
	}
	
	@RequestMapping("/filterSearch")
	public String getpropertyFilter(@ModelAttribute("driverFilter") Driver driverFilter, ModelMap model) {
		List<Driver> driverlist = driverservice.getDriverFilter(driverFilter);
		List<City> cityList = cityservice.getAll();
		//Driver driverFilter = new Driver();
		List<VehicleType> vtList = typeservice.getAll();
		model.addAttribute("driverFilter", driverFilter);
		model.addAttribute("vtList",vtList);
		model.addAttribute("cityList", cityList);
		model.addAttribute("driverList",driverlist);
		return "userdrivergrid";
	}
	
	
	@RequestMapping("/myAccount")
	public String manageAccount(Model model) {
		User user = (User)session.getAttribute("user");
		Driver driver1 = driverservice.getDriverByUserId(user.getUserId());
		Driver driver = driverservice.getAllDetails(driver1.getDriverId());
		User user1 = userservice.getAllDetails(driver.getUserId());
		model.addAttribute("driverUser", user1);
		model.addAttribute("driver", driver);
		model.addAttribute("edit", false);
		return "userdriveraccount";
	}
	
	@RequestMapping("/editDetails")
	public String editDriverDetails(Model model) {
		User user = (User)session.getAttribute("user");
		Driver driver1 = driverservice.getDriverByUserId(user.getUserId());
		Driver driver = driverservice.getAllDetails(driver1.getDriverId());
		List<VehicleType> typelist=typeservice.getAll();
		model.addAttribute("typeList", typelist);
		model.addAttribute("driver", driver);
		model.addAttribute("edit", true);
		return "userdriverregistration";
	}
	
	@RequestMapping("/updateDriver")
	public String updateDriver(@ModelAttribute("driver") Driver driver, BindingResult result, Model model,
			@RequestParam("licensePicture") MultipartFile file1) {
		License license = licenseservice.getLicenseByDriverId(driver.getLicenseId());
		license.setLicenseNo(driver.getLicenseNo());
		license.setDateOfIssue(driver.getDateOfIssue());
		license.setDateOfExpiry(driver.getDateOfExpiry());
		long result2=licenseservice.updateLicense(license,file1);
		if(result2==0)
		{
			model.addAttribute("error", "Something went wrong.. Try Again!");
			return "redirect:/driver/registration";
		}
		//driver.setLicenseId(result2);
		long result1=driverservice.updateDriver(driver);

		if(result1==0)
		{
			model.addAttribute("error", "Something went wrong..Try again!");
			return "redirect:/driver/registration";
		}
		 return "redirect:/driver/myAccount";
	}
	
	@RequestMapping("/viewDriver/{id}")
	public String viewDriver(@PathVariable long id,Model model) {
		Driver driver = driverservice.getAllDetails(id);
		User user = userservice.getAllDetails(driver.getUserId());
		model.addAttribute("driverUser", user);
		model.addAttribute("driver", driver);
		Booking booking = new Booking();
		model.addAttribute("booking", booking);
		Review review = new Review();
		model.addAttribute("review", review);
		List<Review> reviewList = reviewService.getReviewsByDriverId(driver.getDriverId());
		model.addAttribute("reviewList", reviewList);
		return "userdriversinglepage";
	}
	
	@RequestMapping("/allDrivers")
	public ModelAndView getAllDrivers()
	{
		List<Driver> driverlist = driverservice.getAll();
		ModelAndView model = new ModelAndView();
		model.setViewName("userdrivergrid");
		model.addObject("driverList",driverlist);
		return model;
	}
	
	@RequestMapping("/deactivateAccount")
	public String deactivateDriver(Model model) {
		User user = (User)session.getAttribute("user");
		Driver driver1 = driverservice.getDriverByUserId(user.getUserId());
		boolean result=driverservice.deactivateDriver(driver1.getDriverId());
		return "redirect:/user/home";
	}
	
	
}
