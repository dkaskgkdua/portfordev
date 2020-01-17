package com.portfordev.pro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.portfordev.pro.domain.Comment;
import com.portfordev.pro.service.MemberService;
import com.portfordev.pro.service.comment_service;

@Controller
public class comment_controller {
	@Autowired
	private comment_service comment_service;
	@Autowired
	private MemberService member_service;
	
	@PostMapping(value = "comment_add")
	public void comment_add(Comment co, HttpServletResponse response) throws Exception {
		member_service.add_write_act(co.getMEMBER_ID(), 1);
		int ok = comment_service.comment_insert(co);
		response.getWriter().print(ok);
	}
	
	
	@PostMapping(value = "comment_update")
	public void comment_update(Comment co, HttpServletResponse response) throws Exception {
		int ok = comment_service.comment_update(co);
		response.getWriter().print(ok);
	}
	
	@GetMapping(value = "comment_delete")
	public void comment_delete(@RequestParam("BOARD_CO_ID") String id, HttpServletResponse response) throws Exception {
		System.out.println(id);
		int ok = comment_service.comment_delete(Integer.parseInt(id));
		response.getWriter().print(ok);
	}
	@ResponseBody
	@GetMapping(value = "comment_list")
	public Object comment_list(@RequestParam("BOARD_ID") int BOARD_ID) {
		List<Comment> list = comment_service.get_list(BOARD_ID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comment_list", list);
		map.put("leng", list.size());
		return map;
	}
}
