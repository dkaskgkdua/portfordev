package com.portfordev.pro.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Board_file;
import com.portfordev.pro.domain.Board_recommend;

@Repository
public class board_dao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(Map<String, Object> map) {
		if(map.get("field2").equals("")) {
			return sqlSession.selectOne("Boards.count", map);
		} else { // 제목+내용일 경우
			return sqlSession.selectOne("Boards.countOR", map);
		}
	}
	public List<Board> getBoardList(Map<String, Object> map) {
		if(map.get("field2").equals("")) {
			return sqlSession.selectList("Boards.list", map);
		} else { // 제목+내용일 경우
			return sqlSession.selectList("Boards.listOR", map);
		}
		
	}
	public int set_readcount_update(int num) {
		return sqlSession.update("Boards.readcount_update", num);
	}
	
	public Board get_board(int num) {
		return sqlSession.selectOne("Boards.get_board", num);
	}
	public void insert_board(Board board) {
		System.out.println(board.getBOARD_CONTENT());
		sqlSession.insert("Boards.insert", board);
	}
	public void insert_file(Board_file board_file) {
		sqlSession.insert("Boards.insert_file", board_file);
	}
	public int select_max_id() {
		return sqlSession.selectOne("Boards.select_max_id");
	}
	public List<Board_recommend> get_reco_list(int board_id) {
		return sqlSession.selectList("Boards.get_reco_list", board_id);
	}
	public List<Board_file> get_file_list(int board_id) {
		return sqlSession.selectList("Boards.get_file_list", board_id);
	}
	public int get_reco_count(int board_id) {
		return sqlSession.selectOne("Boards.get_reco_count", board_id);
	}
	public void insert_reco(Map<String, Object> map) {
		System.out.println(sqlSession.insert("Boards.insert_reco", map));
	}
	public void delete_reco(Map<String, Object> map) {
		System.out.println(sqlSession.delete("Boards.delete_reco", map));
	}
	public int insert_board_reply(Board board) {
		return sqlSession.insert("Boards.insert_board_reply", board);
	}
	//미구현
	
	public int edit_board(Board edit_board) {
		return sqlSession.update("Boards.board_edit", edit_board);
	}
	public int board_delete(Board board) {
		return sqlSession.delete("Boards.board_delete", board);
	}
	
	public int boardReplyUpdate(Board board) {
		return sqlSession.update("Boards.reply_update", board);
	}
	public Board isBoardWriter(Map map) {
		return sqlSession.selectOne("Boards.BoardWriter", map);
	}
	public void insert_deleteFile(String before_file) {
		sqlSession.insert("Boards.insert_deleteFile",before_file);
	}
	public void delete_board_file(int board_id) {
		sqlSession.delete("Boards.delete_board_file", board_id);
	}
	public List<String> select_file(int board_id) {
		return sqlSession.selectList("Boards.get_file_list_name", board_id);
	}
	public List<String> select_delete_file() {
		List<String> list = sqlSession.selectList("Boards.delete_file");
		sqlSession.delete("Boards.delete_delete_file");
		return list;
	}
	// board_id를 참조하는 게시판 리스트 불러오기(id)
	public List<Integer> get_board_reg(int board_id) {
		return sqlSession.selectList("Boards.get_board_reg", board_id);
	}
}
