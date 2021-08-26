package com.drivease.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.drivease.dao.LicenseDao;
import com.drivease.model.License;

@Repository("licensedao")
public class LicenseDaoImpl extends GenericDaoImpl<License> implements LicenseDao {

	public int checkLicenseNo(String licenseNo) {
		String query = "FROM License where licenseNo='" + licenseNo + "'";
		List<License> list = super.getByQuery(query);
		
		return list.size();
		
	}

}
