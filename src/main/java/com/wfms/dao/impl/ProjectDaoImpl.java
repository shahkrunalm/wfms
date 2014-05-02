package com.wfms.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.wfms.dao.ProjectDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.Project;

public class ProjectDaoImpl extends BaseDaoImpl<Project, Long> implements
		ProjectDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Project> getProjectList(final String column, final long userId, final int status) {
		Session session = null;
		Query query = null;
		List<Project> list = new ArrayList<Project>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			if(status==-1){
				query = session
						.createSQLQuery(
								"SELECT * FROM PROJECT WHERE "+column+" = :userId ORDER BY PROJECT_NAME ASC")
						.addEntity(Project.class)
						.setParameter("userId", userId);
			}else{
				query = session
						.createSQLQuery(
								"SELECT * FROM PROJECT WHERE "+column+" = :userId AND STATUS= :status ORDER BY PROJECT_NAME ASC")
						.addEntity(Project.class)
						.setParameter("userId", userId)
						.setParameter("status", status);
			}
			list = query.list();
		} catch (Exception e) {

		}
		return list;

	}
}
