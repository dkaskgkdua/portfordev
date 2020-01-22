package com.portfordev.pro.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Portfolio
{
	private int PORT_ID;
	private String MEMBER_ID;
	private String PORT_SUBJECT;
	private String PORT_CONTENT;
	private String PORT_SUM_IMAGE;
	private String PORT_ORI_SUM_IMAGE;
	private String PORT_FILE;
	private String PORT_ORI_FILE;
	private Date PORT_START_DAY;
	private Date PORT_END_DAY;
	private int PORT_TEAM;
	private String PORT_GITHUB;
	private String PORT_SITE;
	private int PORT_SHOW;
	private int PORT_FEED_NEED;
	private Date PORT_REGIDATE;
	private int PORT_READCOUNT;
	private MultipartFile PORT_UPLOADFILE;
	private MultipartFile PORT_SUM_UPLOADIMAGE;
}
