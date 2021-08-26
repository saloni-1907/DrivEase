package com.drivease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/history")
public class HistoryController {
	
	@RequestMapping("/viewhistory")
	public String aboutUs() {
		return "userbookinghistory";
	}
}
