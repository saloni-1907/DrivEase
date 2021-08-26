package com.drivease.serviceimpl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drivease.dao.AreaDao;
import com.drivease.model.Area;
import com.drivease.service.AreaService;

@Service("areaservice")
@Transactional

public class AreaServiceImpl implements AreaService {

	@Autowired
	AreaDao areadao;
	
	

	public List<Area> getAll() {
		return areadao.getAll();
	}



	public List<Area> getAllAreasByCityId(long cityId) {
		return areadao.getAreasByCityId(cityId);
	}

	
}
