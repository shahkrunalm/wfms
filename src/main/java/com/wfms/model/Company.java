package com.wfms.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "COMPANY")
public class Company {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="COMPANY_ID")
	private long companyId;
	
	@Column(name="COMPANY_NAME")
	private String companyName;
	
	@Embedded
	private Address address;
	
	@Column(name="STATUS")
	private int status;
	
	@OneToMany(mappedBy = "company")  
	private Set<Project> projects = new HashSet<Project>();

	public long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(long companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	
}
