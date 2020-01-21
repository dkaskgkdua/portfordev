package com.portfordev.pro.domain;

import lombok.Data;
import java.sql.Date;

@Data
public class Feedback_recommend
{
	private int PF_RECO_ID;
	private String MEMBER_ID;
	private int FEEDBACK_ID;
	private Date PF_RECO_DATE;
}
