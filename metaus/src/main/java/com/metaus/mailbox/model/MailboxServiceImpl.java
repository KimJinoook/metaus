package com.metaus.mailbox.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailboxServiceImpl {
	private final MailboxDAO mailboxDao;
	
	int insertMailbox(MailboxVO vo) {
		return mailboxDao.insertMailbox(vo);
	}
	
	int selectMsgNo() {
		return mailboxDao.selectMsgNo();
	}
	
	int insertRecipient(RecipientVO vo) {
		return mailboxDao.insertRecipient(vo);
	}
}
