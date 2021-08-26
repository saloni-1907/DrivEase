package com.drivease.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.drivease.model.Area;
import com.drivease.model.City;
import com.drivease.model.State;
import com.drivease.service.AreaService;
import com.drivease.service.CityService;
import com.drivease.service.StateService;

@Controller
@RequestMapping("/area")
public class AreaController {
	
	@Autowired
	AreaService areaservice;
	
	@Autowired
	CityService cityservice;
	
	@Autowired
	StateService stateservice;

	
	
	@RequestMapping(value = "/getCities/{stateId}", method = RequestMethod.GET)
	public @ResponseBody List<City> getAllCitiesByState(@PathVariable("stateId") long stateId) {
	    return cityservice.getAllCitiesByStateId(stateId);
	}
	
	@RequestMapping(value = "/getAreas/{cityId}", method = RequestMethod.GET)
	public @ResponseBody List<Area> getAllAreasByCity(@PathVariable("cityId") long cityId) {
	    return areaservice.getAllAreasByCityId(cityId);
	}

}
