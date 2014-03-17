package com.wfms.dao;

import com.wfms.model.City;

public interface CityDao extends BaseDao<City, Long>  {
	public String getCityName(final long cityId);
}
