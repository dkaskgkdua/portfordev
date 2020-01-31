package com.portfordev.pro.domain;

import lombok.Data;

@Data
public class Member_log {
	private int MEMBER_LOG_ID;
	private String MEMBER_ID;
	private int MEMBER_LOG_CATEGORY; // 0 게시판, 1 게시판 댓글, 2 포트폴리오, 3 포트폴리오 피드백, 4 추천, 5 추천 취소
	private int MEMBER_REF_ID;	// 카테고리 참조 id
	private String MEMBER_LOG_DATE;
	
	public Member_log(String MEMBER_ID, int MEMBER_LOG_CATEGORY, int MEMBER_REF_ID) {
		this.MEMBER_ID = MEMBER_ID;
		this.MEMBER_LOG_CATEGORY = MEMBER_LOG_CATEGORY;
		this.MEMBER_REF_ID = MEMBER_REF_ID;
	}
	public Member_log() {
		
	}
}