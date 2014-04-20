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
@Table(name = "STATE")
public class State {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="STATE_ID")
	private long stateId;

	@Column(name="STATE_NAME")
	private String stateName;

	@Column(name="STATUS")
	private int status;
	
	@ManyToOne
	@JoinColumn(name = "COUNTRY_ID")  
	private Country country;

	@OneToMany(mappedBy = "state")  
	private Set<City> cities = new HashSet<City>();
	
	public long getStateId() {
		return stateId;
	}

	public void setStateId(long stateId) {
		this.stateId = stateId;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public State() {
		super();
	}
	
	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Set<City> getCities() {
		return cities;
	}

	public void setCities(Set<City> cities) {
		this.cities = cities;
	}
	
	

}
