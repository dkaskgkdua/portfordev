package com.portfordev.pro.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.portfordev.pro.domain.Feedback;
import com.portfordev.pro.domain.Feedback_recommend;
import com.portfordev.pro.service.MemberService;
import com.portfordev.pro.service.feedback_service;

@Controller
public class feedback_controller
{

	@Autowired
	private MemberService member_service;
	@Autowired
	private feedback_service fb_service;
	
	// 포트폴리오 id 로 피드백 정보가져오기
	// 피드백 베스트3 가져오기
	@ResponseBody
	@PostMapping("/portfolio/getBest3Feedback")
	public List<Feedback> getBest3Feedback(@RequestParam("PORT_ID") int PORT_ID, HttpSession session) throws ParseException{
		List<Feedback> feedbackList = fb_service.getBest3Feedback(PORT_ID);
		for(Feedback feedback : feedbackList)
		{
			int FEED_RECOM = 0;
			if(session.getAttribute("id") != null) {
				Map<String, String> frchk = new HashMap<String, String>();
				frchk.put("FEEDBACK_ID", ""+feedback.getFEEDBACK_ID());
				frchk.put("MEMBER_ID", (String)session.getAttribute("id"));
				FEED_RECOM = fb_service.checkRecomFeedback(frchk);
			}
			Feedback FEED_WRITER_INFO = fb_service.getFeedWriter(feedback.getFEEDBACK_ID());
			String FEED_WRITER = FEED_WRITER_INFO.getFEED_WRITER();
			String FEED_WRITER_IMG = FEED_WRITER_INFO.getFEED_WRITER_IMG();
			if(FEED_WRITER_IMG.equals("none"))
				FEED_WRITER_IMG = "/pro/resources/Image/userdefault.png";
			int FEED_WRITER_SCORE = FEED_WRITER_INFO.getFEED_WRITER_SCORE();
			String date = fb_service.replaceDate(feedback.getFEEDBACK_ID());
			date = replaceDate(date);
			feedback.setFEED_RECOM(FEED_RECOM);
			feedback.setFEED_WRITER(FEED_WRITER);
			feedback.setFEED_WRITER_IMG(FEED_WRITER_IMG);
			feedback.setFEED_WRITER_SCORE(FEED_WRITER_SCORE);
			feedback.setFEED_WRITTEN(date);
		}
		return feedbackList;
	}
	// 피드백 리스트 가져오기
	@ResponseBody
	@PostMapping("/portfolio/getFeedbacks")
	public List<Feedback> getFeedbacks(	@RequestParam("PORT_ID") int PORT_ID, 
										@RequestParam("feedPick") String feedPick, 
										@RequestParam("feedOrder") String feedOrder,
										HttpSession session) throws ParseException{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("PORT_ID", ""+PORT_ID);
		map.put("feedPick", feedPick);
		map.put("feedOrder", feedOrder);
		List<Feedback> feedbackList = fb_service.getFeedbackList(map);
		for(Feedback feedback : feedbackList)
		{
			int FEED_RECOM = 0;
			if(session.getAttribute("id") != null) {
				Map<String, String> frchk = new HashMap<String, String>();
				frchk.put("FEEDBACK_ID", ""+feedback.getFEEDBACK_ID());
				frchk.put("MEMBER_ID", (String)session.getAttribute("id"));
				FEED_RECOM = fb_service.checkRecomFeedback(frchk);
			}
			Feedback FEED_WRITER_INFO = fb_service.getFeedWriter(feedback.getFEEDBACK_ID());
			String FEED_WRITER = FEED_WRITER_INFO.getFEED_WRITER();
			String FEED_WRITER_IMG = FEED_WRITER_INFO.getFEED_WRITER_IMG();
			if(FEED_WRITER_IMG.equals("none"))
				FEED_WRITER_IMG = "/pro/resources/Image/userdefault.png";
			int FEED_WRITER_SCORE = FEED_WRITER_INFO.getFEED_WRITER_SCORE();
			String date = fb_service.replaceDate(feedback.getFEEDBACK_ID());
			date = replaceDate(date);
			feedback.setFEED_RECOM(FEED_RECOM);
			feedback.setFEED_WRITER(FEED_WRITER);
			feedback.setFEED_WRITER_IMG(FEED_WRITER_IMG);
			feedback.setFEED_WRITER_SCORE(FEED_WRITER_SCORE);
			feedback.setFEED_WRITTEN(date);
		}
		return feedbackList;
	}
	// 피드백 작성하기
	@ResponseBody
	@PostMapping("/portfolio/writeFeedback")
	public int writeFeedback(	@RequestParam("PORT_ID") int PORT_ID, 
								@RequestParam("MEMBER_ID") String MEMBER_ID, 
								@RequestParam("FEEDBACK_CONTENT") String FEEDBACK_CONTENT) {
		Feedback feedback = new Feedback();
		feedback.setPORT_ID(PORT_ID);
		FEEDBACK_CONTENT = replaceParameter(FEEDBACK_CONTENT);
		feedback.setFEEDBACK_CONTENT(FEEDBACK_CONTENT);
		feedback.setMEMBER_ID(MEMBER_ID);
		int result = fb_service.insertFeedback(feedback); 
		if(result == 1)
			member_service.add_write_act(MEMBER_ID, 20);
		return result;
	}
	// 피드백 수정하기
	@ResponseBody
	@PostMapping("/portfolio/updateFeedback")
	public Feedback updateFeedback(@RequestParam("FEEDBACK_ID") int FEEDBACK_ID, HttpSession session) {
		if(session.getAttribute("id") != null)
			return null;
		Feedback feedback = fb_service.selectFeedback(FEEDBACK_ID);
		if(!session.getAttribute("id").equals(feedback.getMEMBER_ID()))
			return null;
		return feedback;
	}
	// 피드백 수정 시도
	@ResponseBody
	@PostMapping("/portfolio/updateProcessFeedback")
	public int updateProcessFeedback(	@RequestParam("FEEDBACK_ID") int FEEDBACK_ID, 
										@RequestParam("PORT_ID") int PORT_ID, 
										@RequestParam("MEMBER_ID") String MEMBER_ID, 
										@RequestParam("FEEDBACK_CONTENT") String FEEDBACK_CONTENT) {
		Feedback feedback = new Feedback();
		feedback.setFEEDBACK_ID(FEEDBACK_ID);
		feedback.setPORT_ID(PORT_ID);
		FEEDBACK_CONTENT = replaceParameter(FEEDBACK_CONTENT);
		feedback.setFEEDBACK_CONTENT(FEEDBACK_CONTENT);
		feedback.setMEMBER_ID(MEMBER_ID);
		fb_service.resetRecomFeedback(FEEDBACK_ID);
		return fb_service.updateFeedback(feedback);
	}
	// 피드백 삭제
	@ResponseBody
	@PostMapping("/portfolio/deleteFeedback")
	public int deleteFeedback(	@RequestParam("FEEDBACK_ID") int FEEDBACK_ID, HttpSession session, 
								@RequestParam("MEMBER_ID") String MEMBER_ID) {
		if(session.getAttribute("id") == null)
			return 2;	// 로그인 필요
		if(!MEMBER_ID.equals(fb_service.getFeedWriter(FEEDBACK_ID).getMEMBER_ID()))
			return 3;	// 삭제 권한이 없음
		return fb_service.deleteFeedback(FEEDBACK_ID);
	}
	// 피드백 추천, 취소
	@ResponseBody
	@PostMapping("/portfolio/recommendFeedback")
	public int recommendFeedback(	@RequestParam("FEEDBACK_ID") int FEEDBACK_ID,
									@RequestParam("MEMBER_ID") String MEMBER_ID) {
		Feedback_recommend feed_recommend = new Feedback_recommend();
		feed_recommend.setFEEDBACK_ID(FEEDBACK_ID);
		feed_recommend.setMEMBER_ID(MEMBER_ID);
		Map<String, String> frchk = new HashMap<String, String>();
		frchk.put("FEEDBACK_ID", ""+FEEDBACK_ID);
		frchk.put("MEMBER_ID", MEMBER_ID);
		int fr = fb_service.checkRecomFeedback(frchk);
		if(fr == 0)
			return fb_service.recommendFeedback(feed_recommend);
		else
			return fb_service.cancelRecomFeedback(feed_recommend);
	}
	// 스크립트 공격 방지 해로운 문자열을 변환시켜주는 메서드
    private String replaceParameter(String param)
    {
    	param = param.replaceAll("&", "&amp;");
    	param = param.replaceAll("<", "&lt;");
    	param = param.replaceAll(">", "&gt;");
    	param = param.replaceAll("\'", "&#x27;");
    	param = param.replaceAll("/", "&#x2F;");
    	param = param.replaceAll("\\(", "&#40;");
    	param = param.replaceAll("\\)", "&#41;");
    	param = param.replaceAll("\"", "&quot;");
    	return param;
    }
    // 등록 날짜를 변환해주는 메서드
    private String replaceDate(String regidate) throws ParseException
    {
    	SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date parsedRegi = fm.parse(regidate);
		
		long now = Calendar.getInstance().getTimeInMillis();
		long timeRegidate = parsedRegi.getTime();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = dateFormat.format(timeRegidate);
		long diffSec = (now - timeRegidate) / 1000;
		// 60초 이하
		if(diffSec < 60)
			strDate = "방금 전";
		// 60분 이하
		else if(diffSec < 3600)
			strDate = (diffSec / 60) + "분 전";
		// 하루 이하
		else if(diffSec < 86400)
			strDate = (diffSec / 60 / 60) + "시간 전";
		// 2일 이하
		else if(diffSec < 172800)
			strDate = "하루 전";
		else if(diffSec < 604800)
			strDate = (diffSec / 60 / 60 / 24) + "일 전";
		return strDate;
    }
}