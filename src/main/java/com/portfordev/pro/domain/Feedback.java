package com.portfordev.pro.domain;

import lombok.Data;
import java.sql.Date;

@Data
public class Feedback
{
	private int FEEDBACK_ID;
	private int PORT_ID;
	private String MEMBER_ID;
	private String FEEDBACK_CONTENT;
	private Date REG_DATE;
}
