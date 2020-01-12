package com.portfordev.pro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Member;
import com.portfordev.pro.service.search_service_impl;

@Controller
public class SearchController {
	@Autowired 
	private search_service_impl service;

	@RequestMapping(value="/search")
	public ModelAndView searchview(ModelAndView mv,HttpServletRequest request,String search)throws Exception{
		List<Member>memberresult=service.searchMember(search);
		System.out.println("검색 키워드="+search);
		mv.addObject("searchKeyword",search);
		mv.addObject("memberResult", memberresult);
		mv.setViewName("search/search");
		
		return mv;
	}
}
