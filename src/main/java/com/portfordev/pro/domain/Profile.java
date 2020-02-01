package com.portfordev.pro.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Profile {
	private String MEMBER_ID;
	private String PROFILE_REAL_NAME;
	private MultipartFile profile_img;
	private String PROFILE_IMG_ORI;
	private String PROFILE_IMG_FILE;
	private String PROFILE_JOB;
	private String PROFILE_PHONE;
	private String PROFILE_EMAIL;
	private String PROFILE_BLOG;
	private String PROFILE_GIT;
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
}
