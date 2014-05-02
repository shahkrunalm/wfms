package com.wfms.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.wfms.model.User;

public interface UserDao extends BaseDao<User, Long>  {
	List<User> getUserListByDesignation(final long designationId, final int status);
	List<User> getResourcePoolList();
	User login(final String username, final String password);
	void logout(HttpSession session);
	List<User> getProjectUserList(final long projectId);
}
