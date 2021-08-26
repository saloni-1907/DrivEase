package com.drivease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tnc")
public class TCController {
	
	@RequestMapping("/viewtnc")
	public String aboutUs() {
		return "usert&c";
	}

}
