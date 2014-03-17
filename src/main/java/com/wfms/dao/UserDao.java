package com.wfms.dao;

import java.util.List;

import com.wfms.model.User;

public interface UserDao extends BaseDao<User, Long>  {
	public List<User> userExists(final String username);
}
