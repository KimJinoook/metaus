package com.metaus.comment.model;

import java.util.List;

public interface CommentService {
	int insertComment(CommentVO vo);
	List<CommentVO> selectComment(int boardNo);
	int deleteComment(int cmtNo);
	int countComment(int boardNo);
}
