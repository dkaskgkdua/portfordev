package com.portfordev.pro.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfordev.pro.domain.Member;
import com.portfordev.pro.domain.MyBatisTestVO2;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public Member isId(String id) {
		System.out.println(id);
		return sqlSession.selectOne("Members.idcheck", id);
		
	}
	public int insert(Member member) {
		return sqlSession.insert("Members.insert", member);
	}
	public int memberRegisterDept(HashMap<String, String> map) {
		return sqlSession.insert("Members.registerDept", map);
	}
	
	public String get_name(String id) {
		return sqlSession.selectOne("Members.get_name", id);
	}
}
