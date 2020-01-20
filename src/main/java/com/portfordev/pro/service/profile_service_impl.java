package com.portfordev.pro.service;

import java.util.HashMap;
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
	

}
