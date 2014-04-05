package com.wfms.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T, ID extends Serializable> {
	/**
	 * Persist the newInstance into database
	 */
	T save(T newInstance);

	/**
	 * Retrieve an object that was previously persisted to the database using
	 * the indicated id as primary key
	 */
	T read(ID id);

	/** 
	 * Save changes made to a persistent object 
	 */
	void update(T transientObject);

	/** 
	 * Remove an object from persistent storage in the database
	 */
	void delete(T persistentObject);

	/**
	 * 
	 * @param instance
	 * @param orderBy
	 * @param status
	 * @return
	 */
	List<T> getListByCriteria(T instance, final String orderBy, final int status);

	/**
	 * 
	 * @param instance
	 * @param propertyName
	 * @return
	 */
	boolean isExists(final T instance, final String propertyName, final String propertyValue);
}
