package com.drivease.dao;

import java.util.List;

import com.drivease.model.VehicleModel;

public interface VehicleModelDao extends GenericDAO<VehicleModel>{
	public List<VehicleModel> getAll();

	public VehicleModel getAllDetails(long modelId);
	
}
