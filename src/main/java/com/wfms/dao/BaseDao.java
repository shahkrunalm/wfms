package com.wfms.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseDao<T, ID extends Serializable> {
	 /** Persist the newInstance object into database */
    T save(T newInstance);

    /** Retrieve an object that was previously persisted to the database using
     *   the indicated id as primary key
     */
    T read(ID id);

    /** Save changes made to a persistent object.  */
    void update(T transientObject);

    /** Remove an object from persistent storage in the database */
    void delete(T persistentObject);
    
    List<T> getListByCriteria(T instance, String orderBy, int id);
}
