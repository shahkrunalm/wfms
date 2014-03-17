package com.wfms.dao.impl;


import com.wfms.dao.StateDao;
import com.wfms.model.State;

public class StateDaoImpl extends BaseDaoImpl<State, Long> implements StateDao {

	@Override
	public String getStateName(final long stateId) {
		return this.read(stateId).getStateName();
	}

}
