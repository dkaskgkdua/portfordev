package com.portfordev.pro.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Member;
import com.portfordev.pro.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, 
			@CookieValue(value="saveid", required=false) Cookie readCookie) {
		if(readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
		}
		mv.setViewName("member/login_form");
		return mv;
	}
	
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join() {
		return "member/join_form";
	}
	
	@RequestMapping(value="/idcheck", method = RequestMethod.GET)
	public void idcheck(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		int result = memberservice.isId(id);
		System.out.println(result);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("id") String id, @RequestParam("password") String password,
			@RequestParam(value="remember", defaultValue="") String remember, 
			HttpServletResponse response, HttpSession session) throws Exception {
		int result = memberservice.isId(id, password);
		if (result == 1) {
			session.setAttribute("id", id);
			Cookie savecookie = new Cookie("saveid", id);
			if(!remember.equals("")) {
				savecookie.setMaxAge(60*60);
				System.out.println("쿠키저장 : 60*60");
			} else {
				System.out.println("쿠키 저장 : 0");
				savecookie.setMaxAge(0);
			}
			response.addCookie(savecookie);
			
			System.out.println("로그인 성공");
			return "redirect:pro";
		} else {
			String message = "비밀번호가 일치하지 않습니다.";
			if (result == -1) {
				message = "아이디가 존재하지 않습니다.";
			}
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='login';");
			out.println("</script>");
			out.close();
			return null;
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletResponse response, HttpSession session) throws Exception {
		session.invalidate();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.');");
		out.println("location.href='login';");
		out.println("</script>");
		out.close();
		return null;
	}

	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
	public void joinProcess(Member member, HttpServletResponse response,  HttpSession session,
			@RequestParam(value="auth", defaultValue="") String auth) throws Exception {
		int result = memberservice.insert(member);
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (result == 1) {
			if(auth.equals("auth")) {
				session.setAttribute("id", member.getMEMBER_ID());
				out.println("alert('"+member.getMEMBER_NAME()+"님 환영합니다.');");
				out.println("location.href='pro';");
			} else {
				out.println("alert('가입성공');");
				out.println("location.href='login';");
			}
		} else if (result == -1) {
			out.println("alert('아이디 중복');");
			out.println("history.go(-1);");
		}
		out.println("</script>");
		out.close();

	}
	
	
	
	@RequestMapping(value = "/mybatistest/mybatisDeptinsert", method = {RequestMethod.POST})
	public ModelAndView mybatisDeptinsert(HttpServletRequest request, ModelAndView mv) {
		try {
			String deptno = request.getParameter("deptno");
			String loc = request.getParameter("loc");
			String dname = request.getParameter("dname");
			
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("deptno", deptno);
			paraMap.put("loc", loc);
			paraMap.put("dname", dname);
			
			int n = memberservice.memberRegisterDept(paraMap);
			
			String result = "";
			if(n == 1)
				result = "삽입 성공!!";
			else
				result = "삽입 실패!!";
			mv.addObject("result", result);
			mv.setViewName("memberRegisterDept");
		} catch(Exception e) {
			mv.addObject("error", "상ㅂ입 중 오류가 발생했습니다.");
			mv.setViewName("error");
		}
		return mv;
	}
}
