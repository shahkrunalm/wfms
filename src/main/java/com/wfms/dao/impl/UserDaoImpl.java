package com.wfms.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.wfms.dao.UserDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.User;

public class UserDaoImpl extends BaseDaoImpl<User, Long> implements UserDao {

}
