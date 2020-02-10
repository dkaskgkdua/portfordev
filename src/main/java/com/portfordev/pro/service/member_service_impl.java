package com.portfordev.pro.service;

import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.member_dao;
import com.portfordev.pro.domain.Member;

@Service
public class member_service_impl implements member_service {
	@Autowired
	private member_dao dao;
	
	@Override
	public int isId(String id, String password) {
		Member rmember = dao.isId(id);
		int result=-1; //아이디가 존재하지 않은 경우 rmember가 null인 경우
		if(rmember!= null) { //아이디 존재
			if(rmember.getMEMBER_PASSWORD().equals(password)) {
				result = 1; // 아이디와 비밀번호 일치
				System.out.println("id = " + id+"db : " + rmember.getMEMBER_PASSWORD() +" cl : " + password);
			} else {
				System.out.println("id = " + id+"db : " + rmember.getMEMBER_PASSWORD() +" cl : " + password);
				result = 0; //아이디는 존재하지만 비밀번호가 일치하지 않는 경우
			}
		}
		return result;
	}
	@Override
	public void update_member(Member member) {
		member.setMEMBER_NAME(xss_clean_check(member.getMEMBER_NAME()));
		dao.update_member(member);
	}
	@Override
	public void delete_member(String member_id) {
		dao.delete_member(member_id);
	}
	@Override
	public void update_member(Member member, String check, String salt) {
		member.setMEMBER_NAME(xss_clean_check(member.getMEMBER_NAME()));
		member.setMEMBER_PASSWORD(""+(salt+check).hashCode());
		dao.update_member(member);
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
		member.setMEMBER_ID(xss_clean_check(member.getMEMBER_ID()));
		member.setMEMBER_NAME(xss_clean_check(member.getMEMBER_NAME()));
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
	private String xss_clean_check(String value) {
		if(!value.equals("")) {
			String safe_value = Jsoup.clean(value, Whitelist.basic());
			if(safe_value.equals("")) {
				safe_value = "XSS 감지";
			}
			return safe_value;
		}
		return value;
	}
}

