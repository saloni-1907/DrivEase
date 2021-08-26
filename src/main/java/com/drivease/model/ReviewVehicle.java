package com.drivease.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="review_vehicle")
public class ReviewVehicle {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long reviewVehicleId;
	
	private long reviewId;
	private long vehicleId;
	private int isDeleted;
	public long getReviewVehicleId() {
		return reviewVehicleId;
	}
	public void setReviewVehicleId(long reviewVehicleId) {
		this.reviewVehicleId = reviewVehicleId;
	}
	public long getReviewId() {
		return reviewId;
	}
	public void setReviewId(long reviewId) {
		this.reviewId = reviewId;
	}
	public long getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(long vehicleId) {
		this.vehicleId = vehicleId;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	
	
}
