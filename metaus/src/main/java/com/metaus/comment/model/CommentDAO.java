package com.metaus.comment.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDAO {
	int insertComment(CommentVO vo);
	List<Map<String, Object>> selectComment(int boardNo);
	int deleteComment(int cmtNo);
	int countComment(int boardNo);
}
