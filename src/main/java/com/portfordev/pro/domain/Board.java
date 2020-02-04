package com.portfordev.pro.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {
	private int BOARD_ID;
	private String MEMBER_ID;
	private String BOARD_CATEGORY;
	private String BOARD_PASSWORD;
	private String BOARD_SUBJECT;
	private String BOARD_CONTENT;
	private int BOARD_RE_REF;
	private int BOARD_RE_LEV;
	private int BOARD_RE_SEQ;
	private int BOARD_READCOUNT;
	private String BOARD_DATE;
	
	
	private String MEMBER_NAME;
	private int MEMBER_ACT;
	private int BOARD_RECO;
	private String BOARD_COMMENT;
	List<MultipartFile> uploadfile;
	// qna_board_write.jsp에서 name 속성을 확인해야 한다.
	// <input type="file" id ="upfile" name="uploadfile"> 확인
	
}
