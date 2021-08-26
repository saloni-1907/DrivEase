package com.drivease.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="book_driver")

public class BookDriver {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long bookDriverId;
	
	private long bookingId;
	private long driverId;
	private String status;
	private int isActive;
	
	public long getBookDriverId() {
		return bookDriverId;
	}
	public void setBookDriverId(long bookDriverId) {
		this.bookDriverId = bookDriverId;
	}
	public long getBookingId() {
		return bookingId;
	}
	public void setBookingId(long bookingId) {
		this.bookingId = bookingId;
	}
	public long getDriverId() {
		return driverId;
	}
	public void setDriverId(long driverId) {
		this.driverId = driverId;
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
