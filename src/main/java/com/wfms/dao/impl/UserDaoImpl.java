package com.wfms.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.wfms.dao.UserDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.User;

public class UserDaoImpl extends BaseDaoImpl<User, Long> implements UserDao {

	@Override
	public boolean isUserNameAvailable(final String username) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("username", username));
		if (criteria.list().size() == 0)
			return true;
		else
			return false;
	}
}
