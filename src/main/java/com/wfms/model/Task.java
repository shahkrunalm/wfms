package com.wfms.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TASK")
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="TASK_ID")
	private long taskId;

	@Column(name="TASK_NAME")
	private String taskName;	
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="CREATED_ON")
	private Date createdOn;
	
	@Column(name="CREATED_BY")
	private String createdBy;
	
	@OneToOne
	@JoinColumn(name = "USER_ID")  
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "STORY_ID")  
	private Story story;
	
	@Column(name="STATUS")
	private int status;

	public long getTaskId() {
		return taskId;
	}

	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
