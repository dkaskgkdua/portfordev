package com.portfordev.pro.domain;

import lombok.Data;

@Data
public class Member {
	private String MEMBER_ID;
	private String MEMBER_PASSWORD;
	private String MEMBER_NAME;
	private int MEMBER_POWER = 0;
	private int MEMBER_POINT = 0;
	private int MEMBER_ACT = 0;
}
