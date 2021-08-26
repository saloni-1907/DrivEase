package com.drivease.daoimpl;



import org.springframework.stereotype.Repository;

import com.drivease.dao.UserFeedbackDao;
import com.drivease.model.UserFeedback;

@Repository("userfeedbackdao")
public class UserFeedbackDaoImpl extends GenericDaoImpl<UserFeedback>  implements UserFeedbackDao{

	
	public long addFeedback(UserFeedback feedback) {
		 	
			feedback.setIsDeleted(0);
			UserFeedback new_obj =super.saveObject(feedback);
			return new_obj.getFeedbackId();
		}

}
