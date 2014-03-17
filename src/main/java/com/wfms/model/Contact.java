package com.wfms.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Contact {

	@Column(name = "CONTACT_MOBILE")
	private String mobile;
	
	@Column(name = "CONTACT_HOME_PHONE")
	private String homePhone;
	
	@Column(name = "CONTACT_WORK_PHONE")
	private String workPhone;
	
	@Column(name = "CONTACT_EMERGENCY_NUMBER")
	private String emergencyContactNo;
	
	@Column(name = "CONTACT_EMERGENCY_NAME")
	private String emergencyContactName;
	
	@Column(name = "CONTACT_WEBSITE")
	private String website;
	
	@Column(name = "CONTACT_PERSONAL_EMAIL")
	private String personalEmail;

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getHomePhone() {
		return homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getEmergencyContactNo() {
		return emergencyContactNo;
	}

	public void setEmergencyContactNo(String emergencyContactNo) {
		this.emergencyContactNo = emergencyContactNo;
	}

	public String getEmergencyContactName() {
		return emergencyContactName;
	}

	public void setEmergencyContactName(String emergencyContactName) {
		this.emergencyContactName = emergencyContactName;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getPersonalEmail() {
		return personalEmail;
	}

	public void setPersonalEmail(String personalEmail) {
		this.personalEmail = personalEmail;
	}

	public String getWorkPhone() {
		return workPhone;
	}

	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}
	
	
	
}
