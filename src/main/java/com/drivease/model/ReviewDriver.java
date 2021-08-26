package com.drivease.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="review_driver")
public class ReviewDriver {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long reviewDriverId;
	
	private long reviewId;
	private long driverId;
	private int isDeleted;
	
	public long getReviewDriverId() {
		return reviewDriverId;
	}
	public void setReviewDriverId(long reviewDriverId) {
		this.reviewDriverId = reviewDriverId;
	}
	public long getReviewId() {
		return reviewId;
	}
	public void setReviewId(long reviewId) {
		this.reviewId = reviewId;
	}
	public long getDriverId() {
		return driverId;
	}
	public void setDriverId(long driverId) {
		this.driverId = driverId;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
		
}
