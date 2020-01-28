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

import com.portfordev.pro.domain.Alert;
import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Comment;
import com.portfordev.pro.domain.Member_log;
import com.portfordev.pro.service.MemberService;
import com.portfordev.pro.service.board_service;
import com.portfordev.pro.service.comment_service;
import com.portfordev.pro.service.log_service;

@Controller
public class comment_controller {
	@Autowired
	private comment_service comment_service;
	@Autowired
	private board_service board_service;
	@Autowired
	private MemberService member_service;
	@Autowired
	private log_service log_service;
	
	@PostMapping(value = "comment_add")
	public void comment_add(Comment co, HttpServletResponse response) throws Exception {
		int ok = comment_service.comment_insert(co);
		List<String> comment_list = comment_service.get_distinct_list(co.getBOARD_ID());
		comment_list.forEach(comment -> {
			log_service.insert_alert(new Alert(comment, 1, co.getBOARD_ID(), co.getMEMBER_ID()));
		});
		Board board = board_service.getDetail(co.getBOARD_ID());
		if(!comment_list.contains(board.getMEMBER_ID())) {
			log_service.insert_alert(new Alert(board.getMEMBER_ID(), 1, co.getBOARD_ID(), co.getMEMBER_ID()));
		}
		
		member_service.add_write_act(co.getMEMBER_ID(), 1);
		log_service.insert_log(new Member_log(co.getMEMBER_ID(), 1, co.getBOARD_ID()));
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
