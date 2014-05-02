package com.wfms.dao;

import java.util.List;

import com.wfms.model.Message;

public interface MessageDao extends BaseDao<Message, Long>  {
	List<Message> inbox(final String username);
	List<Message> sent(final String username);
}
