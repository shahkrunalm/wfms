package com.wfms.dao;

import java.util.List;

import com.wfms.model.Task;

public interface TaskDao extends BaseDao<Task, Long>  {
	List<Task> getMyTaskList(final long userId);
}
