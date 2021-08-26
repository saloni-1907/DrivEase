package com.drivease.serviceimpl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drivease.dao.VehicleCompanyDao;
import com.drivease.model.VehicleCompany;
import com.drivease.service.VehicleCompanyService;

@Service("companyservice")
@Transactional
public class VehicleCompanyServiceImpl implements VehicleCompanyService{

	@Autowired
	VehicleCompanyDao companydao;
	
	public List<VehicleCompany> getAll() {
		return companydao.getAll();
	}

}
