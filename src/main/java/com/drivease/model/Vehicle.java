package com.drivease.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString*/
@Entity
@Table(name="vehicle")
public class Vehicle {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long vehicleId;
	
	private long userId;
	private String vehicleNumber;
	private long modelId;
	private String vehiclePicture;
	private double hourlyRent;
	private double dailyRent;
	private String pickUpAdd;
	private long areaId;
	private int withDriver;
	private Date createdDate;
	private Date modifiedDate;
	private int isDeleted;
	private int isActive;
	private String description;
	private String status;
	private int isAvailable;
	
	@Transient
	private String lenderName;
	@Transient
	private long lenderMobile;
	@Transient
	private String lenderEmail;
	@Transient
	private String lenderPicture;
	@Transient
	private String checkDriver;
	@Transient
	private long cityId;
	
	@Transient
	private long stateId;
	
	
	@Transient
	private String name;
	@Transient
	private Date dob;
	@Transient
	private String gender;
	@Transient
	private String mobileNumber;
	@Transient
	private long companyId;
	
	@Transient
	private MultipartFile vehicleImage; 
	
	@Transient
	private String companyName;
	
	@Transient
	private String modelName;
	
	@Transient
	private String vehicleTypeName;
	
	@Transient
	private String stateName;
	@Transient
	private String cityName;
	@Transient
	private String areaName;
	
	@Transient
	private String vehicleTypeFilter;
	@Transient
	private String hourlyRentFilter;
	@Transient
	private String dailyRentFilter;
	@Transient
	private String withDriverFilter;
	
	public long getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(long vehicleId) {
		this.vehicleId = vehicleId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	public long getModelId() {
		return modelId;
	}
	public void setModelId(long modelId) {
		this.modelId = modelId;
	}
	public String getVehiclePicture() {
		return vehiclePicture;
	}
	public void setVehiclePicture(String vehiclePicture) {
		this.vehiclePicture = vehiclePicture;
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
	public String getPickUpAdd() {
		return pickUpAdd;
	}
	public void setPickUpAdd(String pickUpAdd) {
		this.pickUpAdd = pickUpAdd;
	}
	public long getAreaId() {
		return areaId;
	}
	public void setAreaId(long areaId) {
		this.areaId = areaId;
	}
	public int getWithDriver() {
		return withDriver;
	}
	public void setWithDriver(int withDriver) {
		this.withDriver = withDriver;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(int isAvailable) {
		this.isAvailable = isAvailable;
	}
	public String getLenderName() {
		return lenderName;
	}
	public void setLenderName(String lenderName) {
		this.lenderName = lenderName;
	}
	public long getLenderMobile() {
		return lenderMobile;
	}
	public void setLenderMobile(long lenderMobile) {
		this.lenderMobile = lenderMobile;
	}
	public String getLenderEmail() {
		return lenderEmail;
	}
	public void setLenderEmail(String lenderEmail) {
		this.lenderEmail = lenderEmail;
	}
	public String getCheckDriver() {
		return checkDriver;
	}
	public void setCheckDriver(String checkDriver) {
		this.checkDriver = checkDriver;
	}
	public long getCityId() {
		return cityId;
	}
	public void setCityId(long cityId) {
		this.cityId = cityId;
	}
	public long getStateId() {
		return stateId;
	}
	public void setStateId(long stateId) {
		this.stateId = stateId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(long companyId) {
		this.companyId = companyId;
	}
	public MultipartFile getVehicleImage() {
		return vehicleImage;
	}
	public void setVehicleImage(MultipartFile vehicleImage) {
		this.vehicleImage = vehicleImage;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getVehicleTypeName() {
		return vehicleTypeName;
	}
	public void setVehicleTypeName(String vehicleTypeName) {
		this.vehicleTypeName = vehicleTypeName;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
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
	public String getWithDriverFilter() {
		return withDriverFilter;
	}
	public void setWithDriverFilter(String withDriverFilter) {
		this.withDriverFilter = withDriverFilter;
	}
	public String getLenderPicture() {
		return lenderPicture;
	}
	public void setLenderPicture(String lenderPicture) {
		this.lenderPicture = lenderPicture;
	}
	
	
}