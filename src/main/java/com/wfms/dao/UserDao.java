package com.wfms.dao;

import java.util.List;

import com.wfms.model.User;

public interface UserDao extends BaseDao<User, Long>  {
	List<User> getUserListByDesignation(final long designationId);
	User login(final String username, final String password);
}
