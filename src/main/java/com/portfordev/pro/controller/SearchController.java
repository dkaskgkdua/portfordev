package com.portfordev.pro.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {

	@RequestMapping(value="/search")
	public ModelAndView searchview(ModelAndView mv,HttpServletRequest request)throws Exception{
		mv.setViewName("search/search");
		
		return mv;
	}
}
