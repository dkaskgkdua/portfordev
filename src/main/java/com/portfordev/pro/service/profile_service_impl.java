package com.portfordev.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
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
		profile.setPROFILE_REAL_NAME(xss_clean_check(profile.getPROFILE_REAL_NAME()));
		profile.setPROFILE_EMAIL(xss_clean_check(profile.getPROFILE_EMAIL()));
		profile.setPROFILE_PHONE(xss_clean_check(profile.getPROFILE_PHONE()));
		profile.setPROFILE_BLOG(xss_clean_check(profile.getPROFILE_BLOG()));
		profile.setPROFILE_GIT(xss_clean_check(profile.getPROFILE_GIT()));
		profile.setPROFILE_YEAR(xss_clean_check(profile.getPROFILE_YEAR()));
		profile.setPROFILE_TECH_INTRO(xss_clean_check(profile.getPROFILE_TECH_INTRO()));
		profile.setPROFILE_INTRO(xss_clean_check(profile.getPROFILE_INTRO()));
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
		profile.setPROFILE_REAL_NAME(xss_clean_check(profile.getPROFILE_REAL_NAME()));
		profile.setPROFILE_EMAIL(xss_clean_check(profile.getPROFILE_EMAIL()));
		profile.setPROFILE_PHONE(xss_clean_check(profile.getPROFILE_PHONE()));
		profile.setPROFILE_BLOG(xss_clean_check(profile.getPROFILE_BLOG()));
		profile.setPROFILE_GIT(xss_clean_check(profile.getPROFILE_GIT()));
		map.put("id",id);
		map.put("profile",profile);
		return dao.updateprofile(map);
	}
	@Override
	public int updateprofile_intro(String id, Profile profile) {
		profile.setPROFILE_YEAR(xss_clean_check(profile.getPROFILE_YEAR()));
		profile.setPROFILE_INTRO(xss_clean_check(profile.getPROFILE_INTRO()));
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("id",id);
		map.put("profile",profile);
		return dao.updateprofile_intro(map);
	}
	@Override
	public int updateprofile_skill(String id, Profile profile) {
		Map<String,Object> map  = new HashMap<String,Object>();
		profile.setPROFILE_TECH_INTRO(xss_clean_check(profile.getPROFILE_TECH_INTRO()));
		map.put("id",id);
		map.put("profile",profile);
		return dao.updateprofile_skill(map);
	}
	
	// profile collection
	@Override
	public List<Profile> getProfileList(Map<String, String> map){
		return dao.getProfileList(map);
	}
	
	private String xss_clean_check(String value) {
		if(!value.equals("")) {
			String safe_value = Jsoup.clean(value, Whitelist.basic()).replaceAll("[\"]", "&#34;")
					 .replaceAll("[\']", "&#39;");
			if(safe_value.equals("")) {
				safe_value = "XSS 감지";
			}
			return safe_value;
		}
		return value;
	}
}