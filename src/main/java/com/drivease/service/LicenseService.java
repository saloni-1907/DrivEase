package com.drivease.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.drivease.model.License;

@Service("licenseService")
public interface LicenseService {

	long saveLicense(License license, MultipartFile file1);

	long updateLicense(License license, MultipartFile file1);

	License getLicenseByDriverId(long licenseId);

}
