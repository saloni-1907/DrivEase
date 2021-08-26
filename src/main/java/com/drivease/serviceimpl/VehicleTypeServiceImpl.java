package com.drivease.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drivease.dao.VehicleTypeDao;
import com.drivease.model.VehicleType;
import com.drivease.service.VehicleTypeService;

@Service("typeservice")
@Transactional

public class VehicleTypeServiceImpl implements VehicleTypeService {

	@Autowired
	VehicleTypeDao vehicletypedao;
	
	public List<VehicleType> getAll() {
		// TODO Auto-generated method stub
		return vehicletypedao.getAll();
	}

	
}
