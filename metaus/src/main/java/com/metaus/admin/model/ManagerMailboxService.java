package com.metaus.admin.model;

import java.util.List;
import java.util.Map;

import com.metaus.mailbox.model.MailboxAtcVO;

public interface ManagerMailboxService {
	int insertMailbox(ManagerMailboxVO vo);
	int selectMsgNo();
	int insertRecipient(ManagerRecipientVO vo);
	List<Map<String, Object>> selectMsgView(String userId, int msgFlag);
	Map<String, Object> selectByMsgAddNo(int msgaddNo);
	int insertMailboxAtc(ManagerMailboxAtcVO mailboxAtcVo);
	int findReceivedNo(String msgaddAdsee);
	int findSentNo(String msgaddAdser);
	int findStarNo(String memId);
	int findTemporaryNo(String msgaddAdser);
	int findSpamNo(String msgaddAdser);
	int findTrashNo(String msgaddAdser);
	int updateStarFlag(Map<String, String> map);
	int updateTrashFlag(Map<String, String> map);
	int updateSpamFlag(Map<String, String> map);
	int delTemporaryMail(int msgaddNo);
	List<MailboxAtcVO> selectMsgAtcByMsgNo(int msgNo);
}
