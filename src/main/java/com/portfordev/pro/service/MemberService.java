package com.portfordev.pro.service;

import java.util.HashMap;

import com.portfordev.pro.domain.Member;


public interface MemberService {
	public int isId(String id, String pass);
	public int isId(String id);
	public int insert(Member member);
	public int memberRegisterDept(HashMap<String, String> map);
	public String get_name(String id);
}
