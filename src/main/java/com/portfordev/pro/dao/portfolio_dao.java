package com.portfordev.pro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.portfordev.pro.domain.Portfolio;
import com.portfordev.pro.domain.Port_recommend;
import com.portfordev.pro.domain.Port_scrap;

@Repository
public class portfolio_dao 
{
	@Autowired
	private SqlSessionTemplate sqlSession;
	// 포트폴리오 list
	public List<Portfolio> getPortfolioList(Map<String, String> map){
		return sqlSession.selectList("Portfolios.list", map);
	}
	// 포트폴리오 마지막 번호 구하기
	public int select_max_id() {
		return sqlSession.selectOne("Portfolios.select_max_id");
	}
	// 포트폴리오 insert
	public int insert_portfolio(Portfolio portfolio) {
		return sqlSession.insert("Portfolios.insert", portfolio);
	}
	// 포트폴리오 update
	public int update_portfolio(Portfolio portfolio) {
		return sqlSession.update("Portfolios.update", portfolio);
	}
	// 포트폴리오 delete
	public int deletePortfolio(int PORT_ID) {
		return sqlSession.delete("Portfolios.delete", PORT_ID);
	}
	// 포트폴리오 detail
	public Portfolio detailPortfolio(int PORT_ID) {
		return sqlSession.selectOne("Portfolios.detail", PORT_ID);
	}
	// 포트폴리오 조회수 + 1
	public int readcountUpdatePortfolio(int PORT_ID) {
		return sqlSession.update("Portfolios.readcount_update", PORT_ID);
	}
	// 포트폴리오 스크랩 check
	public int checkScrapPortfolio(Map<String, String> map) {
		return sqlSession.selectOne("Portfolios.scrap_check", map);
	}
	// 포트폴리오 스크랩 insert
	public int scrapPortfolio(Port_scrap port_scrap) {
		return sqlSession.insert("Portfolios.scrap", port_scrap);
	}
	// 포트폴리오 스크랩 취소
	public int cancelScarpPortfolio(Port_scrap port_scrap) {
		return sqlSession.delete("Portfolios.scrap_cancel", port_scrap);
	}
	// 포트폴리오 스크랩 리스트
	public List<Port_scrap> getPortScrapList(String MEMBER_ID){
		return sqlSession.selectList("Portfolios.scrap_list", MEMBER_ID);
	}
	// 포트폴리오 추천 check
	public int checkRecomPortfolio(Map<String, String> map) {
		return sqlSession.selectOne("Portfolios.recommend_check", map);
	}
	// 포트폴리오 추천 insert
	public int recommendPortfolio(Port_recommend port_recommend) {
		return sqlSession.insert("Portfolios.recommend", port_recommend);
	}
	// 포트폴리오 추천 취소
	public int cancelRecomPortfolio(Port_recommend port_recommend) {
		return sqlSession.delete("Portfolios.recommend_cancel", port_recommend);
	}
	// 포트폴리오 추천 리스트
	public List<Port_recommend> getPortRecommendList(String MEMBER_ID){
		return sqlSession.selectList("Portfolios.recommend_list", MEMBER_ID);
	}
	// 포트폴리오 추천 count
	public int getPortRecommendCount(int PORT_ID) {
		return sqlSession.selectOne("Portfolios.recommend_count", PORT_ID);
	}
	// 포트폴리오 작성자 정보
	public Portfolio getPortWriter(int PORT_ID) {
		return sqlSession.selectOne("Portfolios.port_writer", PORT_ID);
	}
	// 포트폴리오 날짜 변환
	public Map<String, String> replaceDate(int PORT_ID) {
		Map<String, String> dates = new HashMap<String, String>();
		dates.put("PORT_WRITTEN", sqlSession.selectOne("Portfolios.port_date", PORT_ID));
		dates.put("PORT_START", sqlSession.selectOne("Portfolios.port_start", PORT_ID));
		dates.put("PORT_END", sqlSession.selectOne("Portfolios.port_end", PORT_ID));
		return dates;
	}
}