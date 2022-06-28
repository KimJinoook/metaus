package com.metaus.comment.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {
	
	private final CommentDAO commentDao;

	@Override
	public int insertComment(CommentVO vo) {
		return commentDao.insertComment(vo);
	}

	@Override
	public List<CommentVO> selectComment(int boardNo) {
		return commentDao.selectComment(boardNo);
	}

	@Override
	public int deleteComment(int cmtNo) {
		return commentDao.deleteComment(cmtNo);
	}

	@Override
	public int countComment(int boardNo) {
		return commentDao.countComment(boardNo);
	}
	
	
}
