package com.drivease.serviceimpl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drivease.dao.VehicleModelDao;
import com.drivease.model.VehicleModel;
import com.drivease.service.VehicleModelService;

@Service("modelservice")
@Transactional

public class VehicleModelServiceImpl implements VehicleModelService {

	@Autowired
	VehicleModelDao modeldao;
	
	public List<VehicleModel> getAll() {
		// TODO Auto-generated method stub
		return modeldao.getAll();
	}

	
}
