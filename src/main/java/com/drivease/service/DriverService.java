package com.drivease.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.drivease.model.Driver;

public interface DriverService {

	long saveDriver(Driver driver);

	Driver getDriverByUserId(long userId);

	Driver getAllDetails(long driverId);

	long updateDriver(Driver driver);
	
	public List<Driver> getAll();

	List<Driver> getRecentDrivers();

	boolean deactivateDriver(long driverId);

	List<Driver> getDriverFilter(Driver driverFilter);

}
