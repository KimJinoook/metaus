package com.metaus.comment.model;

import java.util.List;
import java.util.Map;

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
	public int deleteComment(int cmtNo) {
		return commentDao.deleteComment(cmtNo);
	}

	@Override
	public int countComment(int boardNo) {
		return commentDao.countComment(boardNo);
	}



	@Override
	public List<Map<String, Object>> selectComment(int boardNo) {
		return commentDao.selectComment(boardNo);
	}



	@Override
	public int updateComment(CommentVO vo) {
		return commentDao.updateComment(vo);
	}

	@Override
	public int reply(CommentVO vo) {
		return commentDao.reply(vo);
	}
	
	
}
