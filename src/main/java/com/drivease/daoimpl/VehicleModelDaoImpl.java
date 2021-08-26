package com.drivease.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.drivease.dao.VehicleModelDao;
import com.drivease.model.VehicleModel;
import com.drivease.util.DbUtility;

@Repository("vehiclemodeldao")
public class VehicleModelDaoImpl extends GenericDaoImpl<VehicleModel>  implements VehicleModelDao {

	public List<VehicleModel> getAll() {

		List<VehicleModel> list = DbUtility.getListData("SELECT m.modelId as modelId,"
				+ " m.modelName as modelName,m.companyId as companyId,"
				+ " c.companyName as companyName,t.vehicleTypeName as vehicleTypeName"
				+ " FROM vehicle_model m INNER JOIN vehicle_company c"
				+ " ON m.companyId = c.companyId INNER JOIN vehicle_type t ON"
				+ " m.vehicleTypeId = t.vehicleTypeId WHERE m.isDeleted=0 and c.isDeleted=0 and "
				+ " t.isDeleted=0", VehicleModel.class);
		return list;
		//return super.getByQuery("FROM VehicleModel vm WHERE vm.isDeleted=0");
	}

	public VehicleModel getAllDetails(long modelId) {
		List<VehicleModel> list = DbUtility.getListData("SELECT m.modelId as modelId,"
				+ " m.modelName as modelName,m.companyId as companyId,"
				+ " c.companyName as companyName,t.vehicleTypeName as vehicleTypeName"
				+ " FROM vehicle_model m INNER JOIN vehicle_company c"
				+ " ON m.companyId = c.companyId INNER JOIN vehicle_type t ON"
				+ " m.vehicleTypeId = t.vehicleTypeId WHERE m.isDeleted=0 and c.isDeleted=0 and "
				+ " t.isDeleted=0 and m.modelId="+modelId, VehicleModel.class);
		return list.get(0);
	}

}