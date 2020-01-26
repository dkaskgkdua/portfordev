package com.portfordev.pro.service;

import java.util.List;

import com.portfordev.pro.domain.Member_log;

public interface log_service {
	public void insert_log(Member_log log);
	public int get_log_count(String MEMBER_ID);
	public List<Member_log> get_log_list(int page, int limit, String MEMBER_ID);
}
