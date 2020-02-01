package com.portfordev.pro.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfordev.pro.domain.Alert;
import com.portfordev.pro.domain.Member;
import com.portfordev.pro.domain.Member_log;
import com.portfordev.pro.service.MemberService;
import com.portfordev.pro.service.log_service;
import com.portfordev.pro.task.VerifyRecaptcha;

@Controller
public class member_controller {

	@Autowired
	private MemberService member_service;
	@Autowired
	private log_service log_service;
	
	@ResponseBody
	@GetMapping("alert_check")
	public int alert_check(HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		int unread_count = log_service.get_unread_count(id);
		return unread_count;
	}
	
	@ResponseBody
	@GetMapping("alert_list")
	public Object alert_list(HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Alert> alert_list = log_service.get_alert_list(id);
		System.out.println(alert_list);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("alert_count", alert_list.size());
		map.put("alert_list", alert_list);
		log_service.update_alert(id);
		return map;
	}
	
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
	public ModelAndView mypage(@RequestParam("MEMBER_ID") String MEMBER_ID,
			@RequestParam(value="page", defaultValue="1", required = false) int page,
			HttpServletResponse response, HttpSession session, ModelAndView mv) throws Exception { 
		Member member = member_service.get_member(MEMBER_ID);
		int limit = 10;
		int list_count = log_service.get_log_count(MEMBER_ID);
		
		int max_page = (list_count + limit - 1) /limit;
		
		int start_page = ((page-1)/10)*10 +1;
		int end_page = start_page + 10 -1;
		
		if(end_page>max_page) end_page = max_page;
		System.out.println("11");
		List<Member_log> member_log_list = log_service.get_log_list(page, limit, MEMBER_ID);
		System.out.println("22");
		mv.setViewName("member/mypage_form");
		mv.addObject("MEMBER", member);
		mv.addObject("max_page", max_page);
		mv.addObject("start_page", start_page);
		mv.addObject("end_page", end_page);
		mv.addObject("page", page);
		mv.addObject("list_count", list_count);
		mv.addObject("member_log_list", member_log_list);
		mv.addObject("limit", limit);
		mv.addObject("menu", "최근활동");
		return mv;
	}
	@GetMapping("mypage/info")
	public ModelAndView info(@RequestParam("MEMBER_ID") String MEMBER_ID,
			HttpServletResponse response, HttpSession session, ModelAndView mv) throws Exception { 
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
			if(session.getAttribute("id").equals(MEMBER_ID)) { // id 일치 시
				Member member = member_service.get_member(MEMBER_ID);
				mv.setViewName("member/mypage_form");
				mv.addObject("menu", "정보수정");
				mv.addObject("MEMBER", member);
			} else { // id 불일치
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('올바르지 않은 접근입니다.');");
				out.println("location.href='pro';");
				out.println("</script>");
				out.close();
				return null;
			}
		}
		
		return mv;
	}
	@PostMapping("member_edit")
	public String member_edit(Member member, HttpServletResponse response, HttpSession session,
			@RequestParam(value="MEMBER_PASSWORD_CHECK", defaultValue="", required=false) String check, RedirectAttributes redirect) throws Exception {
		String salt = member_service.get_salt(member.getMEMBER_ID());
		if(check.equals("")) { // 단순 정보 변경
			System.out.println("test1");
			member_service.update_member(member);
			System.out.println("test2");
		} else { // + 비밀번호 변경
			System.out.println(member + " ch : " + check);
			int result = member_service.isId(member.getMEMBER_ID(), ""+(salt+member.getMEMBER_PASSWORD()).hashCode());
			if(result == 1) { // 아이디 비밀번호 일치
				member_service.update_member(member, check, salt);
			} else {
				String message = "비밀번호가 일치하지 않습니다.";
				if (result == -1) {
					message = "아이디가 존재하지 않습니다.";
				}
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('" + message + "');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}	
		}
		session.setAttribute("nickname", member.getMEMBER_NAME());
		redirect.addAttribute("MEMBER_ID", member.getMEMBER_ID());
		return "redirect:mypage/info";
	}
	@PostMapping("member_withdraw")
	public String member_withdraw(Member member, HttpServletResponse response, HttpSession session) throws Exception {
		String salt = member_service.get_salt(member.getMEMBER_ID());
		int result = member_service.isId(member.getMEMBER_ID(), ""+(salt+member.getMEMBER_PASSWORD()).hashCode());
		if(result == 1) {
			member_service.delete_member(member.getMEMBER_ID());
			session.invalidate();
		} else {
			String message = "비밀번호가 일치하지 않습니다.";
			if (result == -1) {
				message = "아이디가 존재하지 않습니다.";
			}
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}	
		return "redirect:pro";
	}
	
	@RequestMapping(value="/idcheck", method = RequestMethod.GET)
	public void idcheck(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		int result = member_service.isId(id);
		System.out.println(result);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("id") String id, @RequestParam("password") String password,
			@RequestParam(value="remember", defaultValue="") String remember, 
			HttpServletResponse response, HttpSession session) throws Exception {
		String salt = member_service.get_salt(id);
		int result = member_service.isId(id, ""+(salt+password).hashCode());
		
		if (result == 1) {
			String nickname = member_service.get_name(id);
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
		int result = member_service.insert(member);
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (result == 1) {
			if(auth.equals("auth")) {
				String nickname = member_service.get_name(member.getMEMBER_ID());
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
			
			int n = member_service.memberRegisterDept(paraMap);
			
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
