package com.portfordev.pro.domain;

import lombok.Data;
import java.sql.Date;

@Data
public class Port_scrap
{
	private int PORT_SCRAP_ID;
	private int PORT_ID;
	private String MEMBER_ID;
	private Date PORT_SCRAP_DATE;
}
