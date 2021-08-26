package com.drivease.service;

import com.drivease.model.User;

public interface LoginService {
	
	public User login(User user);

	public User forgotPassword(User user);

	public int checkOTP(User user);

	public User newPassword(User user);

	public int changePass(User user);


}
