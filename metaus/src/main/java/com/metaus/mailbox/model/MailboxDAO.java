package com.metaus.mailbox.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MailboxDAO {
	int insertMailbox(MailboxVO vo);
	int selectMsgNo();
	int insertRecipient(RecipientVO vo);
	List<Map<String, Object>> selectMsgViewBySender(Map<String, Object> map);
	List<Map<String, Object>> selectMsgViewByRecipient(Map<String, Object> map);
	List<Map<String, Object>> selectMsgViewByStar(Map<String, Object> map);
	List<Map<String, Object>> selectMsgViewByTrash(Map<String, Object> map);
	List<Map<String, Object>> selectMsgViewBySpam(Map<String, Object> map);
	List<Map<String, Object>> selectMsgViewByTemporary(Map<String, Object> map);
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
	int updateMsgaddDate(int msgaddNo);
	int getRecipientCount(Map<String, Object> map);
	int getSenderCount(Map<String, Object> map);
	int getStarCount(Map<String, Object> map);
	int getTrashCount(Map<String, Object> map);
	int getSpamCount(Map<String, Object> map);
	int getTemporaryCount(Map<String, Object> map);
}
