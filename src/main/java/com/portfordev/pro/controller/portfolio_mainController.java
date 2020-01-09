package com.portfordev.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class portfolio_mainController {
	
	@RequestMapping(value="/portfolio")
	public String portfolio_main() {
		return "portfolio_main/portfolio_main";
		
	}

}
