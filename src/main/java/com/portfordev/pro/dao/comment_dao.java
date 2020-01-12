package com.portfordev.pro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class comment_dao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(int BOARD_ID) {
		return sqlSession.selectOne("Comments.count", BOARD_ID);
	}
}
