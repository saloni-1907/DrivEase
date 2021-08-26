package com.digitalmenu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/admin")
public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping("/addMenuPage")
	public String addMenuPage(Model model) {
		MainMenu mainMenu = new MainMenu();
		model.addAttribute("admin", mainMenu);
		model.addAttribute("edit", false);
		return "addMainMenu";
	}
	
	@RequestMapping("/test")
	public String test(Model model) {
		MainMenu mainMenu = new MainMenu();
		model.addAttribute("admin", mainMenu);
		model.addAttribute("edit", false);
		return "uploadStatus";
	}
	
	@RequestMapping("/addMainMenu")
	public String registrationPage(@ModelAttribute("register") MainMenu mainMenu, BindingResult result, 
			Model model, @RequestParam("menuImage") MultipartFile file) {
		long result1 = menuService.saveUpdateMenu(mainMenu, file);
		return "redirect:/admin/menuList";
	}
	
	@RequestMapping("/menuList")
	public String menuList(Model model) {
		List<MainMenu> menuList = menuService.getAll();
		model.addAttribute("menuList", menuList);
		return "mainMenuList";
	}

	
}
