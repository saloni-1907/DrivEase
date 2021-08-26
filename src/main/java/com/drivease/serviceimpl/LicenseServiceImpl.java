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

import com.drivease.dao.LicenseDao;

import com.drivease.model.License;
import com.drivease.model.User;
import com.drivease.service.LicenseService;

import com.drivease.util.FTPUtils;
import com.drivease.util.FileUtils;


@Service("licenseservice")
@Transactional
@SessionAttributes("user")
public class LicenseServiceImpl implements LicenseService {
	
	@Autowired
	LicenseDao licensedao;
	
	@Autowired
	HttpSession session;
	
	String absolutePath1 = "";
	//private static String UPLOADED_FOLDER1 ="D://tools//apache-tomcat-9.0.11-windows-x64//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//licensePicture"+File.separator;
	private static String UPLOADED_FOLDER1 ="D://Tools//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//licensePicture"+File.separator;
	
	public long saveLicense(License license, MultipartFile file1) {
		/*int check = licensedao.checkLicenseNo(license.getLicenseNo());
		if(check!=0) {
			return 0;
		}
		*/
		String newPP=FileUtils.getFileName(file1.getOriginalFilename());
		license.setLicensePicture(newPP);
		license.setLicenseImage(file1);
		license.setStatus(0);
		User ud=(User)session.getAttribute("user");
		
		license.setIsActive(1);
		license.setCreatedDate(new Date(System.currentTimeMillis()));
		License l1=licensedao.saveObject(license);
		if(l1!=null)
		{
		
			FileUtils.uploadImageFile(file1, UPLOADED_FOLDER1+newPP);
			FTPUtils.uploadOnFTP(UPLOADED_FOLDER1+newPP, newPP);
			return l1.getLicenseId();

		}else {
			return 0;
		}
	}

	public long updateLicense(License license, MultipartFile file) {
		/*List<License> list = licensedao.checkLicenseNo(license.getLicenseNo());
		if(list!=null) {
			return 0;
		}*/
		
		License oldl=licensedao.getById(License.class,license.getLicenseId()); 
		license.setCreatedDate(oldl.getCreatedDate());
		license.setModifiedDate(new Date(System.currentTimeMillis()));
		if(file.isEmpty()) {
			license.setLicensePicture(oldl.getLicensePicture());
		}
		else if(!oldl.getLicensePicture().equals(file.getOriginalFilename())) { 
			String newPP = FileUtils.getFileName(file.getOriginalFilename());
			FileUtils.uploadImageFile(file, UPLOADED_FOLDER1+newPP);
			FTPUtils.uploadOnFTP(UPLOADED_FOLDER1+newPP, newPP);
			license.setLicensePicture(newPP);
		} 
		License u1 =licensedao.updateObject(license);
		if(u1!=null) {
			return u1.getLicenseId();
		}else {
			return 0;
		}
		
	}

	public License getLicenseByDriverId(long licenseId) {
		return licensedao.getById(License.class,licenseId);
	}
}
	
	
	


