package com.drivease.service;

import java.util.List;

import com.drivease.model.Review;

public interface ReviewService {

	long addReview(Review review, String reviewFor, long id);

	List<Review> getReviewsByVehicleId(long vehicleId);

	List<Review> getReviewsByDriverId(long driverId);

}
