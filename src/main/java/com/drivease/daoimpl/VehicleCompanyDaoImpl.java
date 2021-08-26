package com.drivease.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.drivease.dao.VehicleCompanyDao;
import com.drivease.model.VehicleCompany;


@Repository("vehiclecompanydao")
public class VehicleCompanyDaoImpl extends GenericDaoImpl<VehicleCompany> implements VehicleCompanyDao{

	public List<VehicleCompany> getAll() {
		// TODO Auto-generated method stub
		return super.getByQuery("FROM VehicleCompany vc WHERE vc.isDeleted=0");
	}

		
}