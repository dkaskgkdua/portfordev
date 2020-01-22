package com.portfordev.pro.service;

import java.util.List;
import java.util.HashMap;

import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.domain.Feedback;
import com.portfordev.pro.domain.Feedback_recommend;
import com.portfordev.pro.domain.Port_recommend;
import com.portfordev.pro.domain.Port_scrap;

public interface portfolio_service 
{
	public List<Portfolio> getPortfolioList(int page, int limit);
}
