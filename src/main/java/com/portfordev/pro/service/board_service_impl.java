package com.portfordev.pro.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.portfordev.pro.dao.board_dao;
import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Board_file;
import com.portfordev.pro.domain.Board_recommend;
@Service
public class board_service_impl implements board_service{
	@Autowired
	private board_dao dao;
	
	@Override
	public void insert_deleteFile(String before_file) {
		dao.insert_deleteFile(before_file);
	}
	@Override
	public void delete_file(String saveFolder) {
		List<String> list = dao.select_delete_file();
		
		
		list.forEach(item -> {
			String path = saveFolder + item;
			File file = new File(path);
			if(file.exists() == true) {
				if(file.delete()) {
					System.out.println("파일 삭제");
				}
			}
		});
		
		
	}
	@Override
	public int getListCount(int search_select, String search_text, int BOARD_CATEGORY) {
		Map<String, Object> map = new HashMap<String, Object>();
		String field = "";
		String field2 = "";
		switch(search_select) {
		case 0:  //작성자
			field = "MEMBER_ID";
			break;
		case 1:  //제목
			field = "BOARD_SUBJECT";
			break;
		case 2:   //내용
			field = "BOARD_CONTENT";
			break;
		case 3:   //제목+내용
			field = "BOARD_SUBJECT";
			field2 = "BOARD_CONTENT";
			break;
		}
		System.out.println(field);
		map.put("BOARD_CATEGORY", BOARD_CATEGORY);
		map.put("field", field);
		map.put("field2", field2);
		map.put("text", search_text);
		return dao.getListCount(map);
	}
	@Override
	public List<Board> getBoardList(int page, int limit, int search_select, String search_text, int BOARD_CATEGORY) {
		Map<String, Object> map = new HashMap<String, Object>();
		String field = "";
		String field2 = "";
		switch(search_select) {
		case 0:  //작성자
			field = "MEMBER_ID";
			break;
		case 1:  //제목
			field = "BOARD_SUBJECT";
			break;
		case 2:   //내용
			field = "BOARD_CONTENT";
			break;
		case 3:   //제목+내용
			field = "BOARD_SUBJECT";
			field2 = "BOARD_CONTENT";
			break;
		}
		
		System.out.println(field);
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("BOARD_CATEGORY", BOARD_CATEGORY);
		map.put("field2", field2);
		map.put("field",field);
		map.put("text", search_text);
		map.put("start", startrow);
		map.put("end", endrow);
		
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String str_today = format.format(time);
		String[] today_array = str_today.split("-");
		List<Board> list = dao.getBoardList(map);
		
		list.forEach(item -> {
			String[] data = item.getBOARD_DATE().substring(0, 10).split("-");
			if(Integer.parseInt(today_array[0]) == Integer.parseInt(data[0]) 
					&& Integer.parseInt(today_array[1]) == Integer.parseInt(data[1])
					&& Integer.parseInt(today_array[2]) == Integer.parseInt(data[2])) {
				item.setBOARD_DATE(item.getBOARD_DATE().substring(11, 16));
			} else {
				item.setBOARD_DATE(item.getBOARD_DATE().substring(0, 10));
			}
		});
		return list;
		
	}
	
	@Override
	public int setReadCountUpdate(int num) {
		return dao.set_readcount_update(num);
	}
	
	@Override
	public Board getDetail(int num) {
		if(setReadCountUpdate(num)!=1)
			return null;
		return dao.get_board(num);
	}
	@Override
	public List<Board_recommend> get_reco_list(int board_id) {
		return dao.get_reco_list(board_id);
	}
	
	@Override
	public List<Board_file> get_file_list(int board_id) {
		return dao.get_file_list(board_id);
	}
	
	
	@Override
	@Transactional
	public int boardReply(Board board) {
		boardReplyUpdate(board);
		board.setBOARD_RE_LEV(board.getBOARD_RE_LEV()+1);
		board.setBOARD_RE_SEQ(board.getBOARD_RE_SEQ()+1);
		return dao.boardReply(board);
	}
	@Override
	public int boardModify(Board modifyboard) {
		return dao.boardModify(modifyboard);
	}
	@Override
	public int boardDelete(int num) {
		int result =0;
		Board board = dao.get_board(num);
		if(board != null) {
			result = dao.boardDelete(board);
		}
		return result;
	}
	@Override
	public boolean isBoardWriter(int num, String pass) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("pass", pass);
		Board result = dao.isBoardWriter(map);
		if(result == null)
			return false;
		else
			return true;
	}
	@Override
	public void insert_board(Board board) {
		dao.insert_board(board);
	}
	@Override
	public int boardReplyUpdate(Board board) {
		return dao.boardReplyUpdate(board);
	}
	@Override
	public void insert_file(Board_file board_file) {
		dao.insert_file(board_file);
	}
	@Override
	public int select_max_id() {
		return dao.select_max_id();
	}
}
