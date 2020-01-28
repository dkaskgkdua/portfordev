package com.portfordev.pro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import com.portfordev.pro.domain.Feedback;
import com.portfordev.pro.domain.Feedback_recommend;

@Repository
public class feedback_dao 
{
	@Autowired
	private SqlSessionTemplate sqlSession;
	// 피드백 count
	public int getFeedbackCount(int PORT_ID) {
		return sqlSession.selectOne("Feedbacks.count", PORT_ID);
	}
	// 피드백 best3
	public List<Feedback> getBest3Feedback(int PORT_ID){
		return sqlSession.selectList("Feedbacks.best3", PORT_ID);
	}
	// 피드백 list
	public List<Feedback> getFeedbackList(Map<String, String> map){
		return sqlSession.selectList("Feedbacks.list", map);
	}
	// 피드백 insert
	public int insertFeedback(Feedback feedback) {
		return sqlSession.insert("Feedbacks.insert", feedback);
	}
	// 피드백 select
	public Feedback selectFeedback(int FEEDBACK_ID) {
		return sqlSession.selectOne("Feedbacks.select", FEEDBACK_ID);
	}
	// 피드백 update
	public int updateFeedback(Feedback feedback) {
		return sqlSession.update("Feedbacks.update", feedback);
	}
	// 피드백 delete
	public int deleteFeedback(int FEEDBACK_ID) {
		return sqlSession.delete("Feedbacks.delete", FEEDBACK_ID);
	}
	// 피드백 추천 select
	public int checkRecomFeedback(Map<String, String> map) {
		return sqlSession.selectOne("Feedbacks.recommend_check", map);
	}
	// 피드백 추천 insert
	public int recommendFeedback(Feedback_recommend feed_recommend) {
		return sqlSession.insert("Feedbacks.recommend", feed_recommend);
	}
	// 피드백 추천 delete
	public int cancelRecomFeedback(Feedback_recommend feed_recommend) {
		return sqlSession.delete("Feedbacks.recommend_cancel", feed_recommend);
	}
	// 피드백 추천 reset
	public int resetRecomFeedback(int FEEDBACK_ID) {
		return sqlSession.delete("Feedbacks.recommend_reset", FEEDBACK_ID);
	}
	// 피드백 추천 list
	public List<Feedback_recommend> getFeedRecommendList(String MEMBER_ID){
		return sqlSession.selectList("Feedbacks.recommend_list", MEMBER_ID);
	}
	// 피드백 writer info
	public Feedback getFeedWriter(int FEEDBACK_ID) {
		return sqlSession.selectOne("Feedbacks.feed_writer", FEEDBACK_ID);
	}
	// 피드백 date 변환
	public String replaceDate(int FEEDBACK_ID) {
		return sqlSession.selectOne("Feedbacks.feed_date", FEEDBACK_ID);
	}
}
