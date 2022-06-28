package com.metaus.comment.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDAO {
	int insertComment(CommentVO vo);
	List<CommentVO> selectComment(int boardNo);
	int deleteComment(int cmtNo);
	int countComment(int boardNo);
}
