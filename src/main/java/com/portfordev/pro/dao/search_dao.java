package com.portfordev.pro.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Member;
import com.portfordev.pro.domain.Portfolio;

@Repository
public class search_dao {
 @Autowired
 private SqlSessionTemplate sqlSession;
 
 public List<Member> searchMember(String search) {
	 
	return sqlSession.selectList("search.searchMember",search);
	 
 }
 
 public List<Board> searchBoard(String search){
	 
	 return sqlSession.selectList("search.searchBoard",search);
 }
 
 public List<Board> searchStudy(String search){
	 return sqlSession.selectList("search.searchStudy",search);
 }
 
 public List<Board> searchQnA(String search){
	 return sqlSession.selectList("search.searchQnA",search);
 }
 
 public List<Portfolio> searchPort(String search){
	 return sqlSession.selectList("search.searchPort",search);
 }
 
}
