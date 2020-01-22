package com.portfordev.pro.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Profile {
	private String member_id;
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
}
