package com.wfms.dao;

import java.util.List;

import com.wfms.model.Project;

public interface ProjectDao extends BaseDao<Project, Long>  {
	List<Project> getProjectList(final String column, final long userId, final int status);
}
