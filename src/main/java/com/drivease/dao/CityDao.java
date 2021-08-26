package com.drivease.dao;

import java.util.List;

import com.drivease.model.City;

public interface CityDao extends GenericDAO<City>{
	public List<City> getAll();
	public City getById(long id);
	public boolean deleteCity(long id);
	public long addCity(City city);
	public City editCity(long id);
	public List<City> getAllCitiesByStateId(long stateId);
	
	
}
