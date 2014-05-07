package com.wfms.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.wfms.dao.StoryDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.Story;

public class StoryDaoImpl extends BaseDaoImpl<Story, Long> implements StoryDao {

	@Override
	public List<Story> getStoryListByProject(long projectId, int status) {
		Session session = null;
		Query query = null;
		List<Story> list = new ArrayList<Story>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			if (status == 1 || status == 0) {
				query = session
						.createSQLQuery(
								"SELECT * FROM STORY S WHERE S.PROJECT_ID = :projectId AND STATUS= :status")
						.addEntity(Story.class)
						.setParameter("projectId", projectId)
						.setParameter("status", status);
			} else {
				query = session
						.createSQLQuery(
								"SELECT * FROM STORY S WHERE S.PROJECT_ID = :projectId")
						.addEntity(Story.class)
						.setParameter("projectId", projectId);
			}

			list = query.list();
		} catch (Exception e) {

		}
		return list;
	}

}
