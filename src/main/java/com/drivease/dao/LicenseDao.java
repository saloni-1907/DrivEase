package com.drivease.dao;

import java.util.List;

import com.drivease.model.License;

public interface LicenseDao extends GenericDAO<License> {

	public int checkLicenseNo(String licenseNo);

}
