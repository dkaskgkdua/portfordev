package com.portfordev.pro.service;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.comment_dao;
import com.portfordev.pro.domain.Comment;

@Service
public class comment_service_impl implements comment_service{
	@Autowired
	private comment_dao dao;
	
	@Override
	public int getListCount(int BOARD_ID) {
		return dao.getListCount(BOARD_ID);
	}
	@Override
	public List<Comment> get_list(int BOARD_ID) {
		return dao.get_list(BOARD_ID);
	}
	@Override
	public int comment_insert(Comment co) {
		co.setBOARD_CO_CONTENT(xss_clean_check(co.getBOARD_CO_CONTENT()));
		return dao.comment_insert(co);
	}
	@Override
	public int comment_update(Comment co) {
		co.setBOARD_CO_CONTENT(xss_clean_check(co.getBOARD_CO_CONTENT()));
		return dao.comment_update(co);
	}
	@Override
	public int comment_delete(int id) {
		return dao.comment_delete(id);
	}
	private String xss_clean_check(String value) {
		String safe_value = Jsoup.clean(value, Whitelist.basic());
		if(safe_value.equals("") || safe_value == null) {
			safe_value = "XSS 공격이 감지되었습니다.";
		}
		return safe_value;
	}
}
