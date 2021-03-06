package com.portfordev.pro.service;

import java.util.List;

import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Board_file;
import com.portfordev.pro.domain.Board_recommend;

public interface board_service {
		// 글 목록
		public List<Board> getBoardList(int page, int limit, int search_select, String search_text, int category, String sort);
		// 글 갯수
		public int getListCount(int search_select, String search_text, int category);
		// 글 내용
		public Board getDetail(int num);
		// 글 답변
		public int insert_board_Reply(Board board);
		// 글 수정
		public int board_edit(Board edit_board);
		// 글 삭제
		public int board_delete(int board_id, String save_folder);
		// 조회수 업데이트
		public int setReadCountUpdate(int num);
		// 글 등록하기
		public void insert_board(Board board);
		// 시퀀스 수정
		public int boardReplyUpdate(Board board);
		// 변경, 삭제 파일 목록에 추가
		public void insert_deleteFile(String before_file);
		// 수정, 삭제 했던 파일 목록에 있는 것 삭제
		public void delete_file(String saveFolder);
		// 파일 업로드
		public void insert_file(Board_file board_file);
		// 게시판 마지막번호
		public int select_max_id();
		// 게시판 추천 리스트
		public List<Board_recommend> get_reco_list(int board_id);
		// 게시판 첨부파일 리스트
		public List<Board_file> get_file_list(int board_id);
		// 추천 카운트 반환
		public int get_reco_count(int board_id);
		// 추천 삽입
		public void insert_reco(int board_id, String member_id);
		// 추천 삭제
		public void delete_reco(int board_id, String member_id);
		// 비밀번호 체크
		public int is_password(int id, String password);
		// 파일 삭제
		public void delete_board_file(int board_id, String save_folder);
		// 파일 리스트 검색(회원)
		public List<Integer> get_all_board_list(String member_id);
}
