package com.drivease.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.VehicleDao;
import com.drivease.model.Driver;
import com.drivease.model.Vehicle;
import com.drivease.util.CommonUtils;
import com.drivease.util.DbUtility;

@Repository("vehicledao")
@SessionAttributes("user")
public class VehicleDaoImpl extends GenericDaoImpl<Vehicle> implements VehicleDao {

	public List<Vehicle> checkVehicleNo(String vehicleNo) {
		//String query = "FROM Vehicle where vehicleNumber='" + vehicleNo + "'";
		List<Vehicle> list = super.getByQuery("FROM Vehicle where vehicleNumber=" + vehicleNo);
		return list;
	}

	public List<Vehicle> getAll() {
		List<Vehicle> list = DbUtility.getListData("SELECT v.vehicleId as vehicleId, v.vehicleNumber as vehicleNumber,m.modelName as modelName,c.companyName as companyName, v.pickUpAdd as pickUpAdd,v.hourlyRent as hourlyRent, v.dailyRent as dailyRent, v.status as status,v.vehiclePicture as vehiclePicture FROM vehicle v INNER JOIN vehicle_model m ON v.modelId = m.modelId INNER JOIN vehicle_company c ON m.companyId = c.companyId where v.isDeleted=0 and v.isAvailable=1",Vehicle.class);
		//List<Vehicle> list = super.getByQuery("From Vehicle v where v.isDeleted=0");
		//return super.getByQuery("FROM Vehicle v WHERE v.isDeleted=0");
		return list;
	}

	public List<Vehicle> getMyVehicles(long userId) {
		List<Vehicle> list = DbUtility.getListData("SELECT v.vehicleId as vehicleId, v.vehicleNumber as vehicleNumber,m.modelName as modelName,c.companyName as companyName,v.pickUpAdd as pickUpAdd,v.hourlyRent as hourlyRent, v.dailyRent as dailyRent, v.status as status,v.vehiclePicture as vehiclePicture FROM vehicle v INNER JOIN vehicle_model m ON v.modelId = m.modelId INNER JOIN vehicle_company c ON m.companyId = c.companyId where v.isDeleted=0 and v.isAvailable=1 and v.userId="+userId,Vehicle.class);
		return list;
	}

	public boolean deleteVehicle(long id) {
		Vehicle obj = super.getById(Vehicle.class,id);
		obj.setIsDeleted(1);
		obj.setIsActive(0);
		obj.setIsAvailable(0);
		return super.updateObject(obj).getVehicleId()>0;
	}

	public List<Vehicle> getRecent() {
		List<Vehicle> vehicleList = DbUtility.getListData("SELECT v.vehicleId as vehicleId, v.vehicleNumber as vehicleNumber,m.modelName as modelName,c.companyName as companyName, v.pickUpAdd as pickUpAdd,v.hourlyRent as hourlyRent, v.dailyRent as dailyRent, v.status as status,v.vehiclePicture as vehiclePicture FROM vehicle v INNER JOIN vehicle_model m ON v.modelId = m.modelId INNER JOIN vehicle_company c ON m.companyId = c.companyId where v.isDeleted=0 and v.isAvailable=1 order by v.vehicleId desc limit 3", Vehicle.class);
		return vehicleList;
	}

	public List<Vehicle> getVehicleFilter(Vehicle vehicle) {
		StringBuilder query = new StringBuilder("SELECT v.vehicleId as vehicleId,\r\n" + 
				" v.vehicleNumber as vehicleNumber,m.modelName as modelName,\r\n" + 
				" c.companyName as companyName, v.pickUpAdd as pickUpAdd,v.hourlyRent as hourlyRent,\r\n" + 
				" v.dailyRent as dailyRent, v.status as status,v.vehiclePicture as vehiclePicture \r\n" + 
				" FROM vehicle v INNER JOIN vehicle_model m ON v.modelId = m.modelId INNER JOIN vehicle_company c\r\n" + 
				" ON m.companyId = c.companyId  INNER JOIN vehicle_type vt ON m.vehicleTypeId=vt.vehicleTypeId\r\n" + 
				" INNER JOIN area a ON v.areaId=a.areaId\r\n" + 
				" where v.isDeleted=0 and v.isAvailable=1");
		if(vehicle.getWithDriverFilter()!=null && !"".equals(vehicle.getWithDriverFilter()))
		{
			String withDriver = CommonUtils.convertInClause(vehicle.getWithDriverFilter());
			query.append(" and v.withDriver IN(").append(withDriver).append(")");
		}
		if(vehicle.getVehicleTypeFilter()!=null && !"".equals(vehicle.getVehicleTypeFilter()))
		{
			String vehicleType = CommonUtils.convertInClause(vehicle.getVehicleTypeFilter());
			query.append(" and vt.vehicleTypeName IN(").append(vehicleType).append(")");
		}
		if(vehicle.getHourlyRentFilter()!=null && !"".equals(vehicle.getHourlyRentFilter()))
		{
			String rent = vehicle.getHourlyRentFilter();
			boolean isAnd = false;
			   if(rent.contains("Below 100"))
			   {
				   query.append(" and v.hourlyRent < 100");
				   isAnd=true;
			   }
			   if (rent.contains("100-300"))
			   {
				   if(isAnd) {
					   query.append(" or v.hourlyRent between 100 and 300");

				   } else {
					   query.append(" and v.hourlyRent between 100 and 300");
					   isAnd=true;
				   }
			   }
			   if (rent.contains("Above 300"))
			   {
				   if(isAnd) {
					   query.append(" or v.hourlyRent > 300");

				   } else {
					   query.append(" and v.hourlyRent > 300");
					   isAnd=true;
				   }
			   }
		}
		if(vehicle.getDailyRentFilter()!=null && !"".equals(vehicle.getDailyRentFilter()))
		{
			String rent = vehicle.getDailyRentFilter();
			boolean isAnd = false;
			   if(rent.contains("Below 500"))
			   {
				   query.append(" and v.dailyRent < 500");
				   isAnd=true;
			   }
			   if (rent.contains("500-1000"))
			   {
				   if(isAnd) {
					   query.append(" or v.dailyRent between 500 and 1000");

				   } else {
					   query.append(" and v.dailyRent between 500 and 1000");
					   isAnd=true;
				   }
			   }
			   if (rent.contains("Above 1000"))
			   {
				   if(isAnd) {
					   query.append(" or v.dailyRent > 1000");

				   } else {
					   query.append(" and v.dailyRent > 1000");
					   isAnd=true;
				   }
			   }
		}
		if(vehicle.getCityId()!=0) {
			long cityid=vehicle.getCityId();
			query.append(" and a.cityId="+cityid);
		}
		
		List<Vehicle> list = DbUtility.getListData(query.toString(),Vehicle.class);
		return list;
	}


	
	

}
