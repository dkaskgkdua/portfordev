package com.portfordev.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.portfordev.pro.service.portfolio_service;

@Controller
public class portfolio_controller
{
	@Autowired
	private portfolio_service po_service;
	
	
	@RequestMapping(value="/portfolio/collection")
	public String project_collection()
	{
		return "portfolio/portfolio_collection";	
	}

}
