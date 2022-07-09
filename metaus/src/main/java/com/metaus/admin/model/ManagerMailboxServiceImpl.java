package com.metaus.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerMailboxServiceImpl implements ManagerMailboxService{
	private final ManagerMailboxDAO mailboxDao;
	
	public int insertMailbox(ManagerMailboxVO vo) {
		return mailboxDao.insertMailbox(vo);
	}
	
	public int selectMsgNo() {
		return mailboxDao.selectMsgNo();
	}
	
	public int insertRecipient(ManagerRecipientVO vo) {
		return mailboxDao.insertRecipient(vo);
	}

	public List<Map<String, Object>> selectMsgView(String memId, int msgFlag) {
		List<Map<String, Object>> list = null;
		
		if(msgFlag == ManagerMailboxUtil.MSG_SENT_FLAG) { //보낸 메세지
			list = mailboxDao.selectMsgViewBySender(memId);
		}else if(msgFlag == ManagerMailboxUtil.MSG_RECEIVED_FLAG) { //받은 메세지
			list = mailboxDao.selectMsgViewByRecipient(memId);
		}else if(msgFlag == ManagerMailboxUtil.MSG_STAR_FLAG) { //별표 메세지
			list = mailboxDao.selectMsgViewByStar(memId);
		}else if(msgFlag == ManagerMailboxUtil.MSG_TRASH_FLAG) { //삭제 메세지
			list = mailboxDao.selectMsgViewByTrash(memId);
		}else if(msgFlag == ManagerMailboxUtil.MSG_SPAM_FLAG) { //스팸 메세지
			list = mailboxDao.selectMsgViewBySpam(memId);
		}else if(msgFlag == ManagerMailboxUtil.MSG_TEMPORARY_FLAG) { //임시보관함
			list = mailboxDao.selectMsgViewByTemporary(memId);
		}
		
		return list;
	}

	@Override
	public Map<String, Object> selectByMsgAddNo(int msgaddNo) {
		return mailboxDao.selectByMsgAddNo(msgaddNo);
	}

	@Override
	public int insertMailboxAtc(ManagerMailboxAtcVO mailboxAtcVo) {
		return mailboxDao.insertMailboxAtc(mailboxAtcVo);
	}

	@Override
	public int findReceivedNo(String msgaddAdsee) {
		return mailboxDao.findReceivedNo(msgaddAdsee);
	}

	@Override
	public int findSentNo(String msgaddAdser) {
		return mailboxDao.findSentNo(msgaddAdser);
	}

	@Override
	public int findStarNo(String memId) {
		return mailboxDao.findStarNo(memId);
	}

	@Override
	public int findTemporaryNo(String msgaddAdser) {
		return mailboxDao.findTemporaryNo(msgaddAdser);
	}

	@Override
	public int findSpamNo(String msgaddAdser) {
		return mailboxDao.findSpamNo(msgaddAdser);
	}

	@Override
	public int findTrashNo(String msgaddAdser) {
		return mailboxDao.findTrashNo(msgaddAdser);
	}

	@Override
	public int updateStarFlag(Map<String, String> map) {
		return mailboxDao.updateStarFlag(map);
	}

	@Override
	public int updateTrashFlag(Map<String, String> map) {
		return mailboxDao.updateTrashFlag(map);
	}

	@Override
	public int updateSpamFlag(Map<String, String> map) {
		return mailboxDao.updateSpamFlag(map);
	}

	@Override
	public int delTemporaryMail(int msgaddNo) {
		return mailboxDao.delTemporaryMail(msgaddNo);
	}

	
}
