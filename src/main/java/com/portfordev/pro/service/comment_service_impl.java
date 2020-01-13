package com.portfordev.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.comment_dao;

@Service
public class comment_service_impl implements comment_service{
	@Autowired
	private comment_dao dao;
	
	@Override
	public int getListCount(int BOARD_ID) {
		return dao.getListCount(BOARD_ID);
	}
}
