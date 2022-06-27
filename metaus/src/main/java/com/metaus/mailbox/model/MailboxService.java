package com.metaus.mailbox.model;

public interface MailboxService {
	int insertMailbox(MailboxVO vo);
	int selectMsgNo();
	int insertRecipient(RecipientVO vo);
}
