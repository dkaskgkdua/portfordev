package com.portfordev.pro.domain;

import lombok.Data;
import java.sql.Date;

@Data
public class Portfolio
{
	private int PORT_ID;
	private String MEMBER_ID;
	private String PORT_SUBJECT;
	private String PORT_CONTENT;
	private String PORT_SUM_IMAGE;
	private String PORT_FILE;
	private Date PORT_START_DAY;
	private Date PORT_END_DAY;
	private int PORT_TEAM;
	private String PORT_GITHUB;
	private String PORT_SITE;
	private int PORT_SHOW;
	private int PORT_FEED;
	private Date PORT_REGIDATE;
	private int PORT_READCOUNT;
}
