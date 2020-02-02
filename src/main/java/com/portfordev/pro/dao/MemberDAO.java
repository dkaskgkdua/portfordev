package com.portfordev.pro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int insert(Member member) {
		return sqlSession.insert("Members.insert", member);
	}
	public int memberRegisterDept(HashMap<String, String> map) {
		return sqlSession.insert("Members.registerDept", map);
	}
	
	public String get_name(String id) {
		return sqlSession.selectOne("Members.get_name", id);
	}
	public void update_member(Member member) {
		sqlSession.update("Members.update_member", member);
	}
	public Member get_member(String id) {
		return sqlSession.selectOne("Members.get_member", id);
	}
	public void add_write_act(Map<String, Object> map) {
		sqlSession.update("Members.add_write_act", map);
	}
	public void add_receive_act(Map<String, Object> map) {
		sqlSession.update("Members.add_receive_act", map);
	}
	public String get_salt(String id) {
		return sqlSession.selectOne("Members.get_salt", id);
	}
	public void delete_member(String member_id) {
		sqlSession.delete("Members.delete_member", member_id);
	}
	public List<Member> get_member_list() {
		return sqlSession.selectList("Members.get_member_list");
	}
}
