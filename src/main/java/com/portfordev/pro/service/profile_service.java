package com.portfordev.pro.service;

import java.util.List;
import java.util.Map;

import com.portfordev.pro.domain.Profile;

public interface profile_service {
	
	public int insertprofile(String id , Profile profile);
	public int checkid(String id);
	public Profile profile_view(String id);
	public List<Profile> portfolioImg(String id);
	public int updateprofile(String id, Profile profile);

	// profile collection
	public List<Profile> getProfileList(Map<String, String> map);
}