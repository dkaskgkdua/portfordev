package com.portfordev.pro.service;

import com.portfordev.pro.domain.Profile;

public interface profile_service {
	
	public int insertprofile(String id , Profile profile);
	public int checkid(String id);

}
