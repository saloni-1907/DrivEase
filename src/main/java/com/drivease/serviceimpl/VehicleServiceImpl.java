package com.drivease.serviceimpl;

import java.io.File;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.drivease.dao.AreaDao;
import com.drivease.dao.UserDao;
import com.drivease.dao.VehicleDao;
import com.drivease.dao.VehicleModelDao;
import com.drivease.model.Vehicle;
import com.drivease.model.VehicleModel;
import com.drivease.model.Area;
import com.drivease.model.User;
import com.drivease.service.VehicleService;

import com.drivease.util.FTPUtils;
import com.drivease.util.FileUtils;



@Service("vehicleservice")
@Transactional
@SessionAttributes("user")
public class VehicleServiceImpl implements VehicleService {
	
	@Autowired
	VehicleDao vehicledao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UserDao userdao;
	
	@Autowired
	VehicleModelDao vehiclemodeldao;
	
	@Autowired
	AreaDao areadao;
	
	String absolutePath1 = "";
	//private static String UPLOADED_FOLDER2 ="D://tools//apache-tomcat-9.0.11-windows-x64//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//vehiclePicture"+File.separator;
	private static String UPLOADED_FOLDER2 ="D://Tools//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//vehiclePicture"+File.separator;
	
	//private static String UPLOADED_FOLDER1 ="D://tools//apache-tomcat-9.0.11-windows-x64//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//vehiclePicture"+File.separator;
	private static String UPLOADED_FOLDER1 ="D://Tools//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//profilePicture"+File.separator;
		
	public long saveVehicle(Vehicle vehicle, MultipartFile file1) {
		/*List<Vehicle> list = vehicledao.checkVehicleNo(vehicle.getVehicleNumber());
		if(list!=null) {
			return 0;
		}*/
		
		String newPP=FileUtils.getFileName(file1.getOriginalFilename());
		vehicle.setVehiclePicture(newPP);
		//vehicle.setVehicleImage(file1);
		vehicle.setStatus("Available");
		vehicle.setIsAvailable(1);
		User ud=(User)session.getAttribute("user");
		if(ud==null)
		{
			return 0;
		}
		vehicle.setUserId(ud.getUserId());
		vehicle.setIsActive(1);
		vehicle.setCreatedDate(new Date(System.currentTimeMillis()));
		vehicle.setModifiedDate(new Date(System.currentTimeMillis()));
		Vehicle v1=vehicledao.saveObject(vehicle);
		if(v1!=null)
		{
		
			FileUtils.uploadImageFile(file1, UPLOADED_FOLDER2+newPP);
			FTPUtils.uploadOnFTP(UPLOADED_FOLDER2+newPP, newPP);
			return v1.getVehicleId();

		}
		return 0;
	}

	public Vehicle getAllDetails(long vid) {
		
		Vehicle v= vehicledao.getById(Vehicle.class,vid);
		String newPP = v.getVehiclePicture();
		
		File VehicleImage = new File(UPLOADED_FOLDER2+newPP);
		if(!VehicleImage.exists())
		{
			FTPUtils.download(newPP, UPLOADED_FOLDER2+newPP);
		
		}
		
		User u = userdao.getById(User.class,v.getUserId());
		v.setLenderName(u.getFname()+" "+u.getLname());
		v.setLenderMobile(u.getMobileNo());
		v.setLenderEmail(u.getEmailId());
		String newPP1 = u.getProfilePicture();
		File ProfileImage = new File(UPLOADED_FOLDER1+newPP1);
		if(!ProfileImage.exists())
		{
			FTPUtils.download(newPP1, UPLOADED_FOLDER1+newPP1);
		}
		v.setLenderPicture(u.getProfilePicture());
		VehicleModel vm = vehiclemodeldao.getAllDetails(v.getModelId());
		v.setCompanyId(vm.getCompanyId());
		v.setCompanyName(vm.getCompanyName());
		v.setModelName(vm.getModelName());
		v.setVehicleTypeName(vm.getVehicleTypeName());
		Area a = areadao.getAllDetails(v.getAreaId());
		v.setStateId(a.getStateId());
		v.setStateName(a.getStateName());
		v.setCityId(a.getCityId());
		v.setCityName(a.getCityName());
		v.setAreaName(a.getAreaName());
		return v;
	}

	public List<Vehicle> getAll() {
		List<Vehicle> list=vehicledao.getAll();
		for(Vehicle v:list)
		{
			String newPP = v.getVehiclePicture();
		
			File VehicleImage = new File(UPLOADED_FOLDER2+newPP);
			if(!VehicleImage.exists())
			{
				FTPUtils.download(newPP, UPLOADED_FOLDER2+newPP);
		
			}
		}
		return list;
	}

	public List<Vehicle> getMyVehicles() {
		User u =(User)session.getAttribute("user");
		List<Vehicle> list=vehicledao.getMyVehicles(u.getUserId());
		for(Vehicle v:list)
		{
			String newPP = v.getVehiclePicture();
		
			File VehicleImage = new File(UPLOADED_FOLDER2+newPP);
			if(!VehicleImage.exists())
			{
				FTPUtils.download(newPP, UPLOADED_FOLDER2+newPP);
		
			}
		}
		return list;
	}

	public boolean deleteVehicle(long id) {
		return vehicledao.deleteVehicle(id);
	}

	public Vehicle getById(long result1) {
		
		return vehicledao.getById(Vehicle.class,result1);
		
	}
	public Vehicle updateVehicle(Vehicle vehicle, MultipartFile file) {
		Vehicle oldad=vehicledao.getById(Vehicle.class,vehicle.getVehicleId());
		if(file.isEmpty()) {
			vehicle.setVehiclePicture(oldad.getVehiclePicture());
		}
		else if(!oldad.getVehiclePicture().equals(file.getOriginalFilename()))
		{
			String newPP = FileUtils.getFileName(file.getOriginalFilename());
			FileUtils.uploadImageFile(file, UPLOADED_FOLDER2+newPP);
			FTPUtils.uploadOnFTP(UPLOADED_FOLDER2+newPP, newPP);
			vehicle.setVehiclePicture(newPP);
		}
		vehicle.setWithDriver(oldad.getWithDriver());
		vehicle.setIsAvailable(1);
		vehicle.setStatus("Available");
		vehicle.setCreatedDate(oldad.getCreatedDate());
		vehicle.setModifiedDate(new Date(System.currentTimeMillis()));
		Vehicle v = vehicledao.updateObject(vehicle);
		return v;
	}

	public List<Vehicle> getRecentVehicles() {
		List<Vehicle> list=vehicledao.getRecent();
		for(Vehicle v:list)
		{
			String newPP = v.getVehiclePicture();
		
			File VehicleImage = new File(UPLOADED_FOLDER2+newPP);
			if(!VehicleImage.exists())
			{
				FTPUtils.download(newPP, UPLOADED_FOLDER2+newPP);
		
			}
		}
		return list;
	}

	public List<Vehicle> getVehicleFilter(Vehicle vehicle) {
		List<Vehicle> list=vehicledao.getVehicleFilter(vehicle);
		for(Vehicle v:list)
		{
			String newPP = v.getVehiclePicture();
		
			File VehicleImage = new File(UPLOADED_FOLDER2+newPP);
			if(!VehicleImage.exists())
			{
				FTPUtils.download(newPP, UPLOADED_FOLDER2+newPP);
		
			}
		}
		return list;
	}

	
	
	
	

}
