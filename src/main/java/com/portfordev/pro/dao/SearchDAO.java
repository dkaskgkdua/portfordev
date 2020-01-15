package com.portfordev.pro.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfordev.pro.domain.Member;

@Repository
public class SearchDAO {
 @Autowired
 private SqlSessionTemplate sqlSession;
 
 public List<Member> searchMember(String search) {
	 
	return sqlSession.selectList("Members.searchMember",search);
	 
 }
}
