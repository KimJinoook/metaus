package com.metaus.mailbox.model;

import java.util.List;
import java.util.Map;

public interface MailboxService {
	int insertMailbox(MailboxVO vo);
	int selectMsgNo();
	int insertRecipient(RecipientVO vo);
	List<Map<String, Object>> selectMsgView(String userId, int msgFlag);
	Map<String, Object> selectByMsgNo(int msgNo);
	int insertMailboxAtc(MailboxAtcVO mailboxAtcVo);
	int findReceivedNo(String msgaddAdsee);
	int findSentNo(String msgaddAdser);
}
