package com.drivease.service;

import java.util.List;

import com.drivease.model.Area;

public interface AreaService {
	
	
	
	public List<Area> getAll();
	
	public List<Area> getAllAreasByCityId(long cityId);

}
