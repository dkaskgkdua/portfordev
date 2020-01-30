package com.portfordev.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.SearchDAO;
import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Member;
import com.portfordev.pro.domain.Portfolio;

@Service
public class search_service_impl implements search_service{
	
	@Autowired
	private SearchDAO dao;

	@Override
	public List<Member> searchMember(String search) {
		
		return dao.searchMember(search);
	}

	@Override
	public List<Board> searchBoard(String search) {
		return dao.searchBoard(search);
	}

	@Override
	public List<Board> searchStudy(String search) {
		return dao.searchStudy(search);
	}

	@Override
	public List<Board> searchQnA(String search) {
		return dao.searchQnA(search);
	}

	@Override
	public List<Portfolio> searchPort(String search) {
		return dao.searchPort(search);
	}

}