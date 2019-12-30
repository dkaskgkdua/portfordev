package com.portfordev.pro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfordev.pro.domain.Member;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public Member isId(String id) {
		return sqlSession.selectOne("Members.idcheck", id);
	}
	
	
}
