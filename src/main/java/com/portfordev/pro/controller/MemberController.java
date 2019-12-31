package com.portfordev.pro.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.portfordev.pro.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;

	@RequestMapping(value = "/loginProcess.net", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("id") String id, @RequestParam("password") String password,
			HttpServletResponse response, HttpSession session) throws Exception {

		int result = memberservice.isId(id, password);
		System.out.println("결과는 " + result);

		if (result == 1) {
			System.out.println("로그인 성공");
			session.setAttribute("id", id);
			return "member/loginResult";
		} else {
			String message = "비밀번호가 일치하지 않습니다.";
			if (result == -1) {
				message = "아이디가 존재하지 않습니다.";
			}
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='pro';");
			out.println("</script>");
			out.close();
			return null;
		}
	}


}
