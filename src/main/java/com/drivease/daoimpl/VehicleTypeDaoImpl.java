package com.drivease.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.drivease.dao.VehicleTypeDao;
import com.drivease.model.VehicleType;


@Repository("vehicletypedao")
public class VehicleTypeDaoImpl extends GenericDaoImpl<VehicleType> implements VehicleTypeDao{

	public List<VehicleType> getAll() {

		return super.getByQuery("FROM VehicleType vt WHERE vt.isDeleted=0");
	}

}