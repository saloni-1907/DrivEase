package com.drivease.serviceimpl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drivease.dao.CityDao;
import com.drivease.model.City;
import com.drivease.service.CityService;

@Service("cityservice")
@Transactional

public class CityServiceImpl implements CityService {

	@Autowired
	CityDao citydao;
	
	public long addCity(City city) {
		if(city.getCityId()<=1)
		{
			city.setCreatedBy(1);
			city.setCreatedDate(new Date(System.currentTimeMillis()));
		}
		else
		{
			city.setModifiedBy(1);
			city.setModifiedDate(new Date(System.currentTimeMillis()));
		}
		
		return citydao.addCity(city);
	}

	public City editCity(long id) {
		// TODO Auto-generated method stub
		return citydao.editCity(id);
	}

	public boolean deleteCity(long id) {
		// TODO Auto-generated method stub
		return citydao.deleteCity(id);
	}

	public List<City> getAll() {
		// TODO Auto-generated method stub
		return citydao.getAll();
	}

	public int updateCity(City city) {
		// TODO Auto-generated method stub
		return 0;
	}

	public City getById(long id) {
		// TODO Auto-generated method stub
		return citydao.getById(id);
	}

	public List<City> getAllCitiesByStateId(long stateId) {
		// TODO Auto-generated method stub
		return citydao.getAllCitiesByStateId(stateId);
	}

}
