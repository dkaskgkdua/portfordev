package com.portfordev.pro.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class profile_controller {
	
	@RequestMapping(value="/profile")
	public String profile_main() {
		return "profile/profile";
		
	}
	
	@RequestMapping(value="/portfolio_form")
	public String profile_form() {
		return "profile_form/profile_form";
	}
	
	@ResponseBody
	@RequestMapping(value="/profile_insert")
	public Map<String,String> profile_insert(String eng_name) {
		System.out.println("입력한 이름 "+eng_name);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result","success");
		return map;
		
	}

}
