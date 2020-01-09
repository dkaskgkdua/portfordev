package com.portfordev.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.MemberDAO;
import com.portfordev.pro.domain.Member;

import lombok.Data;

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

}
