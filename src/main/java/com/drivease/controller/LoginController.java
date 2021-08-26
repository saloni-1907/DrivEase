package com.drivease.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.model.User;
import com.drivease.service.LoginService;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")

public class LoginController {
	
	@Autowired
	LoginService loginservice;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/login")
	public String login()
	{
		return "userlogin";
	}
	
	@RequestMapping("/loggingIn")
	public String login(@ModelAttribute("log") User user,Model model)
	{
		User newUser=loginservice.login(user);
		if(newUser==null)
		{
			model.addAttribute("errorMsg", "Wrong Username or Password...!!!");
			return "redirect:/user/login";
		}
		model.addAttribute("user",newUser);
		return "redirect:/user/home";
	}
	
	@RequestMapping("/forgotPassword")
	public String forgotpassword() {
		return "userforgotpassword";
	}

	
	@RequestMapping("/changepass1")
	public String changepass1(@ModelAttribute("password") User user, Model model) {
		User newUser = loginservice.forgotPassword(user);
		if (newUser == null) {
			model.addAttribute("errorMsg", "This email Id is not registered...!!!");
			return "redirect:/user/forgotPassword";
		}
		model.addAttribute("user", newUser);
		model.addAttribute("registration", false);
		return "redirect:/user/enterOtp";
	}
	
	@RequestMapping("/enterOtp")
	public String changepassword() {
	
		return "userotp";
	}
	
	@RequestMapping("/checkOtp")
	public String changepass2(@ModelAttribute("cpass") User user, Model model) {
		int result = loginservice.checkOTP(user);
		if (result == 1) {
			model.addAttribute("errorMsg", "Please enter correct otp...!!!");
			return "redirect:/user/enterOtp";
		}
		//model.addAttribute("User", newUser);
		//model.addAttribute("registration", false);
		return "redirect:/user/newPassword";
	}
	
	@RequestMapping("/newPassword")
	public String newpassword(Model model) {
		model.addAttribute("changePassword", false);	
		return "userchangepassword";
	}
	
	@RequestMapping("/newpass")
	public String newpassword(@ModelAttribute("npass") User user, Model model) {
		//User sUser = (User) session.getAttribute("user");
		User newUser = loginservice.newPassword(user);
		if (newUser == null) {
			model.addAttribute("errorMsg", "Password & confirm password are not same...!!!");
			return "redirect:/user/newPassword";
		}
		model.addAttribute("User", newUser);
		return "redirect:/user/login";
	}
	
	@RequestMapping("/changePassword")
	public String change(Model model) {
		model.addAttribute("cpass", new User());
		model.addAttribute("changePassword", true);
		return "userchangepassword";
	}

	@RequestMapping("/change")
	public String changePass(@ModelAttribute("cpass") User user, Model model) {
		int result = loginservice.changePass(user);
		if (result != 0) {
			if(result==1)
				model.addAttribute("errorMsg", "Old Password does not match...!!!");
			else if(result==2)
				model.addAttribute("errorMsg", "New Password and confirm password does not match...!!!");
			else if(result==3)
				model.addAttribute("errorMsg", "Old Password and new passwords are same...!!!");
			else
				model.addAttribute("errorMsg", "Something went wrong..Try again!!!");
			return "redirect:/user/changePassword";
		}
		User usr = (User) session.getAttribute("user");
		model.addAttribute("user",usr);
		return "redirect:/user/home";
	}

	

	
	

}
