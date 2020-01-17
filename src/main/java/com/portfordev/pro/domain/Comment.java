package com.portfordev.pro.domain;

import lombok.Data;

@Data
public class Comment {
	private int BOARD_CO_ID;
	private int BOARD_ID;
	private String MEMBER_ID;
	private String MEMBER_NAME;
	private String BOARD_CO_CONTENT;
	private String BOARD_CO_DATE;
	private String MEMBER_ACT;
}
