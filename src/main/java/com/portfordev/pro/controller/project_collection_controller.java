package com.portfordev.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class project_collection_controller {
	
	@RequestMapping(value="/project")
	public String project_collection() {
		return "project/project_collection";
		
	}

}
