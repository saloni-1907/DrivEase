package com.drivease.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.net.ntp.TimeStamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="driver")

public class Driver {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long driverId;
	
	private long licenseId;
	
	@Transient
	private String licenseNo;
	
	@Transient
	private Date dateOfIssue;
	
	@Transient
	private Date dateOfExpiry;
	
	@Transient
	private String licensePicture;
	
	private double hourlyRent;
	private double dailyRent;
	private String description;
	private long vehicleTypeId;
	private String status;
	private int isAvailable;
	
	private long userId;
	
	@Transient
	private String driverName;
	
	@Transient
	private String profilePicture;

	private Date createdDate;
	private Date modifiedDate;
	private int isDeleted;
	private int isActive;
	
	@Transient
	private MultipartFile licenseImage; 
	@Transient
	private String vehicleTypeName;
	
	@Transient
	private String vehicleTypeFilter;
	@Transient
	private String hourlyRentFilter;
	@Transient
	private String dailyRentFilter;
	@Transient
	private long cityId;
	
	public long getDriverId() {
		return driverId;
	}
	public void setDriverId(long driverId) {
		this.driverId = driverId;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
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
	
	public double getHourlyRent() {
		return hourlyRent;
	}
	public void setHourlyRent(double hourlyRent) {
		this.hourlyRent = hourlyRent;
	}
	public double getDailyRent() {
		return dailyRent;
	}
	public void setDailyRent(double dailyRent) {
		this.dailyRent = dailyRent;
	}
	public long getVehicleTypeId() {
		return vehicleTypeId;
	}
	public void setVehicleTypeId(long vehicleTypeId) {
		this.vehicleTypeId = vehicleTypeId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public MultipartFile getLicenseImage() {
		return licenseImage;
	}
	public void setLicenseImage(MultipartFile licenseImage) {
		this.licenseImage = licenseImage;
	}
	public String getVehicleTypeName() {
		return vehicleTypeName;
	}
	public void setVehicleTypeName(String vehicleTypeName) {
		this.vehicleTypeName = vehicleTypeName;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getLicenseId() {
		return licenseId;
	}
	public void setLicenseId(long licenseId) {
		this.licenseId = licenseId;
	}
	
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	
	public String getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	public int getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(int isAvailable) {
		this.isAvailable = isAvailable;
	}
	public String getVehicleTypeFilter() {
		return vehicleTypeFilter;
	}
	public void setVehicleTypeFilter(String vehicleTypeFilter) {
		this.vehicleTypeFilter = vehicleTypeFilter;
	}
	public String getHourlyRentFilter() {
		return hourlyRentFilter;
	}
	public void setHourlyRentFilter(String hourlyRentFilter) {
		this.hourlyRentFilter = hourlyRentFilter;
	}
	public String getDailyRentFilter() {
		return dailyRentFilter;
	}
	public void setDailyRentFilter(String dailyRentFilter) {
		this.dailyRentFilter = dailyRentFilter;
	}
	public long getCityId() {
		return cityId;
	}
	public void setCityId(long cityId) {
		this.cityId = cityId;
	}
}
