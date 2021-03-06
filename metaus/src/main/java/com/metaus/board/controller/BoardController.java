package com.metaus.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.admin.model.ManagerBoardService;
import com.metaus.admin.model.ManagerBoardVO;
import com.metaus.board.model.BoardAtcVO;
import com.metaus.board.model.BoardService;
import com.metaus.board.model.BoardVO;
import com.metaus.comment.model.CommentService;
import com.metaus.comment.model.CommentVO;
import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;
import com.metaus.crawling.model.CrawlingNews;
import com.metaus.crawling.model.CrawlingVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger
	=LoggerFactory.getLogger(BoardController.class);

	private final BoardService boardService;
	private final FileUploadUtil fileUploadUtil;
	private final MemberService memberService;
	private final CommentService commentService;
	private final ManagerBoardService managerBoardService;

	@RequestMapping("/notice")
	public String notice(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("notice ????????? - ????????? ?????? btypeNo={}", btypeNo);
		logger.info("notice ?????????, searchVo={}", searchVo);

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
		logger.info("notice ?????? ?????? ??????, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("notice ?????? ??????-????????? ??????, totalRecord={}", totalRecord);
		logger.info("notice ?????? ??????-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("notice ?????? ??????-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());

		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);

		return "/board/notice";
	}

	@RequestMapping("/faq")
	public String faq(@ModelAttribute BoardVO boardVo,
			HttpSession session,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		String memId = (String)session.getAttribute("memId");
		logger.info("FAQ ????????? - ????????? ?????? btypeNo={}", btypeNo);

		List<BoardVO>list = boardService.selectBoardFaq(boardVo);
		logger.info("FAQ ?????? ?????? ??????, list.size={}", list.size());

		model.addAttribute("list", list);
		model.addAttribute("btypeNo", btypeNo);
		model.addAttribute("memId", memId);

		return "/board/faq";
	}

	@RequestMapping("/news")
	public String news(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("news ????????? - ????????? ?????? btypeNo={}", btypeNo);
		logger.info("news ?????????, searchVo={}", searchVo);

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
		logger.info("news ?????? ?????? ??????, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("news ?????? ??????-????????? ??????, totalRecord={}", totalRecord);
		logger.info("news ?????? ??????-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("news ?????? ??????-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());

		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);

		return "/board/news";
	}

	@RequestMapping("/freeBoard")
	public String freeBoard(@ModelAttribute SearchVO searchVo,
			HttpSession session,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		String memId = (String)session.getAttribute("memId");
		logger.info("freeBoard ????????? - ????????? ?????? btypeNo={}", btypeNo);
		logger.info("freeBoard ?????????, searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);

		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("freeBoard ?????? ?????? ??????, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("freeBoard ?????? ??????-????????? ??????, totalRecord={}", totalRecord);

		List<BoardVO> pList = boardService.PopularSelect(btypeNo);

		model.addAttribute("pList", pList);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list", list);
		model.addAttribute("atcList", atcList);
		model.addAttribute("btypeNo", btypeNo);
		model.addAttribute("memId", memId);

		return "/board/freeBoard";
	}

	@RequestMapping("/QuestionBoard")
	public String QuestionBoard(@ModelAttribute SearchVO searchVo,
			HttpSession session,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		String memId = (String)session.getAttribute("memId");
		logger.info("QuestionBoard ????????? - ????????? ?????? btypeNo={}", btypeNo);
		logger.info("QuestionBoard ?????????, searchVo={}", searchVo);

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
		logger.info("QuestionBoard ?????? ?????? ??????, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("QuestionBoard ?????? ??????-????????? ??????, totalRecord={}", totalRecord);
		logger.info("QuestionBoard ?????? ??????-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("QuestionBoard ?????? ??????-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());

		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		model.addAttribute("memId", memId);

		return "/board/QuestionBoard";
	}

	@RequestMapping("/qna")
	public String qna(@ModelAttribute SearchVO searchVo,
			HttpSession session,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		String memId = (String)session.getAttribute("memId");
		logger.info("qna ????????? - ????????? ?????? btypeNo={}", btypeNo);
		logger.info("qna ?????????, searchVo={}", searchVo);

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
		logger.info("qna ?????? ?????? ??????, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("qna ?????? ??????-????????? ??????, totalRecord={}", totalRecord);
		logger.info("qna ?????? ??????-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("qna ?????? ??????-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		logger.info("searchVo.getRecordCountPerPage={}", searchVo.getRecordCountPerPage());
		logger.info("pagingInfo.getRecordCountPerPage={}", pagingInfo.getRecordCountPerPage());

		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		model.addAttribute("memId", memId);

		return "/board/qna";
	}


	@RequestMapping("/shareBoard")
	public String shareBoard(@ModelAttribute SearchVO searchVo,
			HttpSession session,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		String memId = (String)session.getAttribute("memId");
		logger.info("shareBoard ????????? - ????????? ?????? btypeNo={}", btypeNo);
		logger.info("shareBoard ?????????, searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setBtypeNo(btypeNo);

		List<Map<String, Object>>list = boardService.selectBoard(searchVo);
		logger.info("shareBoard ?????? ?????? ??????, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("shareBoard ?????? ??????-????????? ??????, totalRecord={}", totalRecord);

		List<BoardVO> pList = boardService.PopularSelect(btypeNo);

		model.addAttribute("pList", pList);
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		model.addAttribute("memId", memId);

		return "/board/shareBoard";
	}

	@RequestMapping("/requestBoard")
	public String requestBoard(@ModelAttribute SearchVO searchVo,
			HttpSession session,
			@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		String memId = (String)session.getAttribute("memId");
		logger.info("requestBoard ????????? - ????????? ?????? btypeNo={}", btypeNo);
		logger.info("requestBoard ?????????, searchVo={}", searchVo);

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
		logger.info("requestBoard ?????? ?????? ??????, list.size={}", list.size());
		List<BoardAtcVO> atcList = boardService.selectBoardAtc();
		int totalRecord=boardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);

		logger.info("requestBoard ?????? ??????-????????? ??????, totalRecord={}", totalRecord);
		logger.info("requestBoard ?????? ??????-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("requestBoard ?????? ??????-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());

		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("atcList",atcList);
		model.addAttribute("btypeNo", btypeNo);
		model.addAttribute("memId", memId);

		return "/board/requestBoard";
	}

	@GetMapping("/boardWrite")
	public String boardWrite_get(@RequestParam(defaultValue = "0") int btypeNo,
			HttpSession session,
			Model model) {
		logger.info("???????????? ??? ?????? ?????????, ???????????? btypeNo={}",btypeNo);

		String memId = (String)session.getAttribute("memId");

		logger.info("???????????? ??? ?????? ?????????, ???????????? memId={}",memId);

		model.addAttribute("btypeNo", btypeNo);
		model.addAttribute("memId",memId);
		return "/board/boardWrite";
	}

	@PostMapping("/boardWrite")
	public String boardWrite_post(@RequestParam int btypeNo,
			@RequestParam String memId,
			@ModelAttribute BoardVO boardVo, 
			@ModelAttribute BoardAtcVO boardAtcVo,
			HttpServletRequest request, 
			Model model) {
		logger.info("???????????? ??? ?????? ?????????, ???????????? btypeNo={}", btypeNo);

		MemberVO memVo = memberService.selectByUserid(memId);

		String fileName = "", originFileName = "";

		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);

			for (Map<String, Object> fileMap : fileList) {
				originFileName = (String) fileMap.get("originalFileName");
				fileName = (String) fileMap.get("fileName");
			}
			logger.info("?????? ????????? ??????, fileName={}", fileName);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		boardVo.setMemNo(memVo.getMemNo());
		boardVo.setBtypeNo(btypeNo);
		int cnt = boardService.insertBoard(boardVo);
		logger.info("??? ?????? ?????? ??????, cnt={}", cnt);

		boardAtcVo.setBfileFilename(fileName);
		boardAtcVo.setBfileOriginname(originFileName);
		boardAtcVo.setBoardNo(boardVo.getBoardNo());

		int upload = boardService.insertBoardAtc(boardAtcVo);
		logger.info("?????? ????????? ?????? ??????, upload={}", upload);

		if(cnt>0) {
			logger.info("??? ?????? ??????!");
		}else {
			logger.info("??? ?????? ??????!");
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
			HttpSession session,
			@RequestParam(defaultValue = "0") int btypeNo,
			Model model) {
		String memName=(String)session.getAttribute("memName");
		String memId=(String)session.getAttribute("memId");
		logger.info("????????? ????????? ??????, ???????????? boardNO={}, btypeNo={}", boardNo, btypeNo);

		int cnt = boardService.updateBoardReadCount(boardNo);
		logger.info("????????? ????????? ?????? ??????, ???????????? cnt={}", cnt);

		logger.info("????????? ???????????? - ???????????? boardNo={}", boardNo);

		BoardVO vo = boardService.selectBoardDetail(boardNo);
		logger.info("????????? ???????????? ??????, vo={}", vo);

		BoardAtcVO AtcVo = boardService.selectBoardAtcByNo(boardNo);
		logger.info("????????? ???????????? ?????? ??????, AtcVo={}", AtcVo);

		List<Map<String, Object>> list = commentService.selectComment(vo.getBoardNo());
		logger.info("????????? ?????? list.size={}", list.size());

		int count = commentService.countComment(vo.getBoardNo());
		logger.info("????????? ?????? ?????? count={}", count);

		MemberVO memVo = memberService.selectByMemNo(vo.getMemNo());
		

		model.addAttribute("memName",memName);
		model.addAttribute("memId",memId);
		
		model.addAttribute("memVo", memVo);
		model.addAttribute("vo", vo);
		model.addAttribute("AtcVo", AtcVo);

		model.addAttribute("list", list);
		model.addAttribute("count", count);

		model.addAttribute("boardNo", boardNo);
		model.addAttribute("btypeNo", btypeNo);

		return "/board/boardDetail";
	}

	@GetMapping("/boardUpdate")
	public String boardUpdate_get(@RequestParam int boardNo,
			@RequestParam int bfileNo, 
			Model model) {
		logger.info("??? ?????? ?????????, ???????????? boardNo={}, bfileNo={}", boardNo, bfileNo);

		BoardVO vo = boardService.selectByBoardNo(boardNo);
		BoardAtcVO AtcVo = boardService.selectBoardAtcByNo(bfileNo);

		model.addAttribute("vo", vo);
		model.addAttribute("AtcVo", AtcVo);

		return "/board/boardUpdate";
	}

	@PostMapping("/boardUpdate")
	public String boardUpdate_post(@ModelAttribute BoardVO boardVo,
			HttpSession session,
			HttpServletRequest request,
			@ModelAttribute BoardAtcVO boardAtcVo,
			Model model) {
		String memName=(String)session.getAttribute("memName");
		logger.info("??? ?????? ?????????, ???????????? boardVo={}, boardAtcVo={}", boardVo, boardAtcVo);
		logger.info("??? ?????? ?????????, ???????????? memName={}", memName);

		int boardResult = boardService.updateBoard(boardVo);
		logger.info("??? ?????? ?????? ??????, boardResult={}", boardResult);


		String fileName = "", originFileName = "";

		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);

			for (Map<String, Object> fileMap : fileList) {
				originFileName = (String) fileMap.get("originalFileName");
				fileName = (String) fileMap.get("fileName");
			}
			logger.info("?????? ????????? ??????, fileName={}", fileName);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		boardAtcVo.setBfileFilename(fileName);
		boardAtcVo.setBfileOriginname(originFileName);
		boardAtcVo.setBoardNo(boardVo.getBoardNo());

		int boardAtcResult = boardService.updateBoardAtc(boardAtcVo);
		logger.info("??? ?????? ?????? ??????, boardAtcResult={}", boardAtcResult);

		MemberVO memVo = memberService.selectByMemNo(boardVo.getMemNo());

		model.addAttribute("memName",memName);
		model.addAttribute("memVo", memVo);

		model.addAttribute("boardVo", boardVo);
		model.addAttribute("boardAtcVo", boardAtcVo);

		model.addAttribute("boardNo", boardVo.getBoardNo());
		model.addAttribute("btypeNo", boardVo.getBtypeNo());

		if(boardVo.getBtypeNo()==3) {
			return "redirect:/board/qna?btypeNo=3";
		}else if(boardVo.getBtypeNo()==8) {
			return "redirect:/board/freeBoard?btypeNo=8";
		}else if(boardVo.getBtypeNo()==5) {
			return "redirect:/board/QuestionBoard?btypeNo=5";
		}else if(boardVo.getBtypeNo()==6) {
			return "redirect:/board/shareBoard?btypeNo=6";
		}else if(boardVo.getBtypeNo()==7) {
			return "redirect:/board/requestBoard?btypeNo=7";
		}
		return "/";
	}

	@RequestMapping("/boardDelete")
	public String boardDelete(@ModelAttribute BoardVO vo) {
		logger.info("????????? ??????, ???????????? vo.getBoardNo()={}", vo.getBoardNo());

		int cnt = boardService.deleteBoard(vo);
		logger.info("????????? ??????, ?????? cnt={}",cnt);

		if(vo.getBtypeNo()==3) {
			return "redirect:/board/qna?btypeNo=3";
		}else if(vo.getBtypeNo()==8) {
			return "redirect:/board/freeBoard?btypeNo=8";
		}else if(vo.getBtypeNo()==5) {
			return "redirect:/board/QuestionBoard?btypeNo=5";
		}else if(vo.getBtypeNo()==6) {
			return "redirect:/board/shareBoard?btypeNo=6";
		}else if(vo.getBtypeNo()==7) {
			return "redirect:/board/requestBoard?btypeNo=7";
		}
		return "/";
	}

	@ResponseBody
	@RequestMapping("/commentAjax")
	public CommentVO commentAjax_insert(String memId, String cmtContent, int boardNo, Model model) {
		logger.info("ajax ????????????");

		MemberVO memVo = memberService.selectByUserid(memId);
		logger.info("memvo={}",memVo);

		CommentVO vo = new CommentVO();
		vo.setCmtContent(cmtContent);
		vo.setMemNo(memVo.getMemNo());
		vo.setBoardNo(boardNo);
		logger.info("vo={}",vo);

		int cnt = commentService.insertComment(vo);
		logger.info("?????? ?????? ?????? cnt={}", cnt);

		model.addAttribute("memId", memVo.getMemId());

		return vo;
	}

	@ResponseBody
	@RequestMapping("/commentAjaxDelete")
	public int commentAjax_delete(int cmtNo) {
		logger.info("ajax ???????????? - vo={}", cmtNo);

		int cnt = commentService.deleteComment(cmtNo);	
		logger.info("ajax ???????????? ??????, cnt={}", cnt);

		return cnt;
	}

	@ResponseBody
	@RequestMapping("/commentAjaxUpdate")
	public Map<String, Object> commentAjax_update(CommentVO vo) {
		logger.info("ajax ?????? ?????? - vo={}", vo);

		int cnt = commentService.updateComment(vo);
		logger.info("?????? ?????? ??????, cnt={}", cnt);

		Map<String, Object> map = new HashMap<>();
		map.put("content", vo.getCmtContent());

		return map;
	}

	
	@ResponseBody
	@RequestMapping("/commentReplyAjax")
	public CommentVO commentReplyAjax_reply(CommentVO vo) {
		logger.info("ajax ?????? ?????? - vo={}", vo);

		MemberVO memVo = memberService.selectByMemNo(vo.getMemNo());

		CommentVO nVo = new CommentVO();
		nVo.setBoardNo(vo.getBoardNo());
		nVo.setCmtContent(vo.getCmtContent());
		nVo.setCmtGroupNo(vo.getCmtGroupNo());
		nVo.setCmtStep(vo.getCmtStep());
		nVo.setCmtSortNo(vo.getCmtSortNo());
		nVo.setMemNo(vo.getMemNo());

		int cnt = commentService.reply(nVo);
		logger.info("ajax ?????? ?????? ?????? - cnt={}", cnt);

		return nVo;

	}
	
	
	@ResponseBody
	@RequestMapping("/report")
	public int report(int boardNo) {
		logger.info("ajax ????????? ?????? boardNo={}", boardNo);
		
		ManagerBoardVO managerBoardVo = managerBoardService.selectBoardByBoardNo(boardNo);
		logger.info("ajax ????????? ?????? ????????? ?????? managerBoardVo={}", managerBoardVo);
		
		int reportCnt = managerBoardService.selectIsReportByBoardNo(boardNo);
		logger.info("ajax ????????? ?????? - ?????? ?????? reportCnt={}", reportCnt);
		
		if(reportCnt>0) {
			return 1;
		}else {
			int cnt = managerBoardService.reportBoard(managerBoardVo);
			logger.info("ajax ????????? ?????? - ???????????? cnt={}", cnt);
			return 2;
			
		}

	}
	
	@RequestMapping("/news2")
	public void news2(@RequestParam(defaultValue = "1") int page,Model model) {
		CrawlingNews craw = new CrawlingNews();
		List<CrawlingVO> list = craw.getNews(page);
		model.addAttribute("list",list);
		model.addAttribute("curPage",page);
	}
	

}
