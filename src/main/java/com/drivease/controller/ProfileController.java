package com.drivease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@RequestMapping("/myprofile")
	public String header() {
		return "usereditprofile";
	}
}
