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
import com.portfordev.pro.service.it_news_service;

@Controller
public class it_news_controller 
{

	@Autowired
	it_news_service service;
	
	@RequestMapping(value = "/news")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		mv.addObject("newsList", service.searchItNews(10,1));
		mv.addObject("brNewsList", service.breakingNews("IT일반"));
		mv.setViewName("news/news");
		return mv;	
	}
	@ResponseBody
	@RequestMapping(value = "/getNextNews")
	public List<ItNews> getNextNews( @RequestParam("display")int display,
									 @RequestParam("start")int start){
		return service.searchItNews(display, start);
	}
	@ResponseBody
	@RequestMapping(value = "/getBreakingNews")
	public List<ItNews> breakingNews(@RequestParam("category") String category){
		return service.breakingNews(category);
	}
}
