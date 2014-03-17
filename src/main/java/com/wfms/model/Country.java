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
@Table(name = "COUNTRY")
public class Country {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="COUNTRY_ID")
	private long countryId;

	@Column(name="COUNTRY_NAME")
	private String countryName;

	@Column(name="STATUS")
	private int status;
	
	@OneToMany(mappedBy = "country")  
	private Set<State> states = new HashSet<State>();

	public long getCountryId() {
		return countryId;
	}

	public void setCountryId(long countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Country() {
		super();
	}

	public Set<State> getStates() {
		return states;
	}

	public void setStates(Set<State> states) {
		this.states = states;
	}

}
