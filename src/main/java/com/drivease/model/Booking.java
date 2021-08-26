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

@Entity
@Table(name="booking")
public class Booking {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long bookingId;
	
	private long userId;
	private Timestamp startingDate;
	private Timestamp endingDate;
	private double noOfDays;
	private double noOfHours;
	private double finalAmount;
	private String status;
	private Date bookingDate;
	private int isActive;
	
	@Transient
	private String startDate;
	@Transient
	private String endDate;
	
	@Transient
	private String userName;
	@Transient
	private String userEmail;
	@Transient
	private long userMobile;
	
	@Transient
	private long vehicleId;
	
	@Transient
	private String vehicleNo;
	@Transient
	private String vehicleName;
	@Transient
	private String vehiclePicture;
	@Transient
	private String lenderName;
	@Transient
	private String lenderEmail;
	@Transient
	private long lenderMobile;
	
	@Transient
	private long driverId;
	
	@Transient
	private String driverName;
	@Transient
	private String driverEmail;
	@Transient
	private long driverMobile;
	@Transient
	private String driverVehicleType;
	@Transient
	private String driverPicture;
	
	public long getBookingId() {
		return bookingId;
	}
	public void setBookingId(long bookingId) {
		this.bookingId = bookingId;
	}
	public Timestamp getStartingDate() {
		return startingDate;
	}
	public void setStartingDate(Timestamp startingDate) {
		this.startingDate = startingDate;
	}
	public Timestamp getEndingDate() {
		return endingDate;
	}
	public void setEndingDate(Timestamp endingDate) {
		this.endingDate = endingDate;
	}
	public double getNoOfDays() {
		return noOfDays;
	}
	public void setNoOfDays(double noOfDays) {
		this.noOfDays = noOfDays;
	}
	public double getNoOfHours() {
		return noOfHours;
	}
	public void setNoOfHours(double noOfHours) {
		this.noOfHours = noOfHours;
	}
	public double getFinalAmount() {
		return finalAmount;
	}
	public void setFinalAmount(double finalAmount) {
		this.finalAmount = finalAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(long vehicleId) {
		this.vehicleId = vehicleId;
	}
	public long getDriverId() {
		return driverId;
	}
	public void setDriverId(long driverId) {
		this.driverId = driverId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public String getLenderName() {
		return lenderName;
	}
	public void setLenderName(String lenderName) {
		this.lenderName = lenderName;
	}
	public String getLenderEmail() {
		return lenderEmail;
	}
	public void setLenderEmail(String lenderEmail) {
		this.lenderEmail = lenderEmail;
	}
	public long getLenderMobile() {
		return lenderMobile;
	}
	public void setLenderMobile(long lenderMobile) {
		this.lenderMobile = lenderMobile;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public long getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(long userMobile) {
		this.userMobile = userMobile;
	}
	public String getVehiclePicture() {
		return vehiclePicture;
	}
	public void setVehiclePicture(String vehiclePicture) {
		this.vehiclePicture = vehiclePicture;
	}
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getDriverEmail() {
		return driverEmail;
	}
	public void setDriverEmail(String driverEmail) {
		this.driverEmail = driverEmail;
	}
	public long getDriverMobile() {
		return driverMobile;
	}
	public void setDriverMobile(long driverMobile) {
		this.driverMobile = driverMobile;
	}
	public String getDriverVehicleType() {
		return driverVehicleType;
	}
	public void setDriverVehicleType(String driverVehicleType) {
		this.driverVehicleType = driverVehicleType;
	}
	public String getDriverPicture() {
		return driverPicture;
	}
	public void setDriverPicture(String driverPicture) {
		this.driverPicture = driverPicture;
	}
	
	
}
