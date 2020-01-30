  
package com.portfordev.pro.service;

import java.util.List;

import com.portfordev.pro.domain.Alert;
import com.portfordev.pro.domain.Member_log;

public interface log_service {
	// 로그삽입
	public void insert_log(Member_log log);
	// 로그 갯수
	public int get_log_count(String MEMBER_ID);
	// 로그 리스트
	public List<Member_log> get_log_list(int page, int limit, String MEMBER_ID);
	// 알림 삽입
	public void insert_alert(Alert alert);
	// 알림 리스트
	public List<Alert> get_alert_list(String MEMBER_ID);
	// 읽지 않은 알림 수
	public int get_unread_count(String MEMBER_ID);
	// 읽음 처리
	public void update_alert(String MEMBER_ID);
}