package com.drivease.dao;

import java.util.List;

import com.drivease.model.Vehicle;

public interface VehicleDao extends GenericDAO<Vehicle> {

	public List<Vehicle> checkVehicleNo(String string);
	public List<Vehicle> getAll();
	public List<Vehicle> getMyVehicles(long userId);
	public boolean deleteVehicle(long id);
	public List<Vehicle> getRecent();
	public List<Vehicle> getVehicleFilter(Vehicle vehicle);
	

}
