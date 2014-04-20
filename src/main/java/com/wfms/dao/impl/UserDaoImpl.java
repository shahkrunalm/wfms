package com.wfms.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.wfms.dao.UserDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.User;

public class UserDaoImpl extends BaseDaoImpl<User, Long> implements UserDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserListByDesignation(long designationId) {
		Session session = null;
		List<User> list = new ArrayList<User>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			Query query = session
					.createSQLQuery(
							"SELECT * FROM USER U WHERE U.DESIGNATION_ID = :designationId AND STATUS=1")
					.addEntity(User.class)
					.setParameter("designationId", designationId);
			list = query.list();
		} catch (Exception e) {

		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public User login(final String username, final String password) {
		List<User> userList = new ArrayList<User>();
		User user = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			userList = session.createCriteria(User.class)
					.add(Restrictions.eq("username", username))
					.add(Restrictions.eq("password", password)).list();
			if (userList.size() == 1) {
				user = userList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
