package com.drivease.serviceimpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drivease.dao.UserDao;
import com.drivease.model.User;
import com.drivease.service.LoginService;
import com.drivease.util.Mailer;
import com.drivease.util.PasswordEncode;
import com.drivease.util.RandomString;

@Service("loginservice")
@Transactional
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	UserDao userdao;

	@Autowired
	HttpSession session;

	public User login(User user) {
		String password = user.getPassword();
		user.setPassword(PasswordEncode.passwordEncode(password));
		return userdao.loginCheck(user);
	}

	public User forgotPassword(User user) {
		User a = userdao.forgotpassword(user);
		if (a!= null) 
		{
			int n = 6;
			String otp = RandomString.getNumericString(n);
			a.setOtp(otp);
			userdao.updateObject(a);
			Mailer.send("drivease2419@gmail.com", "drivEase@1924", user.getEmailId(), "Hello, Your OTP is ", otp);
		}
		return a;

	}

	public int checkOTP(User user) {
		if (user.getOtp() != null) 
		{
			User sUser = (User) session.getAttribute("user");
			if(sUser.getOtp().equals(user.getOtp()))
			{
				return 0;
			}
		}
		return 1;
	}

	public User newPassword(User user) {
		if(user.getCpassword().equals(user.getPassword()))
		{	
			//user.setPassword(PasswordEncode.passwordEncode(user.getPassword()));
//			Admin a = adminDao.changepassword(admin);
//			if(a==null)
//				return null;
			User sUser = (User) session.getAttribute("user");
			
			sUser.setPassword(PasswordEncode.passwordEncode(user.getPassword()));
			User usr = userdao.updateObject(sUser);
			//Mailer.send("maidinindia03@gmail.com", "mii@41926", admin.getEmailId(), "Hello,How r u?", a.getPassword());
			return usr;
			
		}
		return null;
	}

	public int changePass(User user) {
		User usr =(User)session.getAttribute("user");
		User u = userdao.getById(User.class, usr.getUserId());
		if(!u.getPassword().equals(PasswordEncode.passwordEncode(user.getOldPassword()))){
			return 1;
		}else if(!user.getPassword().equals(user.getCpassword())) {
			return 2;
		}else if(user.getOldPassword().equals(user.getPassword())) {
			return 3;
		}
		u.setPassword(PasswordEncode.passwordEncode(user.getPassword()));
		User newUser = userdao.updateObject(u);
		if(newUser!=null)
			return 0;
		else
			return 4;
	}

}
