package com.drivease.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="book_vehicle")

public class BookVehicle {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long bookVehicleId;
	
	private long bookingId;
	private long vehicleId;
	private String status;
	private int isActive;
	public long getBookVehicleId() {
		return bookVehicleId;
	}
	public void setBookVehicleId(long bookVehicleId) {
		this.bookVehicleId = bookVehicleId;
	}
	public long getBookingId() {
		return bookingId;
	}
	public void setBookingId(long bookingId) {
		this.bookingId = bookingId;
	}
	public long getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(long vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	
	
	
}
