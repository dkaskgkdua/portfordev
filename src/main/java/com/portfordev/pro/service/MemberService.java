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
	// 활동 점수 추가
	public void add_receive_act(String member_id, int board_id, int point);
	// 단순 정보 변경
	public void update_member(Member member);
	// 비밀번호 변경
	public void update_member(Member member, String check, String salt);
	// 회원 탈퇴
	public void delete_member(String member_id);
}