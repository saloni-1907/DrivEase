package com.drivease.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.ReviewDao;
import com.drivease.model.Review;
import com.drivease.util.DbUtility;

@Repository("reviewDao")
@SessionAttributes("user")

public class ReviewDaoImpl extends GenericDaoImpl<Review> implements ReviewDao{

	public List<Review> getReviewsByVehicleId(long vehicleId) {
		List<Review> list = DbUtility.getListData("SELECT r.reviewDesc,r.reviewTime,r.userId,rv.vehicleId FROM review r INNER  JOIN review_vehicle rv ON r.reviewId = rv.reviewId where r.isDeleted=0 and rv.vehicleId="+vehicleId, Review.class);
		return list;
	}

	public List<Review> getReviewsByDriverId(long driverId) {
		List<Review> list = DbUtility.getListData("SELECT r.reviewDesc,r.reviewTime,r.userId,rd.driverId FROM review r INNER  JOIN review_driver rd ON r.reviewId = rd.reviewId where r.isDeleted=0 and rd.driverId="+driverId, Review.class);
		return list;
	}

}
