package com.portfordev.pro.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class main_controller 
{
	@RequestMapping(value = "/pro")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		mv.setViewName("main/main");
		return mv;	
	}
}