package com.portfordev.pro.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfordev.pro.domain.Comment;

@Repository
public class comment_dao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(int BOARD_ID) {
		return sqlSession.selectOne("Comments.count", BOARD_ID);
	}
	public List<Comment> get_list(int BOARD_ID) {
		return sqlSession.selectList("Comments.get_list", BOARD_ID);
	}
}
