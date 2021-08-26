package com.drivease.serviceimpl;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.drivease.dao.LenderDriverDao;
import com.drivease.model.LenderDriver;
import com.drivease.model.User;
import com.drivease.service.LenderDriverService;

import com.drivease.util.FTPUtils;
import com.drivease.util.FileUtils;


@Service("lenderdriverservice")
@Transactional
@SessionAttributes("user")
public class LenderDriverServiceImpl implements LenderDriverService {
	
	@Autowired
	LenderDriverDao lenderdriverdao;
	
	@Autowired
	HttpSession session;
	
	public long saveLenderDriver(LenderDriver lenderDriver) {
		lenderDriver.setIsActive(1);
		lenderDriver.setCreatedDate(new Date(System.currentTimeMillis()));
		lenderDriver.setModifiedDate(new Date(System.currentTimeMillis()));
		LenderDriver d1=lenderdriverdao.saveLenderDriver(lenderDriver);
		if(d1==null)
		{
			return 0;
		}
		return d1.getLenderDriverId();
	}

	public LenderDriver getByVehicleId(long vehicleId) { 
		return lenderdriverdao.getByVehicleId(vehicleId);
	}

	public long updateLenderDriver(LenderDriver driver) {
		driver.setModifiedDate(new Date(System.currentTimeMillis()));
		LenderDriver d1=lenderdriverdao.updateObject(driver);
		if(d1==null)
		{
			return 0;
		}
		return d1.getLenderDriverId();
	}
	
	
	

}
