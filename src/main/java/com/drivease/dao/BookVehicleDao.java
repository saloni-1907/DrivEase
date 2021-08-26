package com.drivease.dao;

import java.util.List;

import com.drivease.dao.GenericDAO;
import com.drivease.model.BookVehicle;

public interface BookVehicleDao extends GenericDAO<BookVehicle> {

	public boolean isVehicleBooking(long bookingId);

	public BookVehicle updateBookingStatus(long bid, String string);

}
