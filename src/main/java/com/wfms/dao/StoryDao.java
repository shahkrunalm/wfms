package com.wfms.dao;

import java.util.List;

import com.wfms.model.Story;

public interface StoryDao extends BaseDao<Story, Long>  {
	List<Story> getStoryListByProject(final long projectId, final int status);
}
