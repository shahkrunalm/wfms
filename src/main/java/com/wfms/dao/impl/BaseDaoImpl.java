package com.wfms.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.wfms.dao.BaseDao;
import com.wfms.hibernate.HibernateUtil;

public class BaseDaoImpl<T, ID extends Serializable> implements BaseDao<T, ID> {

	private Class<T> type;

	private SessionFactory sessionFactory;

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
		} catch (Exception e) {

		}
		return entity;
	}

	@Override
	public void update(T transientObject) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(T entity) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(entity);
			tx.commit();
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

}
