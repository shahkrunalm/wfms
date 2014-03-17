package com.wfms.dao;

import java.util.List;

import com.wfms.model.State;

public interface StateDao extends BaseDao<State, Long>  {
	public String getStateName(final long stateId);
}
