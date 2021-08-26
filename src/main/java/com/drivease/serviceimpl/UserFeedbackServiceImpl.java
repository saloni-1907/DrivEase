package com.drivease.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drivease.dao.UserFeedbackDao;
import com.drivease.model.UserFeedback;
import com.drivease.service.UserFeedbackService;

@Service("userfeedbackservice")
@Transactional
public class UserFeedbackServiceImpl implements UserFeedbackService {
	
	@Autowired
	UserFeedbackDao userfeedbackdao;

	public long addFeedback(UserFeedback feedback) {
		
		 userfeedbackdao.addFeedback(feedback);
		 return 0;
	}
	

}
