package com.metaus.mailbox.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MailboxDAO {
	int insertMailbox(MailboxVO vo);
	int selectMsgNo();
	int insertRecipient(RecipientVO vo);
}
