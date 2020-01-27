package com.portfordev.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.member_log_dao;
import com.portfordev.pro.domain.Alert;
import com.portfordev.pro.domain.Member_log;

@Service
public class log_service_impl implements log_service{
	@Autowired
	private member_log_dao dao;
	
	@Override
	public void insert_log(Member_log log) {
		dao.insert_log(log);
	}
	@Override
	public int get_log_count(String MEMBER_ID) {
		return dao.get_log_count(MEMBER_ID);
	}
	@Override
	public List<Member_log> get_log_list(int page, int limit, String MEMBER_ID) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("member_id", MEMBER_ID);
		return dao.get_log_list(map);
	}
	@Override
	public void insert_alert(Alert alert) {
		dao.insert_alert(alert);
	}
}
