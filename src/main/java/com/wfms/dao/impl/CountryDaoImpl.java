package com.wfms.dao.impl;


import com.wfms.dao.CountryDao;
import com.wfms.model.Country;

public class CountryDaoImpl extends BaseDaoImpl<Country, Long> implements CountryDao {

	@Override
	public String getCountryName(long countryId) {
		return this.read(countryId).getCountryName();
	}

}
