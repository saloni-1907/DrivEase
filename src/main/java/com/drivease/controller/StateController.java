package com.drivease.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.drivease.model.State;
import com.drivease.service.StateService;


@Controller
@RequestMapping("/state")
public class StateController {
		
		@Autowired
		StateService stateservice;
		
		/*@RequestMapping("/statelist")
		public ModelAndView getAllStates()
		{
			List<State> list = stateservice.getAll();
			ModelAndView model = new ModelAndView();
			model.setViewName("stateList");
			model.addObject("liststate",list);
			model.addObject("state",new  State());
			model.addObject("edit",false);
			return model;
		}
		
		@RequestMapping("/saveState")
		public String saveState(@ModelAttribute("state") State state)
		{
			
			long result1=stateservice.addState(state);
			return "redirect:/state/statelist";
		}
		
		/*@RequestMapping("/addstate")
		public String addstate(Model model) {
			
			State state=new State();
			model.addAttribute("state", state);
			model.addAttribute("edit",false);
			return "addState";

		}*/
	/*
		@RequestMapping("/deleteState/{id}")
		public String deleteState(@PathVariable long id) {
			boolean result=stateservice.deleteState(id);
			return "redirect:/state/statelist";
		}

		@RequestMapping("/editState/{id}")
		public ModelAndView editState(@PathVariable long id ) {
			State state=stateservice.getById(id);
			List<State> list = stateservice.getAll();
			ModelAndView model = new ModelAndView();
			model.setViewName("stateList");
			model.addObject("liststate",list);
			model.addObject("state",state);
			model.addObject("edit",true);
			return model;
		}*/
}
