package com.portfordev.pro.domain;

import lombok.Data;
import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonSetter;

@Data
public class Feedback
{
	@JsonSetter("FEEDBACK_ID")
	private int FEEDBACK_ID;
	@JsonSetter("PORT_ID")
	private int PORT_ID;
	@JsonSetter("MEMBER_ID")
	private String MEMBER_ID;
	@JsonSetter("FEEDBACK_CONTENT")
	private String FEEDBACK_CONTENT;
	@JsonSetter("FEEDBACK_DATE")
	private Date REG_DATE;
	// 피드백 추천 수
	@JsonSetter("FEED_LIKECOUNT")
	private int FEED_LIKECOUNT;
	// 피드백 작성자 닉네임
	@JsonSetter("FEED_WRITER")
	private String FEED_WRITER;
	// 피드백 작성자 프로필 이미지
	@JsonSetter("FEED_WRITER_IMG")
	private String FEED_WRITER_IMG;
	// 피드백 작성자 활동 점수
	@JsonSetter("FEED_WRITER_SCORE")
	private int FEED_WRITER_SCORE;
	// 피드백 추천 유무
	@JsonSetter("FEED_RECOM")
	private int FEED_RECOM = 0;
	// 피드백 작성일 변환
	@JsonSetter("FEED_WRITTEN")
	private String FEED_WRITTEN;
}
