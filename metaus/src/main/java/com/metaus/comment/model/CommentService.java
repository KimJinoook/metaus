package com.metaus.comment.model;

import java.util.List;
import java.util.Map;

public interface CommentService {
	int insertComment(CommentVO vo);
	List<Map<String, Object>> selectComment(int boardNo);
	int deleteComment(int cmtNo);
	int countComment(int boardNo);
}
