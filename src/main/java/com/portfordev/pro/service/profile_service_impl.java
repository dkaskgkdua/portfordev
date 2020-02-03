package com.portfordev.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.profile_dao;
import com.portfordev.pro.domain.Profile;
@Service
public class profile_service_impl implements profile_service{
	@Autowired
	private profile_dao dao;
	@Override
	public int insertprofile(String id, Profile profile) {
		Map<String,Object>map = new HashMap<String, Object>();
		
		map.put("id",id);
		map.put("profile",profile);
		return dao.insertprofile(map);
		
	}
	@Override
	public int checkid(String id) {
		return dao.checkid(id);
	}
	@Override
	public Profile profile_view(String id) {
		return dao.profile_view(id);
	}
	@Override
	public List<Profile> portfolioImg(String id) {
		return dao.portfolioImg(id);
	}
	@Override
	public int updateprofile(String id, Profile profile) {
		Map<String,Object>map = new HashMap<String, Object>();
		
		map.put("id",id);
		map.put("profile",profile);
		return dao.updateprofile(map);
	}
	@Override
	public int updateprofile_intro(String id, Profile profile) {
		
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("id",id);
		map.put("profile",profile);
		return dao.updateprofile_intro(map);
	}
	@Override
	public int updateprofile_skill(String id, Profile profile) {
		Map<String,Object> map  = new HashMap<String,Object>();
		map.put("id",id);
		map.put("profile",profile);
		return dao.updateprofile_skill(map);
	}
	
	// profile collection
	@Override
	public List<Profile> getProfileList(Map<String, String> map){
		return dao.getProfileList(map);
	}
}