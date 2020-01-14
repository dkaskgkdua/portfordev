package com.portfordev.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class profile_collection_controller {
	
	@RequestMapping(value="/profileCollection")
	public String project_collection() {
		return "profile/profile_collection";
		
	}

}
