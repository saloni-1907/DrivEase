package com.drivease.dao;

import java.util.List;

import com.drivease.model.VehicleCompany;

public interface VehicleCompanyDao extends GenericDAO<VehicleCompany>{
	public List<VehicleCompany> getAll();
	
}
