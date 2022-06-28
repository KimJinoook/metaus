package com.metaus.contact.model;

import java.util.List;

public interface ContactService {

	public List<ContactVO> selectContactByMemNo(int memNo);

}
