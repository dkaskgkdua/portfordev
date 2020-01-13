package com.portfordev.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class profile_controller {
	
	@RequestMapping(value="/profile")
	public String portfolio_main() {
		return "profile/profile";
		
	}
	
	@RequestMapping(value="/portfolio_form")
	public String portfolio_form() {
		return "profile_form/profile_form";
	}

}
