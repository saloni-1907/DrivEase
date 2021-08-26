package com.drivease.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.DriverDao;

import com.drivease.model.Driver;
import com.drivease.util.CommonUtils;
import com.drivease.util.DbUtility;


@Repository("driverdao")
@SessionAttributes("user")

public class DriverDaoImpl extends GenericDaoImpl<Driver> implements DriverDao {

	public Driver saveDriver(Driver driver) {
		
		return (Driver)super.saveObject(driver);
	}

	public Driver getDriverByUserId(long userId) {
		List<Driver> list = super.getByQuery("From Driver d where d.isDeleted=0 and d.isActive=1 and d.userId="+userId);
		return list.get(0);
	}

	public Driver updateDriver(Driver driver) {
		return (Driver)super.updateObject(driver);
	}
	
	public List<Driver> getAll() {
		List<Driver> list = DbUtility.getListData("SELECT d.driverId as driverId,d.userId as userId,v.vehicleTypeName as vehicleTypeName,d.hourlyRent as hourlyRent, d.dailyRent as dailyRent, d.status as status FROM driver d INNER JOIN vehicle_type v ON d.vehicleTypeId = v.vehicleTypeId where d.isDeleted=0 and d.isAvailable=1 and d.isActive=1",Driver.class);
		//List<Driver> list = super.getByQuery("From Driver d where d.isDeleted=0 and d.isAvailable=1");
		//return super.getByQuery("FROM Vehicle v WHERE v.isDeleted=0");
		return list;
	}

	public List<Driver> getRecent() {
		List<Driver> list = DbUtility.getListData("SELECT d.driverId as driverId,d.userId as userId,v.vehicleTypeName as vehicleTypeName,d.hourlyRent as hourlyRent, d.dailyRent as dailyRent, d.status as status FROM driver d INNER JOIN vehicle_type v ON d.vehicleTypeId = v.vehicleTypeId where d.isDeleted=0 and d.isAvailable=1 and d.isActive=1 order by d.driverId desc limit 3",Driver.class);
		//List<Driver> list = super.getByQuery("From Driver d where d.isDeleted=0 and d.isAvailable=1");
		//return super.getByQuery("FROM Vehicle v WHERE v.isDeleted=0");
		return list;
	}

	public List<Driver> getDriverFilter(Driver driver) {
		StringBuilder query = new StringBuilder("SELECT d.driverId as driverId,d.userId as userId,a.cityId as cityId,\r\n" + 
				"v.vehicleTypeName as vehicleTypeName,d.hourlyRent as hourlyRent,\r\n" + 
				" d.dailyRent as dailyRent, d.status as status FROM driver d INNER JOIN vehicle_type v \r\n" + 
				" ON d.vehicleTypeId = v.vehicleTypeId INNER JOIN user u ON d.userId = u.userId INNER JOIN area a ON u.areaId=a.areaId\r\n" + 
				" where d.isDeleted=0 and d.isAvailable=1 and d.isActive=1");
		
		if(driver.getVehicleTypeFilter()!=null && !"".equals(driver.getVehicleTypeFilter()))
		{
			String vehicleType = CommonUtils.convertInClause(driver.getVehicleTypeFilter());
			query.append(" and v.vehicleTypeName IN(").append(vehicleType).append(")");
		}
		if(driver.getHourlyRentFilter()!=null && !"".equals(driver.getHourlyRentFilter()))
		{
			String rent = driver.getHourlyRentFilter();
			boolean isAnd = false;
			   if(rent.contains("Below 100"))
			   {
				   query.append(" and d.hourlyRent < 100");
				   isAnd=true;
			   }
			   if (rent.contains("100-300"))
			   {
				   if(isAnd) {
					   query.append(" or d.hourlyRent between 100 and 300");

				   } else {
					   query.append(" and d.hourlyRent between 100 and 300");
					   isAnd=true;
				   }
			   }
			   if (rent.contains("Above 300"))
			   {
				   if(isAnd) {
					   query.append(" or d.hourlyRent > 300");

				   } else {
					   query.append(" and d.hourlyRent > 300");
					   isAnd=true;
				   }
			   }
		}
		if(driver.getDailyRentFilter()!=null && !"".equals(driver.getDailyRentFilter()))
		{
			String rent = driver.getDailyRentFilter();
			boolean isAnd = false;
			   if(rent.contains("Below 500"))
			   {
				   query.append(" and d.dailyRent < 500");
				   isAnd=true;
			   }
			   if (rent.contains("500-1000"))
			   {
				   if(isAnd) {
					   query.append(" or d.dailyRent between 500 and 1000");

				   } else {
					   query.append(" and d.dailyRent between 500 and 1000");
					   isAnd=true;
				   }
			   }
			   if (rent.contains("Above 1000"))
			   {
				   if(isAnd) {
					   query.append(" or d.dailyRent > 1000");

				   } else {
					   query.append(" and d.dailyRent > 1000");
					   isAnd=true;
				   }
			   }
		}
		if(driver.getCityId()!=0) {
			long cityid=driver.getCityId();
			query.append(" and a.cityId="+cityid);
		}
		
		List<Driver> list = DbUtility.getListData(query.toString(),Driver.class);
		return list;
	}

}
