package com.drivease.dao;

import java.util.List;

import com.drivease.model.Review;

public interface ReviewDao extends GenericDAO<Review> {

	List<Review> getReviewsByVehicleId(long vehicleId);

	List<Review> getReviewsByDriverId(long driverId);

}
