package com.wfms.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.wfms.dao.TaskDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.Task;

public class TaskDaoImpl extends BaseDaoImpl<Task, Long> implements TaskDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Task> getMyTaskList(final long userId) {
		Session session = null;
		Query query = null;
		List<Task> taskList = new ArrayList<Task>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			query = session
					.createSQLQuery(
							"SELECT * FROM TASK T WHERE T.USER_ID = :userId")
					.addEntity(Task.class)
					.setParameter("userId", userId);
			taskList = query.list();
		} catch (Exception e) {

		}
		return taskList;
	}

}
