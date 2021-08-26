package com.drivease.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.drivease.model.UserFeedback;

import com.drivease.service.UserFeedbackService;


@Controller
@RequestMapping("/feedback")
public class FeedbackController {


	@Autowired
	UserFeedbackService userfeedbackservice;
	
	
	@RequestMapping("/sendfeedback")
	public String sendfeedback(Model model)
	{
		
		UserFeedback feedback=new UserFeedback();
		model.addAttribute("feedback", feedback);
		model.addAttribute("edit",false);
		return "usercontactus";
	}
	@RequestMapping("/savefeedback")
	public String saveFeedback(@ModelAttribute("feedback") UserFeedback feedback)
	{
		
		userfeedbackservice.addFeedback(feedback);
		return "redirect:/feedback/sendfeedback";
	}
	
}
