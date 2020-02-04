package com.portfordev.pro.service;

import java.util.List;
import java.util.Map;

import com.portfordev.pro.domain.Feedback;
import com.portfordev.pro.domain.Feedback_recommend;

public interface feedback_service 
{
	// 피드백 수 가져오기
	public int getFeedbackCount(int PORT_ID);
	// 피드백 베스트 3 가져오기
	public List<Feedback> getBest3Feedback(int PORT_ID);
	// 피드백 리스트 가져오기
	public List<Feedback> getFeedbackList(Map<String, String> map);
	// 피드백 작성
	public int insertFeedback(Feedback feedback);
	// 피드백 정보 가져오기
	public Feedback selectFeedback(int FEEDBACK_ID);
	// 피드백 수정시도
	public int updateFeedback(Feedback feedback);
	// 피드백 삭제
	public int deleteFeedback(int FEEDBACK_ID);
	// 피드백 추천 유무 확인
	public int checkRecomFeedback(Map<String, String> map);
	// 피드백 추천
	public int recommendFeedback(Feedback_recommend feed_recommend);
	// 피드백 추천 취소
	public int cancelRecomFeedback(Feedback_recommend feed_recommend);
	// 피드백 추천 초기화
	public int resetRecomFeedback(int FEEDBACK_ID);
	// 피드백 추천 리스트
	public List<Feedback_recommend> getFeedRecommendList(String MEMBER_ID);
	// 피드백 writer info
	public Feedback getFeedWriter(int FEEDBACK_ID);
	public Feedback getFeedWriter(String MEMBER_ID);
	// 피드백 date 변환
	public String replaceDate(int FEEDBACK_ID);
	// 중복 제외 피드백 id 리스트
	public List<String> get_distinct_list(int PORT_ID); 
}
