package com.drivease.dao;

import java.util.List;

import com.drivease.model.Driver;

public interface DriverDao extends GenericDAO<Driver>{

	Driver saveDriver(Driver driver);

	Driver getDriverByUserId(long userId);

	Driver updateDriver(Driver driver);
	
	public List<Driver> getAll();

	List<Driver> getRecent();

	List<Driver> getDriverFilter(Driver driver);

}
