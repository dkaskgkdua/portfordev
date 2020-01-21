package com.portfordev.pro.service;

import java.util.List;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.portfolio_dao;
import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.domain.Feedback;
import com.portfordev.pro.domain.Feedback_recommend;
import com.portfordev.pro.domain.Port_recommend;
import com.portfordev.pro.domain.Port_scrap;

@Service
public class portfolio_service_impl implements portfolio_service
{
	@Autowired
	private portfolio_dao dao;
	
	@Override
	public List<Portfolio> getPortfolioList(int page, int limit)
	{
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		return null;
	}
}
