package com.portfordev.pro.service;

import java.util.List;

import com.portfordev.pro.domain.Portfolio;

public interface portfolio_service 
{
	public List<Portfolio> getPortfolioList(int page, int limit);
	// 포트폴리오 마지막번호
	public int select_max_id();
	// 포트폴리오 등록
	public void insert_portfolio(Portfolio portfolio);
}
