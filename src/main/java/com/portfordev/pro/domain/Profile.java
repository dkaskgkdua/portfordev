package com.portfordev.pro.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonSetter;

import lombok.Data;

@Data
public class Profile {
	@JsonSetter("MEMBER_ID")
	private String MEMBER_ID;
	@JsonSetter("PROFILE_REAL_NAME")
	private String PROFILE_REAL_NAME;
	private MultipartFile profile_img;
	private String PROFILE_IMG_ORI;
	@JsonSetter("PROFILE_IMG_FILE")
	private String PROFILE_IMG_FILE;
	@JsonSetter("PROFILE_JOB")
	private String PROFILE_JOB;
	private String PROFILE_PHONE;
	private String PROFILE_EMAIL;
	private String PROFILE_BLOG;
	private String PROFILE_GIT;
	@JsonSetter("PROFILE_YEAR")
	private String PROFILE_YEAR;
	private String PROFILE_STRENGTH1;
	private String PROFILE_STRENGTH2;
	private String PROFILE_TECH_FRONT;
	private String PROFILE_TECH_BACK;
	private String PROFILE_INTRO;
	private String PROFILE_TECH_INTRO;
	
	//포트폴리오 이미지 
	
	private String PORT_ID;
	private String PORT_FILE_PATH;
	private String PORT_SUBJECT;
	
	// 프로파일 컬렉션
	@JsonSetter("MEMBER_NAME")
	private String MEMBER_NAME;
	@JsonSetter("MEMBER_ACT")
	private int MEMBER_ACT;
	@JsonSetter("BOARD_CNT")
	private int BOARD_CNT;
	@JsonSetter("PORT_CNT")
	private int PORT_CNT;
	@JsonSetter("FEED_CNT")
	private int FEED_CNT;
	@JsonSetter("MEMBER_DATE")
	private Date MEMBER_DATE;
	@JsonSetter("ACT_DATE")
	private Date ACT_DATE;
}

