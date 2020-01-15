package com.portfordev.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.SearchDAO;
import com.portfordev.pro.domain.Member;

@Service
public class search_service_impl implements search_service{
	
	@Autowired
	private SearchDAO dao;

	@Override
	public List<Member> searchMember(String search) {
		
		return dao.searchMember(search);
	}

}
