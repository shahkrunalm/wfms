package com.wfms.model;

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
@Table(name = "PROJECT")
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="PROJECT_ID")
	private long projectId;
	
	@Column(name="PROJECT_NAME")
	private String projectName;
	
	@ManyToOne
	@JoinColumn(name = "COMPANY_ID")  
	private Company company;

	@OneToMany(mappedBy = "project")  
	private Set<Story> stories = new HashSet<Story>();
	
	@Column(name="STATUS")
	private int status;

	public long getProjectId() {
		return projectId;
	}

	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Set<Story> getStories() {
		return stories;
	}

	public void setStories(Set<Story> stories) {
		this.stories = stories;
	}
	
	
}
