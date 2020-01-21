package com.portfordev.pro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.ItNews;
import com.portfordev.pro.service.main_itnews_service;

@Controller
public class main_controller 
{
	
	@Autowired
	main_itnews_service service;
	
	@RequestMapping(value = "/pro")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		mv.addObject("newsList", service.searchItNews(10,1));
		mv.setViewName("main/main");
		return mv;	
	}
	@ResponseBody
	@RequestMapping(value = "/news")
	public List<ItNews> news(	@RequestParam("display")int display,
								@RequestParam("start")int start){
		return service.searchItNews(10, 1);
	}
}