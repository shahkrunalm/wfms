package com.wfms.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.wfms.dao.MessageDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.Message;
import com.wfms.util.Constants;

public class MessageDaoImpl extends BaseDaoImpl<Message, Long> implements MessageDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> inbox(final String username) {
		Session session = null;
		Criteria criteria = null;
		List<Message> msgList = new ArrayList<Message>();
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			criteria = session.createCriteria(Message.class);
			criteria.add(Restrictions.eq("msgTo", username));
			criteria.add(Restrictions.eq("toDeleteStatus", Constants.TO_HAS_NOT_DELETED_RECEIVED_MSG));
			criteria.addOrder(Order.desc("dateTime"));
			msgList = criteria.list();
		}catch(Exception e){
			
		}
		return msgList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> sent(final String username) {
		Session session = null;
		Criteria criteria = null;
		List<Message> msgList = new ArrayList<Message>();
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			criteria = session.createCriteria(Message.class);
			criteria.add(Restrictions.eq("msgFrom", username));
			criteria.add(Restrictions.eq("fromDeleteStatus", Constants.FROM_HAS_NOT_DELETED_SENT_MSG));
			criteria.addOrder(Order.desc("dateTime"));
			msgList = criteria.list();
		}catch(Exception e){
			
		}
		return msgList;
	}
}
