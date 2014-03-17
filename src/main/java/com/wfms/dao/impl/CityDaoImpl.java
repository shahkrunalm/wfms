package com.wfms.dao.impl;


import com.wfms.dao.CityDao;
import com.wfms.model.City;

public class CityDaoImpl extends BaseDaoImpl<City, Long> implements CityDao {

	@Override
	public String getCityName(final long cityId) {
		return this.read(cityId).getCityName();
	}

}
