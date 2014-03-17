package com.wfms.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Address {
	
	@Column(name = "ADDRESS_STREET")
	private String street;
	
	@Column(name = "ADDRESS_COUNTRY")
	private String country;
	
	@Column(name = "ADDRESS_STATE")
	private String state;
	
	@Column(name = "ADDRESS_CITY")
	private String city;
	
	@Column(name = "ADDRESS_ZIPCODE")
	private String zipcode;

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

}
