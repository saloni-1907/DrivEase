package com.drivease.daoimpl;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.UserDao;
import com.drivease.model.User;



@Repository("userdao")
@SessionAttributes("user")
public class UserDaoImpl extends GenericDaoImpl<User> implements UserDao {

	public User loginCheck(User user) {
		String query = "FROM User where emailId='" + user.getEmailId() + "' and password='" + user.getPassword() + "'";
		List<User> list = super.getByQuery(query);
		if (list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	public int emailCheck(User user) {
		String query = "FROM User where emailId='" + user.getEmailId() + "'";
		List<User> list = super.getByQuery(query);
		if (list.size() == 0) {
			return 1;
		}
		return 0;
	}

	public User forgotpassword(User user) {
		Criteria criteria = getSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("emailId", user.getEmailId()));
		User us = (User) criteria.uniqueResult();
		return us;
	}
	
	

}
