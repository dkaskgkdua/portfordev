package com.portfordev.pro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Profile;
import com.portfordev.pro.service.profile_service;

@Controller
public class profile_collection_controller {
	@Autowired
	private profile_service pro_service;

	@Value("${savefoldername}")
	private String save_folder;
	
	// 프로필 collection
	@RequestMapping(value="/profile/collection")
	public ModelAndView project_collection(ModelAndView mv) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("page", "1");
		map.put("category", "cateAll");
		map.put("order", "newest");
		map.put("recentAct", "all");
		List<Profile> profileList = pro_service.getProfileList(map);
		for(Profile profile : profileList)
		{
			if(profile.getPROFILE_REAL_NAME().equals("none"))
				profile.setPROFILE_REAL_NAME(profile.getMEMBER_NAME());
			if(profile.getPROFILE_IMG_FILE().equals("none"))
				profile.setPROFILE_IMG_FILE("../Image/icon/default_user.png");
		}
		mv.addObject("profileList", profileList);
		mv.setViewName("profile/profile_collection");
		return mv;
	}
	// 조건에 해당하는 프로필 리스트 가져오기
	@ResponseBody
	@PostMapping(value="/profile/getProfileList")
	public List<Profile> getProfileList(	@RequestParam("page") int page,  
											@RequestParam("category") String category,
											@RequestParam("order") String order, 
											@RequestParam("recentAct") String recentAct){
		Map<String, String> map = new HashMap<String, String>();
		map.put("page", ""+page);
		map.put("category", category);
		map.put("order", order);
		map.put("recentAct", recentAct);
		List<Profile> profileList = pro_service.getProfileList(map);
		for(Profile profile : profileList)
		{
			if(profile.getPROFILE_REAL_NAME().equals("none"))
				profile.setPROFILE_REAL_NAME(profile.getMEMBER_NAME());
			if(profile.getPROFILE_IMG_FILE().equals("none"))
				profile.setPROFILE_IMG_FILE("../Image/icon/default_user.png");
		}
		return profileList;
	}
}
