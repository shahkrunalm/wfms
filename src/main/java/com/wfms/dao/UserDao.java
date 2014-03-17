package com.wfms.dao;

import com.wfms.model.User;

public interface UserDao extends BaseDao<User, Long>  {
	public boolean isUserNameAvailable(final String username);
}
