package com.drivease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages")
public class AboutUsController {

	@RequestMapping("/aboutus")
	public String aboutUs() {
		return "useraboutus";
	}
	

}
