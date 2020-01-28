package com.portfordev.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.portfolio_dao;
import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.domain.Port_recommend;
import com.portfordev.pro.domain.Port_scrap;

@Service
public class portfolio_service_impl implements portfolio_service
{
	@Autowired
	private portfolio_dao dao;
	
	// 포트폴리오 리스트 가져오기
	@Override
	public List<Portfolio> getPortfolioList(Map<String, String> map){
		return dao.getPortfolioList(map);
	}
	// 포트폴리오 마지막 번호
	@Override
	public int select_max_id() {
		return dao.select_max_id();
	}
	// 포트폴리오 등록
	@Override
	public void insert_portfolio(Portfolio portfolio) {
		portfolio.setPORT_SUBJECT(xss_clean_check(portfolio.getPORT_SUBJECT()));
		portfolio.setPORT_CONTENT(xss_clean_check(portfolio.getPORT_CONTENT()));
		portfolio.setPORT_GITHUB(xss_clean_check(portfolio.getPORT_GITHUB()));
		portfolio.setPORT_SITE(xss_clean_check(portfolio.getPORT_SITE()));
		dao.insert_portfolio(portfolio);
	}
	private String xss_clean_check(String value) {
		String safe_value = Jsoup.clean(value, Whitelist.basic());
		if(safe_value.equals("")) {
			safe_value = "XSS 공격이 감지되었습니다.";
		}
		return safe_value;
	}
	@Override
	// 포트폴리오 수정
	public int update_portfolio(Portfolio portfolio) {
		return dao.update_portfolio(portfolio);
	}
	@Override
	// 포트폴리오 삭제
	public int deletePortfolio(int PORT_ID) {
		return dao.deletePortfolio(PORT_ID);
	}
	@Override
	// 포트폴리오 상세보기
	public Portfolio detailPortfolio(int PORT_ID) {
		return dao.detailPortfolio(PORT_ID);
	}
	@Override
	// 포트폴리오 조회수 + 1
	public int readcountUpdatePortfolio(int PORT_ID) {
		return dao.readcountUpdatePortfolio(PORT_ID);
	}
	@Override
	// 포트폴리오 스크랩 유무 확인
	public int checkScrapPortfolio(Map<String, String> map) {
		return dao.checkScrapPortfolio(map);
	}
	@Override
	// 포트폴리오 스크랩하기
	public int scrapPortfolio(Port_scrap port_scrap) {
		return dao.scrapPortfolio(port_scrap);
	}
	@Override
	// 포트폴리오 스크랩 취소
	public int cancelScrapPortfolio(Port_scrap port_scrap) {
		return dao.cancelScarpPortfolio(port_scrap);
	}
	@Override
	// 포트폴리오 스크랩 리스트 가져오기
	public List<Port_scrap> getPortScrapList(String MEMBER_ID){
		return dao.getPortScrapList(MEMBER_ID);
	}
	@Override
	// 포트폴리오 추천 유무 확인
	public int checkRecomPortfolio(Map<String, String> map) {
		return dao.checkRecomPortfolio(map);
	}
	@Override
	// 포트폴리오 추천하기
	public int recommendPortfolio(Port_recommend port_recommend) {
		return dao.recommendPortfolio(port_recommend);
	}
	@Override
	// 포트폴리오 추천 취소
	public int cancelRecomPortfolio(Port_recommend port_recommend) {
		return dao.cancelRecomPortfolio(port_recommend);
	}
	@Override
	// 포트폴리오 추천 리스트 가져오기
	public List<Port_recommend> getPortRecommendList(String MEMBER_ID){
		return dao.getPortRecommendList(MEMBER_ID);
	}
	@Override
	// 포트폴리오 추천 수 가져오기
	public int getPortRecommendCount(int PORT_ID) {
		return dao.getPortRecommendCount(PORT_ID);
	}
	@Override
	// 포트폴리오 작성자 정보 가져오기
	public Portfolio getPortWriter(int PORT_ID){
		return dao.getPortWriter(PORT_ID);
	}
	// 포트폴리오 날짜 변환
	@Override
	public Map<String, String> replaceDate(int PORT_ID) {
		return dao.replaceDate(PORT_ID);
	}
}
