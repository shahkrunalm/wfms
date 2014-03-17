package com.wfms.hibernate;

import org.hibernate.*;
import org.hibernate.cfg.*;

public class HibernateUtil {
	private static SessionFactory sessionFactory;
	static {
		try {
			sessionFactory = new AnnotationConfiguration()
					.addAnnotatedClass(com.wfms.model.Country.class)
					.addAnnotatedClass(com.wfms.model.State.class)
					.addAnnotatedClass(com.wfms.model.City.class)
					.addAnnotatedClass(com.wfms.model.Message.class)
					.addAnnotatedClass(com.wfms.model.User.class)
					.addAnnotatedClass(com.wfms.model.Company.class)
					.addAnnotatedClass(com.wfms.model.Project.class)
					.addAnnotatedClass(com.wfms.model.Story.class)
					.addAnnotatedClass(com.wfms.model.Task.class)
					.configure()
					.buildSessionFactory();
		} catch (Throwable ex) {
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void shutdown() {
		getSessionFactory().close();
	}
}
