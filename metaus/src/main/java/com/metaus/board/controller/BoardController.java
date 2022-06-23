package com.metaus.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.board.model.BoardAtcVO;
import com.metaus.board.model.BoardService;
import com.metaus.board.model.BoardVO;
import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger
	=LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/notice")
	public String notice(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("qna 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		logger.info("qna 페이지, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("qna 목록 조회 결과, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(btypeNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("qna 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/notice";
	}
	
	@RequestMapping("/faq")
	public String faq(@ModelAttribute BoardVO boardVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("FAQ 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		
		List<BoardVO>list = boardService.selectBoardFaq(boardVo);
		logger.info("FAQ 목록 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/faq";
	}
	
	@RequestMapping("/news")
	public String news(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("qna 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		logger.info("qna 페이지, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("qna 목록 조회 결과, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(btypeNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("qna 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/news";
	}
	
	@RequestMapping("/freeBoard")
	public String freeBoard(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("qna 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		logger.info("qna 페이지, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("qna 목록 조회 결과, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(btypeNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("qna 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/freeBoard";
	}
	
	@RequestMapping("/QuestionBoard")
	public String QuestionBoard(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("qna 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		logger.info("qna 페이지, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("qna 목록 조회 결과, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(btypeNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("qna 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/QuestionBoard";
	}
	
	@RequestMapping("/qna")
	public String qna(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("qna 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		logger.info("qna 페이지, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("qna 목록 조회 결과, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(btypeNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("qna 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/qna";
	}


	@RequestMapping("/shareBoard")
	public String shareBoard(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("qna 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		logger.info("qna 페이지, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("qna 목록 조회 결과, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(btypeNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("qna 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/shareBoard";
	}
	
	@RequestMapping("/requestBoard")
	public String requestBoard(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("qna 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		logger.info("qna 페이지, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("qna 목록 조회 결과, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(btypeNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("qna 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("qna 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/requestBoard";
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite_get(@RequestParam(defaultValue = "0") int btypeNo,
			Model model) {
		logger.info("커뮤니티 글 작성 페이지, 파라미터 btypeNo={}",btypeNo);
		
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/boardWrite";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite_post(@RequestParam int btypeNo,
			@ModelAttribute BoardVO boardVo, 
			@ModelAttribute BoardAtcVO boardAtcVo,
			HttpServletRequest request, Model model) {
		logger.info("커뮤니티 글 작성 페이지, 파라미터 btypeNo={}", btypeNo);
		
		String fileName = "", originFileName = "";
		
		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);

			for (Map<String, Object> fileMap : fileList) {
				originFileName = (String) fileMap.get("originalFileName");
				fileName = (String) fileMap.get("fileName");
			}
			logger.info("파일 업로드 성공, fileName={}", fileName);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		boardVo.setBtypeNo(btypeNo);
		int cnt = boardService.insertBoard(boardVo);
		logger.info("글 작성 결과 조회, cnt={}", cnt);
		
		boardAtcVo.setBfileFilename(fileName);
		boardAtcVo.setBfileOriginname(originFileName);
		boardAtcVo.setBoardNo(boardVo.getBoardNo());
		
		int upload = boardService.insertBoardAtc(boardAtcVo);
		logger.info("파일 업로드 결과 조회, upload={}", upload);
		
		if(cnt>0) {
			logger.info("글 작성 성공!");
		}else {
			logger.info("글 작성 실패!");
		}
		
		
		if(btypeNo==3) {
			return "redirect:/board/qna?btypeNo=3";
		}else if(btypeNo==8) {
			return "redirect:/board/freeBoard?btypeNo=8";
		}else if(btypeNo==5) {
			return "redirect:/board/QuestionBoard?btypeNo=5";
		}else if(btypeNo==6) {
			return "redirect:/board/shareBoard?btypeNo=6";
		}else if(btypeNo==7) {
			return "redirect:/board/requestBoard?btypeNo=7";
		}
		return "/";
	}
	
	
	@RequestMapping("/readCountUp")
	public String readCountUp(@RequestParam(defaultValue = "0") int boardNo,
			@RequestParam(defaultValue = "0") int btypeNo,
			Model model) {
		logger.info("게시글 조회수 증가, 파라미터 boardNO={}, btypeNo={}", boardNo, btypeNo);
		
		int cnt = boardService.updateBoardReadCount(boardNo);
		logger.info("게시글 조회수 증가 결과, 파라미터 cnt={}", cnt);
		
		logger.info("게시글 상세조회 - 파라미터 boardNo={}", boardNo);
		
		BoardVO vo = boardService.selectBoardDetail(boardNo);
		logger.info("게시글 상세조회 결과, vo={}", vo);
		
		BoardAtcVO AtcVo = boardService.selectBoardAtcByNo(boardNo);
		logger.info("게시글 상세조회 파일 결과, AtcVo={}", AtcVo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("AtcVo", AtcVo);
		
		
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/boardDetail";
	}
	

}
