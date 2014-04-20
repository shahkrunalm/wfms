package com.wfms.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "DESIGNATION")
public class Designation {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="DESIGNATION_ID")
	private long designationId;

	@Column(name="DESIGNATION_NAME")
	private String designationName;

	@Column(name="STATUS")
	private int status;

	@OneToMany(mappedBy = "designation")  
	private Set<User> users = new HashSet<User>();
	
	public long getDesignationId() {
		return designationId;
	}

	public void setDesignationId(long designationId) {
		this.designationId = designationId;
	}

	public String getDesignationName() {
		return designationName;
	}

	public void setDesignationName(String designationName) {
		this.designationName = designationName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Designation [designationId=" + designationId
				+ ", designationName=" + designationName + ", status=" + status
				+ ", users=" + users + "]";
	}
	
}
