package com.drivease.service;

import org.springframework.web.multipart.MultipartFile;
import com.drivease.model.User;



public interface UserService {
	
	public long saveUser(User user, MultipartFile file1);
	public long saveupdateUser(User user, MultipartFile file1);
	public User getAllDetails(long userId);
	public long updateUser(User user, MultipartFile file1);

}
