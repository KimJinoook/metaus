package com.metaus.mailbox.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailboxServiceImpl implements MailboxService{
	private final MailboxDAO mailboxDao;
	
	public int insertMailbox(MailboxVO vo) {
		return mailboxDao.insertMailbox(vo);
	}
	
	public int selectMsgNo() {
		return mailboxDao.selectMsgNo();
	}
	
	public int insertRecipient(RecipientVO vo) {
		return mailboxDao.insertRecipient(vo);
	}

	public List<Map<String, Object>> selectMsgView(Map<String, Object> map, int msgFlag) {
		List<Map<String, Object>> list = null;
		
		if(msgFlag == MailboxUtil.MSG_RECEIVED_FLAG) { //받은 메세지
			list = mailboxDao.selectMsgViewByRecipient(map);
		}else if(msgFlag == MailboxUtil.MSG_SENT_FLAG) { //보낸 메세지
			list = mailboxDao.selectMsgViewBySender(map);
		}else if(msgFlag == MailboxUtil.MSG_STAR_FLAG) { //별표 메세지
			list = mailboxDao.selectMsgViewByStar(map);
		}else if(msgFlag == MailboxUtil.MSG_TRASH_FLAG) { //삭제 메세지
			list = mailboxDao.selectMsgViewByTrash(map);
		}else if(msgFlag == MailboxUtil.MSG_SPAM_FLAG) { //스팸 메세지
			list = mailboxDao.selectMsgViewBySpam(map);
		}else if(msgFlag == MailboxUtil.MSG_TEMPORARY_FLAG) { //임시보관함
			list = mailboxDao.selectMsgViewByTemporary(map);
		}
		
		return list;
	}

	@Override
	public Map<String, Object> selectByMsgAddNo(int msgaddNo) {
		return mailboxDao.selectByMsgAddNo(msgaddNo);
	}

	@Override
	public int insertMailboxAtc(MailboxAtcVO mailboxAtcVo) {
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

	@Override
	public List<MailboxAtcVO> selectMsgAtcByMsgNo(int msgNo) {
		return mailboxDao.selectMsgAtcByMsgNo(msgNo);
	}

	@Override
	public int updateMsgaddDate(int msgaddNo) {
		return mailboxDao.updateMsgaddDate(msgaddNo);
	}

	@Override
	public int getRecipientCount(Map<String, Object> map) {
		return mailboxDao.getRecipientCount(map);
	}

	@Override
	public int getSenderCount(Map<String, Object> map) {
		return mailboxDao.getSenderCount(map);
	}

	@Override
	public int getStarCount(Map<String, Object> map) {
		return mailboxDao.getStarCount(map);
	}

	@Override
	public int getTrashCount(Map<String, Object> map) {
		return mailboxDao.getTrashCount(map);
	}

	@Override
	public int getSpamCount(Map<String, Object> map) {
		return mailboxDao.getSpamCount(map);
	}

	@Override
	public int getTemporaryCount(Map<String, Object> map) {
		return mailboxDao.getTemporaryCount(map);
	}

	
}
