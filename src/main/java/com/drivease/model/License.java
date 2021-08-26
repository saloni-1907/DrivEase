package com.drivease.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="license")

public class License {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long licenseId;
	
	private String licenseNo;
	private Date dateOfIssue;
	private Date dateOfExpiry;
	private String licensePicture;
	private int status;
	private Date createdDate;
	private Date modifiedDate;
	private int isDeleted;
	private int isActive;
	@Transient
	private MultipartFile licenseImage;
	
	public MultipartFile getLicenseImage() {
		return licenseImage;
	}
	public void setLicenseImage(MultipartFile licenseImage) {
		this.licenseImage = licenseImage;
	}
	public long getLicenseId() {
		return licenseId;
	}
	public void setLicenseId(long licenseId) {
		this.licenseId = licenseId;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	public Date getDateOfIssue() {
		return dateOfIssue;
	}
	public void setDateOfIssue(Date dateOfIssue) {
		this.dateOfIssue = dateOfIssue;
	}
	public Date getDateOfExpiry() {
		return dateOfExpiry;
	}
	public void setDateOfExpiry(Date dateOfExpiry) {
		this.dateOfExpiry = dateOfExpiry;
	}
	public String getLicensePicture() {
		return licensePicture;
	}
	public void setLicensePicture(String licensePicture) {
		this.licensePicture = licensePicture;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	
	
	
	
}
