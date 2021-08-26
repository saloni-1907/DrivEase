package com.drivease.dao;

import java.util.List;

import com.drivease.model.VehicleType;

public interface VehicleTypeDao extends GenericDAO<VehicleType>{
	public List<VehicleType> getAll();
	
}
