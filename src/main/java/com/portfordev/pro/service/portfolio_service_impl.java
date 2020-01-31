package com.portfordev.pro.service;

import java.util.List;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
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
	@Override
	public int select_max_id() {
		return dao.select_max_id();
	}
	@Override
	public void insert_portfolio(Portfolio portfolio) {
		portfolio.setPORT_SUBJECT(xss_clean_check(portfolio.getPORT_SUBJECT()));
		portfolio.setPORT_CONTENT(xss_clean_check(portfolio.getPORT_CONTENT()));
		portfolio.setPORT_GITHUB(xss_clean_check(portfolio.getPORT_GITHUB()));
		portfolio.setPORT_SITE(xss_clean_check(portfolio.getPORT_SITE()));
		dao.insert_portfolio(portfolio);
	}
	private String xss_clean_check(String value) {
		if(!value.equals("")) {
			String safe_value = Jsoup.clean(value, Whitelist.basic());
			if(safe_value.equals("")) {
				safe_value = "XSS 공격이 감지되었습니다.";
			}
			return safe_value;
		}
		return value;
	}
}
