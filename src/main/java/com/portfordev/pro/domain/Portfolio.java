package com.portfordev.pro.domain;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.annotation.JsonSetter;
import lombok.Data;
@Data
public class Portfolio
{
	@JsonSetter("PORT_ID")
	private int PORT_ID;
	@JsonSetter("MEMBER_ID")
	private String MEMBER_ID;
	@JsonSetter("PORT_SUBJECT")
	private String PORT_SUBJECT;
	@JsonSetter("PORT_CONTENT")
	private String PORT_CONTENT;
	@JsonSetter("PORT_FILE_PATH")
	private String PORT_FILE_PATH;
	@JsonSetter("PORT_ORI_FILE")
	private String PORT_ORI_FILE;
	@JsonSetter("PORT_START_DAY")
	private Date PORT_START_DAY;
	@JsonSetter("PORT_END_DAY")
	private Date PORT_END_DAY;
	@JsonSetter("PORT_TEAM")
	private int PORT_TEAM;
	@JsonSetter("PORT_GITHUB")
	private String PORT_GITHUB;
	@JsonSetter("PORT_SITE")
	private String PORT_SITE;
	@JsonSetter("PORT_SHOW")
	private int PORT_SHOW;
	@JsonSetter("PORT_FEED_NEED")
	private int PORT_FEED_NEED;
	@JsonSetter("PORT_REGIDATE")
	private Date PORT_REGIDATE;
	@JsonSetter("PORT_READCOUNT")
	private int PORT_READCOUNT;
	@JsonSetter("PORT_UPLOADFILE")
	List<MultipartFile> PORT_UPLOADFILE;
	// 포트폴리오 썸네일
	@JsonSetter("PORT_THUMBNAIL")
	private String PORT_THUMBNAIL;
	// 포트폴리오 이미지 파일들
	@JsonSetter("PORT_IMG_FILES")
	private String PORT_IMG_FILES;
	// 포트폴리오 추천 유무 확인
	@JsonSetter("PORT_RECOM")
	private int PORT_RECOM = 0;
	// 포트폴리오 스크랩 유무 확인
	@JsonSetter("PORT_SCRAP")
	private int PORT_SCRAP = 0;
	// 포트폴리오 작성자 닉네임
	@JsonSetter("PORT_WRITER")
	private String PORT_WRITER;
	// 포트폴리오 작성자 직업
	@JsonSetter("PORT_WRITER_JOB")
	private String PORT_WRITER_JOB;
	// 포트폴리오 작성자 프로필 이미지
	@JsonSetter("PORT_WRITER_IMG")
	private String PORT_WRITER_IMG;
	// 포트폴리오 추천 수
	@JsonSetter("PORT_LIKECOUNT")
	private int PORT_LIKECOUNT = 0;
	// 포트폴리오 피드백 수
	@JsonSetter("PORT_FEEDCOUNT")
	private int PORT_FEEDCOUNT = 0;
	// 포트폴리오 작성일 변환
	@JsonSetter("PORT_WRITTEN")
	private String PORT_WRITTEN;
	// 프로젝트 시작일 변환
	@JsonSetter("PORT_START")
	private String PORT_START;
	// 프로젝트 종료일 변환
	@JsonSetter("PORT_END")
	private String PORT_END;
}
