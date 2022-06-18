package com.metaus.board.model;

import java.util.List;
import java.util.Map;

import com.metaus.member.model.MemberVO;

public interface BoardService {
	int insertBoard(BoardVO boardVo);
	List<Map<String, Object>> selectBoard(int btypeNo);
}
