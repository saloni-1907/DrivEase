package com.drivease.dao;

import com.drivease.model.User;

public interface UserDao extends GenericDAO<User>  {

	User loginCheck(User user);

	int emailCheck(User user);

	User forgotpassword(User user);

	

}
