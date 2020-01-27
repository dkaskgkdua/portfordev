package com.portfordev.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class main_controller 
{
	@RequestMapping(value = "/pro")
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("main/main");
		return mv;	
	}
	@RequestMapping(value = "/TeamPFD")
	public ModelAndView teamPFD(ModelAndView mv) {
		mv.setViewName("main/team_pfd");
		return mv;	
	}
}