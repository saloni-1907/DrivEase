package com.drivease.dao;

import java.util.List;

import com.drivease.dao.GenericDAO;
import com.drivease.model.BookDriver;

public interface BookDriverDao extends GenericDAO<BookDriver> {

	public boolean isDriverBooking(long bookingId);

	public BookDriver updateBookingStatus(long bid, String string);

}
