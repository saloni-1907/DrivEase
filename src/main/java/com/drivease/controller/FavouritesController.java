package com.drivease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/favorites")
public class FavouritesController {

	@RequestMapping("/myFavorites")
	public String header() {
		return "userfavorites";
	}

}
