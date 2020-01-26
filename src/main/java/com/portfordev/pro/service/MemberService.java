package com.portfordev.pro.service;

import java.util.HashMap;

import com.portfordev.pro.domain.Member;


public interface MemberService {
	public int isId(String id, String pass);
	public int isId(String id);
	public String get_salt(String id);
	public int insert(Member member);
	public int memberRegisterDept(HashMap<String, String> map);
	public String get_name(String id);
	public Member get_member(String id);
	public void add_write_act(String member_id, int point);
	public void add_receive_act(String member_id, int board_id, int point);
}
