package com.drivease.serviceimpl;

import java.io.File;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.drivease.dao.DriverDao;
import com.drivease.dao.LicenseDao;
import com.drivease.dao.VehicleTypeDao;
import com.drivease.model.Driver;
import com.drivease.model.License;
import com.drivease.model.User;
import com.drivease.model.VehicleType;
import com.drivease.service.DriverService;
import com.drivease.service.UserService;

import com.drivease.util.FTPUtils;
import com.drivease.util.FileUtils;


@Service("driverservice")
@Transactional
@SessionAttributes("user")
public class DriverServiceImpl implements DriverService {
	
	@Autowired
	DriverDao driverdao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	LicenseDao licensedao;
	
	@Autowired
	VehicleTypeDao vehicletypedao;
	
	@Autowired
	UserService userservice;
	
	//private static String UPLOADED_FOLDER1 ="D://tools//apache-tomcat-9.0.11-windows-x64//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//vehiclePicture"+File.separator;
	private static String UPLOADED_FOLDER2 ="D://Tools//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//licensePicture"+File.separator;
		
	
	public long saveDriver(Driver driver) {
		User ud=(User)session.getAttribute("user");
		if(ud==null)
		{
			return 0;
		}
		driver.setUserId(ud.getUserId());
		driver.setStatus("Available");
		driver.setIsAvailable(1);
		driver.setIsActive(1);
		driver.setCreatedDate(new Date(System.currentTimeMillis()));
		Driver d1=driverdao.saveDriver(driver);
		if(d1!=null)
		{
			return d1.getDriverId();
		}
		else {
			return 0;
		}
	}


	public Driver getDriverByUserId(long userId) {
		return driverdao.getDriverByUserId(userId);
	}


	public Driver getAllDetails(long driverId) {
		Driver driver = driverdao.getById(Driver.class, driverId);
		License l1 = licensedao.getById(License.class, driver.getLicenseId());
		String newPP = l1.getLicensePicture();
		File LicenseImage = new File(UPLOADED_FOLDER2+newPP);
		if(!LicenseImage.exists())
		{
			FTPUtils.download(newPP, UPLOADED_FOLDER2+newPP);
		}
		driver.setLicensePicture(l1.getLicensePicture());
		driver.setLicenseNo(l1.getLicenseNo());
		driver.setDateOfIssue(l1.getDateOfIssue());
		driver.setDateOfExpiry(l1.getDateOfExpiry());
		VehicleType vt = vehicletypedao.getById(VehicleType.class,driver.getVehicleTypeId());
		driver.setVehicleTypeName(vt.getVehicleTypeName());
		return driver;
		
	}


	public long updateDriver(Driver driver) {
		User ud=(User)session.getAttribute("user");
		if(ud==null)
		{
			return 0;
		}
		Driver oldad=driverdao.getById(Driver.class,driver.getDriverId()); 
		driver.setIsActive(1);
		driver.setCreatedDate(oldad.getCreatedDate());
		driver.setModifiedDate(new Date(System.currentTimeMillis()));
		driver.setStatus("Available");
		driver.setIsAvailable(1);
		Driver d1=driverdao.updateDriver(driver);
		if(d1!=null)
		{
			return d1.getDriverId();
		}
		else {
			return 0;
		}
	}
	
	public List<Driver> getAll() {
		List<Driver> list=driverdao.getAll();
		for(Driver d:list)
		{
			User user = userservice.getAllDetails(d.getUserId());
			d.setDriverName(user.getFname()+" "+user.getLname());
			d.setProfilePicture(user.getProfilePicture());
		}
		return list;
	}


	public List<Driver> getRecentDrivers() {
		List<Driver> list=driverdao.getRecent();
		for(Driver d:list)
		{
			User user = userservice.getAllDetails(d.getUserId());
			d.setDriverName(user.getFname()+" "+user.getLname());
			d.setProfilePicture(user.getProfilePicture());
		}
		return list;
	}


	public boolean deactivateDriver(long driverId) {
		Driver driver = driverdao.getById(Driver.class, driverId);
		driver.setModifiedDate(new Date(System.currentTimeMillis()));
		driver.setIsActive(0);
		return driverdao.updateObject(driver).getDriverId()>0;
	}


	public List<Driver> getDriverFilter(Driver driver) {
		List<Driver> list=driverdao.getDriverFilter(driver);
		for(Driver d:list)
		{
			User user = userservice.getAllDetails(d.getUserId());
			d.setDriverName(user.getFname()+" "+user.getLname());
			d.setProfilePicture(user.getProfilePicture());
		}
		return list;
	}


}
