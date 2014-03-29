package com.wfms.dao.impl;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.wfms.dao.CountryDao;
import com.wfms.hibernate.HibernateUtil;
import com.wfms.model.Country;
import com.wfms.model.User;

public class CountryDaoImpl extends BaseDaoImpl<Country, Long> implements CountryDao {

	@Override
	public String getCountryName(long countryId) {
		return this.read(countryId).getCountryName();
	}
	
	@Override
	public boolean isCountryNameAvailable(final String countryname) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(Country.class);
		criteria.add(Restrictions.eq("countryName", countryname));
		if (criteria.list().size() == 0)
			return true;
		else
			return false;
	}
}
