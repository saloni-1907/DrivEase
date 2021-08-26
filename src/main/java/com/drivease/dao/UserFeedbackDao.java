package com.drivease.dao;

import com.drivease.model.UserFeedback;



public interface UserFeedbackDao extends GenericDAO<UserFeedback>{
	
	public long addFeedback(UserFeedback feedback);

}
