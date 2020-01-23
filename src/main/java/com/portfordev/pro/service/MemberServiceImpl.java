package com.portfordev.pro.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.MemberDAO;
import com.portfordev.pro.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;
	
	@Override
	public int isId(String id, String password) {
		Member rmember = dao.isId(id);
		int result=-1; //아이디가 존재하지 않은 경우 rmember가 null인 경우
		if(rmember!= null) { //아이디 존재
			if(rmember.getMEMBER_PASSWORD().equals(password)) {
				result = 1; // 아이디와 비밀번호 일치
			} else {
				result = 0; //아이디는 존재하지만 비밀번호가 일치하지 않는 경우
			}
		}
		return result;
	}
	@Override
	public String get_salt(String id) {
		return dao.get_salt(id);
	}
	@Override
	public int isId(String id) {
		return (dao.isId(id) != null) ? 1:-1;
	}
	@Override
	public int insert(Member member) {
		return dao.insert(member);
	}
	@Override
	public int memberRegisterDept(HashMap<String, String> map) {
		return dao.memberRegisterDept(map);
	}
	@Override
	public String get_name(String id) {
		return dao.get_name(id);
	}
	@Override
	public Member get_member(String id) {
		return dao.get_member(id);
	}
	@Override
	public void add_write_act(String id, int point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("MEMBER_ID", id);
		map.put("POINT", point);
		dao.add_write_act(map);
	}
	@Override
	public void add_receive_act(String member_id, int board_id, int point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("MEMBER_ID", member_id);
		map.put("BOARD_ID", board_id);
		map.put("POINT", point);
		dao.add_receive_act(map);
	}
}
