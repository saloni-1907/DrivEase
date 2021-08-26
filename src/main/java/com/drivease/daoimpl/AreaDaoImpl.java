package com.drivease.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.drivease.dao.AreaDao;
import com.drivease.model.Area;
import com.drivease.model.City;
import com.drivease.util.DbUtility;

@Repository("areadao")
public class AreaDaoImpl extends GenericDaoImpl<Area>  implements AreaDao {

	

	public List<Area> getAll() {

		List<Area> list = DbUtility.getListData("SELECT a.areaId as areaId,"
				+ " a.areaName as areaName,c.cityName as cityName, s.stateName as stateName "
				+ "FROM area a INNER JOIN city c ON a.cityId = c.cityId INNER JOIN state s"
				+ " ON c.stateId = s.stateId  WHERE a.isDeleted=0 and c.isDeleted=0 and "
				+ "s.isDeleted=0", Area.class);
		return list;
		//return super.getByQuery("FROM Area vm WHERE vm.isDeleted=0");
	}

	public List<Area> getAreasByCityId(long cityId) {
		List<Area> list=DbUtility.getListData("SELECT a.areaId as areaId,a.areaName as areaName FROM area a WHERE a.isDeleted = 0 AND a.cityId ="+cityId, Area.class);
		return list;
	}

	public Area getAllDetails(long areaId) {
		List<Area> list = DbUtility.getListData("SELECT a.areaId as areaId,"
				+ " a.areaName as areaName,c.cityId as cityId,c.cityName as cityName,"
				+ "s.stateId as stateId, s.stateName as stateName "
				+ "FROM area a INNER JOIN city c ON a.cityId = c.cityId INNER JOIN state s"
				+ " ON c.stateId = s.stateId  WHERE a.isDeleted=0 and c.isDeleted=0 and "
				+ "s.isDeleted=0 and a.areaId="+areaId, Area.class);
		return list.get(0);
	}

	
}
