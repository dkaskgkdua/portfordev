package com.portfordev.pro.service;

import java.util.List;

import com.portfordev.pro.domain.Board;
import com.portfordev.pro.domain.Member;
import com.portfordev.pro.domain.Portfolio;

public interface search_service {
	public List<Member>searchMember(String search);
	public List<Board> searchBoard(String search);
	public List<Board>searchStudy(String search);
	public List<Board> searchQnA(String search);
	public List<Portfolio> searchPort(String search);

}
