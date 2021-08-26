package com.drivease.dao;

import com.drivease.model.LenderDriver;

public interface LenderDriverDao extends GenericDAO<LenderDriver>{

	LenderDriver saveLenderDriver(LenderDriver lenderDriver);

	LenderDriver getByVehicleId(long vehicleId);

}
