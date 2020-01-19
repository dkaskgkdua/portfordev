package com.portfordev.pro.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Profile {
	private String eng_name;
	private MultipartFile profile_img;
	private String profile_img_ori;
	private String profile_img_file;
	private String job;
	private String phone;
	private String email;
	private String blog;
	private String github;
	private String year;
	private String posi;
	private String posi2;
	private String frontend;
	private String backend;
	private String selfintro;
}
