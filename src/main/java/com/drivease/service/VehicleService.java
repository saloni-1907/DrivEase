package com.drivease.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.drivease.model.Vehicle;


public interface VehicleService {

	public long saveVehicle(Vehicle vehicle, MultipartFile file1);

	public Vehicle getById(long result1);

	public List<Vehicle> getAll();

	public List<Vehicle> getMyVehicles();

	public boolean deleteVehicle(long id);

	public Vehicle getAllDetails(long id);

	public Vehicle updateVehicle(Vehicle vehicle, MultipartFile file);

	public List<Vehicle> getRecentVehicles();

	public List<Vehicle> getVehicleFilter(Vehicle vehicleFilter);

	

}
