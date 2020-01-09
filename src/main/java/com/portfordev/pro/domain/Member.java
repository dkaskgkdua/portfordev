package com.portfordev.pro.domain;

import lombok.*;

@Data
public class Member {
	private String MEMBER_ID;
	private String MEMBER_PASSWORD;
	private String MEMBER_NAME;
	
	public String getMEMBER_ID(){return MEMBER_ID;}
	public void setMEMBER_ID(String mEMBER_ID){MEMBER_ID = mEMBER_ID;}
	public String getMEMBER_PASSWORD(){return MEMBER_PASSWORD;}
	public void setMEMBER_PASSWORD(String mEMBER_PASSWORD){MEMBER_PASSWORD = mEMBER_PASSWORD;}
	public String getMEMBER_NAME(){return MEMBER_NAME;}
	public void setMEMBER_NAME(String mEMBER_NAME){MEMBER_NAME = mEMBER_NAME;}
	
}
