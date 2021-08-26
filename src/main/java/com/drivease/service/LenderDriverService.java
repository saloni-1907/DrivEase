package com.drivease.service;


import org.springframework.web.multipart.MultipartFile;

import com.drivease.model.LenderDriver;

public interface LenderDriverService {

	long saveLenderDriver(LenderDriver lenderDriver);

	LenderDriver getByVehicleId(long vehicleId);

	long updateLenderDriver(LenderDriver driver);

}
