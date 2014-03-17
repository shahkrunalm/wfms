package com.wfms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "CITY")
public class City {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="CITY_ID")
	private long cityId;

	@Column(name="CITY_NAME")
	private String cityName;

	@Column(name="STATUS")
	private int status;
	
	@ManyToOne
	@JoinColumn(name = "STATE_ID")  
	private State state;

	public long getCityId() {
		return cityId;
	}

	public void setCityId(long cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}
	
	
}
