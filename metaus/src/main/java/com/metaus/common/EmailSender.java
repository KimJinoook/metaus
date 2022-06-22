package com.metaus.common;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class EmailSender {
	private final JavaMailSender mailSender;
	
	public void sendEmail(String subject, String content, String receiver, String  sender) throws MessagingException {
		MimeMessage msg = mailSender.createMimeMessage();
		msg.setSubject(subject);
		msg.setText(content);
		msg.setRecipient(RecipientType.TO, new InternetAddress(receiver));
		msg.setFrom(new InternetAddress(sender));
		mailSender.send(msg);
	}
}