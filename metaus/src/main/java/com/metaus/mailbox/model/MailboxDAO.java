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
	Map<String, Object> selectByMsgNo(int msgNo);
}
