package com.wfms.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.wfms.dao.UserDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.User;

public class UserDaoImpl extends BaseDaoImpl<User, Long> implements UserDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserListByDesignation(final long designationId,
			final int status) {
		Session session = null;
		Query query = null;
		List<User> list = new ArrayList<User>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			if (status == 1 || status == 0) {
				query = session
						.createSQLQuery(
								"SELECT * FROM USER U WHERE U.DESIGNATION_ID = :designationId AND STATUS= :status")
						.addEntity(User.class)
						.setParameter("designationId", designationId)
						.setParameter("status", status);
			} else {
				query = session
						.createSQLQuery(
								"SELECT * FROM USER U WHERE U.DESIGNATION_ID = :designationId")
						.addEntity(User.class)
						.setParameter("designationId", designationId);
			}

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

	@Override
	public void logout(HttpSession session) {
		final User user = (User) session.getAttribute("userssn");
		if (user != null)
			session.invalidate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getResourcePoolList() {
		Session session = null;
		Query query = null;
		List<User> list = new ArrayList<User>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			query = session
					.createSQLQuery(
							"SELECT * FROM USER U WHERE U.PROJECT_ID IS NULL AND STATUS=1 AND DESIGNATION_ID IN (4,5)")
					.addEntity(User.class);

			list = query.list();
		} catch (Exception e) {

		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getProjectUserList(final long projectId) {
		Session session = null;
		Query query = null;
		List<User> list = new ArrayList<User>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			query = session
					.createSQLQuery(
							"SELECT * FROM USER U WHERE U.PROJECT_ID = :projectId AND STATUS=1 AND DESIGNATION_ID IN (4,5)")
					.addEntity(User.class).setParameter("projectId", projectId);

			list = query.list();
		} catch (Exception e) {

		}
		return list;
	}
}
