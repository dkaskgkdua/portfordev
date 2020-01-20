package com.portfordev.pro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Member;
import com.portfordev.pro.service.search_service_impl;

@Controller
public class SearchController {
	@Autowired 
	private search_service_impl service;

	@RequestMapping(value="/search")
	public ModelAndView searchview(ModelAndView mv,HttpServletRequest request,String search)throws Exception{
		String s[] = search.split(" ");
		System.out.println("검색될 문자 개수 "+s.length);
		List<Member>memberresult=new ArrayList<Member>();
		List<Board>boardresult = new ArrayList<Board>();
		List<Board>studyresult = new ArrayList<Board>();
		List<Board>qnaresult = new ArrayList<Board>();
		
//		for(int i=0; i<s.length; i++) {
//			memberresult.addAll(service.searchMember(s[i]));
//			boardresult.addAll(service.searchBoard(s[i]));
//			
//			
//			System.out.println("검색 키워드="+s[i]);
//		}
		
		memberresult=service.searchMember(search);
		boardresult= service.searchBoard(search);
		studyresult =service.searchStudy(search);
		qnaresult = service.searchQnA(search);
		
		
		
		mv.addObject("searchKeyword",search);
		mv.addObject("boardResult",boardresult);
		mv.addObject("memberResult", memberresult);
		mv.addObject("studyResult",studyresult);
		mv.addObject("qnaResult",qnaresult);
		mv.setViewName("search/search");
		
		return mv;
	}
}
