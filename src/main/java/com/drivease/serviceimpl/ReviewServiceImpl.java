package com.drivease.serviceimpl;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.DriverDao;
import com.drivease.dao.ReviewDao;
import com.drivease.dao.ReviewDriverDao;
import com.drivease.dao.ReviewVehicleDao;
import com.drivease.dao.UserDao;
import com.drivease.dao.VehicleDao;
import com.drivease.model.Review;
import com.drivease.model.ReviewDriver;
import com.drivease.model.ReviewVehicle;
import com.drivease.model.User;
import com.drivease.service.ReviewService;
import com.drivease.util.FTPUtils;

@Service("reviewService")
@Transactional
@SessionAttributes("user")

public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewDao reviewDao;

	@Autowired
	HttpSession session;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	VehicleDao vehicleDao;
	
	@Autowired
	ReviewVehicleDao reviewVehicleDao;
	
	@Autowired
	ReviewDriverDao reviewDriverDao;
	
	@Autowired
	DriverDao driverdao;

	//private static String UPLOADED_FOLDER1 ="D://tools//apache-tomcat-9.0.11-windows-x64//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//vehiclePicture"+File.separator;
	private static String UPLOADED_FOLDER2 ="D://Tools//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//profilePicture"+File.separator;
		
	public long addReview(Review review, String reviewFor, long id) {
		User user = (User) session.getAttribute("user");
		review.setUserId(user.getUserId());
		Review addedReview =  reviewDao.saveObject(review);
		if(addedReview==null)
			return 0;
		if("Vehicle".equalsIgnoreCase(reviewFor)) {
			ReviewVehicle rv = new ReviewVehicle();
			rv.setReviewId(addedReview.getReviewId());
			rv.setVehicleId(id);
			ReviewVehicle newRv = reviewVehicleDao.saveObject(rv);
			return newRv.getReviewVehicleId();
		}
		if("Driver".equalsIgnoreCase(reviewFor)) {
			ReviewDriver rd = new ReviewDriver();
			rd.setReviewId(addedReview.getReviewId());
			rd.setDriverId(id);
			ReviewDriver newRd = reviewDriverDao.saveObject(rd);
			return newRd.getReviewDriverId();
		}
		return 0;
	}

	public List<Review> getReviewsByVehicleId(long vehicleId) {
		List<Review> list = reviewDao.getReviewsByVehicleId(vehicleId);
		for (Review review : list) {
			User user = userDao.getById(User.class, review.getUserId());
			review.setUserName(user.getFname()+" "+user.getLname());
			String newPP = user.getProfilePicture();
			File ProfileImage = new File(UPLOADED_FOLDER2+newPP);
			if(!ProfileImage.exists())
			{
				FTPUtils.download(newPP, UPLOADED_FOLDER2+newPP);
			}
			review.setUserProfilePicture(user.getProfilePicture());
			
		}
		return list;
	}

	public List<Review> getReviewsByDriverId(long driverId) {
		List<Review> list = reviewDao.getReviewsByDriverId(driverId);
		for (Review review : list) {
			User user = userDao.getById(User.class, review.getUserId());
			review.setUserName(user.getFname()+" "+user.getLname());
			String newPP = user.getProfilePicture();
			File ProfileImage = new File(UPLOADED_FOLDER2+newPP);
			if(!ProfileImage.exists())
			{
				FTPUtils.download(newPP, UPLOADED_FOLDER2+newPP);
			}
			review.setUserProfilePicture(user.getProfilePicture());
		}
		return list;
	}

	
}
