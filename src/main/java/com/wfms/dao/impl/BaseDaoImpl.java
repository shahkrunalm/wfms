package com.wfms.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.wfms.controller.CountryController;
import com.wfms.dao.BaseDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.User;

public class BaseDaoImpl<T, ID extends Serializable> implements BaseDao<T, ID> {

	private Class<T> type;

	private SessionFactory sessionFactory;
	
	private static final Logger LOGGER = Logger.getLogger(BaseDaoImpl.class
			.getName());

	public BaseDaoImpl(final Class<T> type) {
		super();
		this.type = type;
	}

	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		this.type = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@SuppressWarnings("unchecked")
	@Override
	public T save(final T entity) {
		T savedEntity = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			savedEntity = (T) session.save(entity);
			tx.commit();
			session.close();
		} catch (Exception e) {

		}

		return savedEntity;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T read(ID id) {
		T entity = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			entity = (T) session.get(this.type, id);
			session.close();
		} catch (Exception e) {

		}
		return entity;
	}

	@Override
	public void update(T entity) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(entity);
			tx.commit();
			session.close();
			LOGGER.info("Entity updated successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(T entity) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(entity);
			tx.commit();
			session.close();
		} catch (Exception e) {

		}
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getListByCriteria(final T instance, final String orderBy,
			final int status) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(this.type);
		if (status >= 0)
			criteria.add(Restrictions.eq("status", status));
		if (orderBy != null)
			criteria.addOrder(Order.asc(orderBy));
		return criteria.list();
	}

	@Override
	public boolean isExists(final T instance, final String propertyName,
			final String propertyValue) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(this.type);
		criteria.add(Restrictions.eq(propertyName, propertyValue));
		if (criteria.list().size() == 0)
			return true;
		else
			return false;
	}

}
