package com.portfordev.pro.domain;

import lombok.Data;

@Data
public class Alert {
	private int ALERT_ID;
	private String MEMBER_ID;  // 수신 회원
	private int ALERT_CATEGORY;	// 카테고리 .. 0 답변, 1 댓글, 2 추천, 3 추천 취소
	private int ALERT_REF_ID;	// 참조 게시물 번호
	private String ALERT_REQ_MEMBER; // 발신 회원
	private int ALERT_CHECK = 0;  // 0은 확인 안함, 1은 확인 완료
	private String ALERT_DATE;
	
	public Alert() {
		
	}
	public Alert(String MEMBER_ID, int ALERT_CATEGORY, int ALERT_REF_ID, String ALERT_REQ_MEMBER) {
		this.MEMBER_ID = MEMBER_ID;
		this.ALERT_CATEGORY = ALERT_CATEGORY;
		this.ALERT_REF_ID = ALERT_REF_ID;
		this.ALERT_REQ_MEMBER = ALERT_REQ_MEMBER;
	}
}
