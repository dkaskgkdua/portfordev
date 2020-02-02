package com.portfordev.pro.service;

import java.util.List;

import com.portfordev.pro.domain.Profile;

public interface profile_service {
	
	public int insertprofile(String id , Profile profile);
	public int checkid(String id);
	public Profile profile_view(String id);
	public List<Profile> portfolioImg(String id);
	public int updateprofile(String id, Profile profile);
	public int updateprofile_intro(String id,Profile profile);
	public int updateprofile_skill(String id , Profile profile);
}
