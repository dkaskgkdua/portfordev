package com.portfordev.pro.domain;

import lombok.Data;
import java.sql.Date;

@Data
public class Port_recommend
{
	private int PORT_RECO_ID;
	private String MEMBER_ID;
	private int PORT_ID;
	private Date PORT_RECO_DATE;
}
