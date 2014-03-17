package com.wfms.dao;

import com.wfms.model.Country;

public interface CountryDao extends BaseDao<Country, Long>  {

	public String getCountryName(final long countryId);
}
