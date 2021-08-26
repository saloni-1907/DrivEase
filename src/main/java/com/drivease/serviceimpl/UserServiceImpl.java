package com.drivease.serviceimpl;

import java.io.File;
import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.drivease.dao.AreaDao;
import com.drivease.dao.UserDao;
import com.drivease.model.Area;
import com.drivease.model.User;
import com.drivease.service.UserService;
import com.drivease.util.FTPUtils;
import com.drivease.util.FileUtils;

import com.drivease.util.PasswordEncode;





@Service("userservice")
@Transactional
@SessionAttributes("user")
public class UserServiceImpl  implements UserService {
	
	@Autowired
	UserDao userdao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	AreaDao areadao;
	
	String absolutePath1 = ""; 
	//private static String UPLOADED_FOLDER1 ="D://tools//apache-tomcat-9.0.11-windows-x64//apache-tomcat-9.0.11//webapps//userdrivease//resources//images";
	//private static String UPLOADED_FOLDER1 ="D://tools//apache-tomcat-9.0.11-windows-x64//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//profilePicture"+File.separator;
	private static String UPLOADED_FOLDER1 ="D://Tools//apache-tomcat-9.0.11//webapps//userdrivease//resources//images//profilePicture"+File.separator;


	public long saveUser(User user, MultipartFile file1) {
		if(user.getPassword().equals(user.getCpassword()))
		{
			String newPP=FileUtils.getFileName(file1.getOriginalFilename());
			user.setProfilePicture(newPP);
			//user.setProfileImage(file1);
			String password = user.getPassword();
			User ud=(User)session.getAttribute("user");
			user.setIsActive(1);
			user.setCreatedDate(new Date(System.currentTimeMillis()));
			//user.setModifiedBy(ud.getUserId());
			//user.setModifiedDate(new Date(System.currentTimeMillis()));
			//int result = userdao.emailCheck(user);
			/*if(result!=0)
			{
				return 1;
			}*/
			if (user != null) {
			
				user.setPassword(PasswordEncode.passwordEncode(password));
			}
	
			User a=userdao.saveObject(user);
			if(a!=null)
			{
			
				FileUtils.uploadImageFile(file1, UPLOADED_FOLDER1+newPP);
				FTPUtils.uploadOnFTP(UPLOADED_FOLDER1+newPP, newPP);
			}
			return 1;
		}
		else
		{
			return 0;
		}
	}

	public long saveupdateUser(User user, MultipartFile file1) {
		// TODO Auto-generated method stub
		return 0;
	}

	public User getAllDetails(long userId) {
		User u = userdao.getById(User.class, userId);
		String newPP = u.getProfilePicture();
		
		File ProfileImage = new File(UPLOADED_FOLDER1+newPP);
		if(!ProfileImage.exists())
		{
			FTPUtils.download(newPP, UPLOADED_FOLDER1+newPP);
		}
		Area a = areadao.getAllDetails(u.getAreaId());
		u.setStateId(a.getStateId());
		u.setStateName(a.getStateName());
		u.setCityId(a.getCityId());
		u.setCityName(a.getCityName());
		u.setAreaName(a.getAreaName());
		return u;
	}

	public long updateUser(User user, MultipartFile file) {
		User oldad=userdao.getById(User.class,user.getUserId()); 
		User ad = (User)session.getAttribute("user"); 
		//user.setModifiedBy(ad.getUserId());
		user.setCreatedDate(oldad.getCreatedDate());
		user.setModifiedDate(new Date(System.currentTimeMillis()));
		if(file.isEmpty())
		{
			user.setProfilePicture(oldad.getProfilePicture());
		}
		else if(!oldad.getProfilePicture().equals(file.getOriginalFilename())) { 
			String newPP = FileUtils.getFileName(file.getOriginalFilename());
			FileUtils.uploadImageFile(file, UPLOADED_FOLDER1+newPP);
			FTPUtils.uploadOnFTP(UPLOADED_FOLDER1+newPP, newPP);
			user.setProfilePicture(newPP);
		} 
		User u1 =userdao.updateObject(user);
		return u1.getUserId();
	}

	

}
