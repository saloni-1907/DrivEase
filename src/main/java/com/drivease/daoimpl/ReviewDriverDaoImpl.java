package com.drivease.daoimpl;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.ReviewDriverDao;
import com.drivease.model.ReviewDriver;

@Repository("reviewDriverDao")
@SessionAttributes("user")

public class ReviewDriverDaoImpl extends GenericDaoImpl<ReviewDriver> implements ReviewDriverDao {

}
