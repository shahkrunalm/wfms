package com.wfms.dao;

import java.util.List;

import com.wfms.model.Project;

public interface ProjectDao extends BaseDao<Project, Long>  {
	List<Project> getProjectList();
}
