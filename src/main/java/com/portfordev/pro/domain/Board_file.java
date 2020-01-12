package com.portfordev.pro.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board_file {
	private int BOARD_FILE_ID;
	private int BOARD_ID;
	private String BOARD_FILE;
	private String BOARD_FILE_ORIGINAL;
	private List<MultipartFile> uploadfile;
}
