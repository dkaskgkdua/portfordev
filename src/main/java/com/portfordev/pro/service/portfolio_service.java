package com.portfordev.pro.service;

import java.util.List;
import java.util.Map;

import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.domain.Port_recommend;
import com.portfordev.pro.domain.Port_scrap;

public interface portfolio_service 
{
	// 메인 베스트 포트폴리오 탑5 가져오기
	public List<Portfolio> getBestPort5List(String condition);
	// my 포트폴리오 list
	public List<Portfolio> getMyPortfolioList(String MEMBER_ID);
	// 포트폴리오 리스트 가져오기
	public List<Portfolio> getPortfolioList(Map<String, String> map);
	// 포트폴리오 마지막 번호
	public int select_max_id();
	// 포트폴리오 등록
	public void insert_portfolio(Portfolio portfolio);
	// 포트폴리오 수정
	public int update_portfolio(Portfolio portfolio);
	// 포트폴리오 삭제
	public int deletePortfolio(int PORT_ID);
	// 포트폴리오 상세보기
	public Portfolio detailPortfolio(int PORT_ID);
	// 포트폴리오 조회수 + 1
	public int readcountUpdatePortfolio(int PORT_ID);
	// 포트폴리오 스크랩 유무 확인
	public int checkScrapPortfolio(Map<String, String> map);
	// 포트폴리오 스크랩하기
	public int scrapPortfolio(Port_scrap port_scrap);
	// 포트폴리오 스크랩 취소
	public int cancelScrapPortfolio(Port_scrap port_scrap);
	// 포트폴리오 스크랩 리스트 가져오기
	public List<Port_scrap> getPortScrapList(String MEMBER_ID);
	// 포트폴리오 추천 유무 확인
	public int checkRecomPortfolio(Map<String, String> map);
	// 포트폴리오 추천하기
	public int recommendPortfolio(Port_recommend port_recommend);
	// 포트폴리오 추천 취소
	public int cancelRecomPortfolio(Port_recommend port_recommend);
	// 포트폴리오 추천 리스트 가져오기
	public List<Port_recommend> getPortRecommendList(String MEMBER_ID);
	// 포트폴리오 추천 수 가져오기
	public int getPortRecommendCount(int PORT_ID);
	// 포트폴리오 작성자 정보 가져오기
	public Portfolio getPortWriter(int PORT_ID);
	// 포트폴리오 날짜 변환
	public Map<String, String> replaceDate(int PORT_ID);
}
