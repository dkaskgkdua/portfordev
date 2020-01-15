package com.portfordev.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class portfolio_collection_controller {
	
	@RequestMapping(value="/portfolio/collection")
	public String project_collection() {
		return "portfolio/portfolio_collection";
		
	}

}
