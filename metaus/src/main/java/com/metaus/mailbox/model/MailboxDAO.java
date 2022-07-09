package com.metaus.mailbox.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MailboxDAO {
	int insertMailbox(MailboxVO vo);
	int selectMsgNo();
	int insertRecipient(RecipientVO vo);
	List<Map<String, Object>> selectMsgViewBySender(String msgaddAdser);
	List<Map<String, Object>> selectMsgViewByRecipient(String msgaddAdser);
	List<Map<String, Object>> selectMsgViewByStar(String memId);
	List<Map<String, Object>> selectMsgViewByTrash(String memId);
	List<Map<String, Object>> selectMsgViewBySpam(String memId);
	List<Map<String, Object>> selectMsgViewByTemporary(String memId);
	Map<String, Object> selectByMsgAddNo(int msgaddNo);
	int insertMailboxAtc(MailboxAtcVO mailboxAtcVo);
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
