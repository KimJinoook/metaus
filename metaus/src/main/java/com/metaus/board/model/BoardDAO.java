package com.metaus.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.member.model.MemberVO;

@Mapper
public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	List<Map<String, Object>> selectBoard(int btypeNo);
}
