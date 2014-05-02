package com.wfms.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "STORY")
public class Story {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="STORY_ID")
	private long storyId;

	@Column(name="STORY_NAME")
	private String storyName;
	
	@Column(name="STORY_SHORT_NAME")
	private String storyShortName;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="CREATED_ON")
	private Date createdOn;
	
	@Column(name="CREATED_BY")
	private String createdBy;
	
	@OneToMany(mappedBy = "story")  
	private Set<Task> tasks = new HashSet<Task>();
	
	@Column(name="STATUS")
	private int status;
	
	@ManyToOne
	@JoinColumn(name = "PROJECT_ID")  
	private Project project;

	public long getStoryId() {
		return storyId;
	}

	public void setStoryId(long storyId) {
		this.storyId = storyId;
	}

	public String getStoryName() {
		return storyName;
	}

	public void setStoryName(String storyName) {
		this.storyName = storyName;
	}

	public String getStoryShortName() {
		return storyShortName;
	}

	public void setStoryShortName(String storyShortName) {
		this.storyShortName = storyShortName;
	}

	public Set<Task> getTasks() {
		return tasks;
	}

	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	
	
	
}
