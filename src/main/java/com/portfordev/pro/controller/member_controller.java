package com.portfordev.pro.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfordev.pro.domain.Member;
import com.portfordev.pro.service.MemberService;
import com.portfordev.pro.task.VerifyRecaptcha;

@Controller
public class member_controller {

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
	
	@GetMapping("mypage")
	public ModelAndView mypage(HttpServletResponse response, HttpSession session, ModelAndView mv) throws Exception { 
		if(session.getAttribute("id")==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 해주세요.');");
			out.println("location.href='login';");
			out.println("</script>");
			out.close();
			return null;
		} else {
			mv.setViewName("member/mypage_form");
		}
		
		return mv;
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
		String salt = memberservice.get_salt(id);
		int result = memberservice.isId(id, ""+(salt+password).hashCode());
		
		if (result == 1) {
			String nickname = memberservice.get_name(id);
			session.setAttribute("id", id);
			session.setAttribute("nickname", nickname);
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
	
	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
	    VerifyRecaptcha.setSecretKey("6LfgOM4UAAAAAAlpZXseeiF3zzHxqVUi_WEq3w-_");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    System.out.println(gRecaptchaResponse);
	    //0 = 성공, 1 = 실패, -1 = 오류
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse))
	          return 0;
	       else return 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
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
		Random r = new Random();
		String salt = "";
		for(int salt_index = 0; salt_index <5; salt_index++) {
			salt += String.valueOf((char) ((int) (r.nextInt(26)) + 97));
		}
		member.setMEMBER_PASSWORD_SALT(salt);
		member.setMEMBER_PASSWORD(""+(salt+member.getMEMBER_PASSWORD()).hashCode());
		System.out.println(member);
		int result = memberservice.insert(member);
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (result == 1) {
			if(auth.equals("auth")) {
				String nickname = memberservice.get_name(member.getMEMBER_ID());
				session.setAttribute("id", member.getMEMBER_ID());
				session.setAttribute("nickname", nickname);
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
			mv.addObject("error", "삽입 중 오류가 발생했습니다.");
			mv.setViewName("error");
		}
		return mv;
	}
}