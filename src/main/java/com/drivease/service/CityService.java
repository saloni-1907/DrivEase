package com.drivease.service;

import java.util.List;

import com.drivease.model.City;

public interface CityService {
	
	public long addCity(City city);
	
	public City editCity(long id);
	public boolean deleteCity(long id);
	public List<City>getAll();
	public int updateCity(City city);
	public City getById(long id);

	public List<City> getAllCitiesByStateId(long stateId);

}
