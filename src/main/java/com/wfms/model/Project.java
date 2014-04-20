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
import javax.persistence.OneToOne;
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
	
	@Column(name="PROJECT_SHORT_NAME")
	private String projectShortName;
	
	@Column(name="PROJECT_DESCRIPTION")
	private String projectDescription;
	
	@Column(name="EXPECTED_START_DATE")
	private Date expectedStartDate;
	
	@Column(name="EXPECTED_END_DATE")
	private Date expectedEndDate;
	
	@OneToOne
	@JoinColumn(name = "DM_USER_ID")  
	private User deliveryManager;
	
	@OneToOne
	@JoinColumn(name = "PM_USER_ID")  
	private User projectManager;
	
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

	public String getProjectShortName() {
		return projectShortName;
	}

	public void setProjectShortName(String projectShortName) {
		this.projectShortName = projectShortName;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public User getDeliveryManager() {
		return deliveryManager;
	}

	public void setDeliveryManager(User deliveryManager) {
		this.deliveryManager = deliveryManager;
	}

	public User getProjectManager() {
		return projectManager;
	}

	public void setProjectManager(User projectManager) {
		this.projectManager = projectManager;
	}

	public Date getExpectedStartDate() {
		return expectedStartDate;
	}

	public void setExpectedStartDate(Date expectedStartDate) {
		this.expectedStartDate = expectedStartDate;
	}

	public Date getExpectedEndDate() {
		return expectedEndDate;
	}

	public void setExpectedEndDate(Date expectedEndDate) {
		this.expectedEndDate = expectedEndDate;
	}
	
}
