package com.portfordev.pro.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String MEMBER_ID;
	private String MEMBER_PASSWORD;
	private String MEMBER_NAME;
	private String MEMBER_PASSWORD_SALT;
	private int MEMBER_POWER = 0;
	private int MEMBER_POINT = 0;
	private int MEMBER_ACT = 0;
	
	/*search(member최근 활동일)추가 -join with PORT_FEEDBACK*/
	private Date REG_DATE;
	private String CNT_FEEDBACK;
}