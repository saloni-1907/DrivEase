package com.drivease.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vehicle_type")

public class VehicleType {
	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private long vehicleTypeId;
		private String vehicleTypeName;
		private int isActive;
		private int isDeleted;
		public long getVehicleTypeId() {
			return vehicleTypeId;
		}
		public void setVehicleTypeId(long vehicleTypeId) {
			this.vehicleTypeId = vehicleTypeId;
		}
		public String getVehicleTypeName() {
			return vehicleTypeName;
		}
		public void setVehicleTypeName(String vehicleTypeName) {
			this.vehicleTypeName = vehicleTypeName;
		}
		public int getIsActive() {
			return isActive;
		}
		public void setIsActive(int isActive) {
			this.isActive = isActive;
		}
		public int getIsDeleted() {
			return isDeleted;
		}
		public void setIsDeleted(int isDeleted) {
			this.isDeleted = isDeleted;
		}
		
		
		

}
