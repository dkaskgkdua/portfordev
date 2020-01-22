package com.portfordev.pro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.HashMap;

import com.portfordev.pro.domain.Portfolio;

@Repository
public class portfolio_dao 
{
	@Autowired
	private SqlSessionTemplate sqlSession;
	// 포트폴리오 리스트 가져오기
	public List<Portfolio> getPortfolioList(){
		return sqlSession.selectList("Portfolios.list");
	}
	// 포트폴리오 insert
	public int insert_portfolio(Portfolio portfolio) {
		return sqlSession.insert("Portfolios.insert", portfolio);
	}
	// 포트폴리오 update
	
	// 포트폴리오 조회수 + 1
	public int readcountUpdatePortfolio(int PORT_ID) {
		return sqlSession.update("Portfolios.readcount_update", PORT_ID);
	}
	
	public int select_max_id() {
		return sqlSession.selectOne("Portfolios.select_max_id");
	}
}
