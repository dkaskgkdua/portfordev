package com.portfordev.pro.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfordev.pro.dao.feedback_dao;
import com.portfordev.pro.domain.Feedback;
import com.portfordev.pro.domain.Feedback_recommend;

@Service
public class feedback_service_impl implements feedback_service
{
	@Autowired
	private feedback_dao dao;
	// 피드백 수 가져오기
	@Override
	public int getFeedbackCount(int PORT_ID) {
		return dao.getFeedbackCount(PORT_ID);
	}
	// 피드백 베스트 3 가져오기
	public List<Feedback> getBest3Feedback(int PORT_ID){
		return dao.getBest3Feedback(PORT_ID);
	}
	// 피드백 리스트 가져오기
	@Override
	public List<Feedback> getFeedbackList(Map<String, String> map){
		return dao.getFeedbackList(map);
	}
	// 피드백 작성하기
	@Override
	public int insertFeedback(Feedback feedback) {
		return dao.insertFeedback(feedback);
	}
	// 피드백 정보 가져오기
	@Override
	public Feedback selectFeedback(int FEEDBACK_ID) {
		return dao.selectFeedback(FEEDBACK_ID);
	}
	// 피드백 수정하기
	@Override
	public int updateFeedback(Feedback feedback) {
		return dao.updateFeedback(feedback);
	}
	// 피드백 삭제하기
	@Override
	public int deleteFeedback(int FEEDBACK_ID) {
		return dao.deleteFeedback(FEEDBACK_ID);
	}
	// 피드백 추천 유무 확인
	@Override
	public int checkRecomFeedback(Map<String, String> map) {
		return dao.checkRecomFeedback(map);
	}
	// 피드백 추천하기
	@Override
	public int recommendFeedback(Feedback_recommend feed_recommend) {
		return dao.recommendFeedback(feed_recommend);
	}
	// 피드백 추천 취소
	@Override
	public int cancelRecomFeedback(Feedback_recommend feed_recommend) {
		return dao.cancelRecomFeedback(feed_recommend);
	}
	// 피드백 추천 초기화
	@Override
	public int resetRecomFeedback(int FEEDBACK_ID) {
		return dao.resetRecomFeedback(FEEDBACK_ID);
	}
	// 피드백 추천 리스트
	@Override
	public List<Feedback_recommend> getFeedRecommendList(String MEMBER_ID){
		return dao.getFeedRecommendList(MEMBER_ID);
	}
	// 피드백 writer info
	@Override
	public Feedback getFeedWriter(int FEEDBACK_ID) {
		return dao.getFeedWriter(FEEDBACK_ID);
	}
	@Override
	public Feedback getFeedWriter(String MEMBER_ID) {
		return dao.getFeedWriter(MEMBER_ID);
	}
	// 피드백 date 변환
	@Override
	public String replaceDate(int FEEDBACK_ID) {
		return dao.replaceDate(FEEDBACK_ID);
	}
}
