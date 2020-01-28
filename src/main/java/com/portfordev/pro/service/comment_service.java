package com.portfordev.pro.service;

import java.util.List;

import com.portfordev.pro.domain.Comment;

public interface comment_service {
		//글의 갯수 구하기
		public int getListCount(int BOARD_ID);
		public List<Comment> get_list(int BOARD_ID);
		public int comment_insert(Comment co);
		public int comment_update(Comment co);
		public int comment_delete(int id);
		public List<String> get_distinct_list(int BOARD_ID);
}
