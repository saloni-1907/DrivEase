package com.drivease.daoimpl;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.controller.VehicleController;
import com.drivease.dao.LenderDriverDao;

import com.drivease.model.LenderDriver;


@Repository("lenderdriverdao")
@SessionAttributes("user")

public class LenderDriverDaoImpl extends GenericDaoImpl<LenderDriver> implements LenderDriverDao {

	public LenderDriver saveLenderDriver(LenderDriver lenderLenderDriver) {
		
		return super.saveObject(lenderLenderDriver);
	}

	public LenderDriver getByVehicleId(long vehicleId) {
		
		return super.getByQuery("From LenderDriver ld where ld.vehicleId="+vehicleId+" and ld.isDeleted=0").get(0);
	}

}
