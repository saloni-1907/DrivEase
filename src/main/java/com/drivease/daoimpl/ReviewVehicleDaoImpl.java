package com.drivease.daoimpl;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.ReviewVehicleDao;
import com.drivease.model.ReviewVehicle;

@Repository("reviewVehicleDao")
@SessionAttributes("user")

public class ReviewVehicleDaoImpl extends GenericDaoImpl<ReviewVehicle> implements ReviewVehicleDao {

}
