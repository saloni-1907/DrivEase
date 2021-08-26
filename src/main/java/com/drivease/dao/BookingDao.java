package com.drivease.dao;

import java.util.List;

import com.drivease.dao.GenericDAO;
import com.drivease.model.Booking;

public interface BookingDao extends GenericDAO<Booking> {

		public List<Booking> getMyVehicleBookings(long userId);

		public List<Booking> getMyVehicleRequests(long userId);

		public long updateBookingStatus(long bid, String status);

		public List<Booking> getMyDriverBookings(long userId);

		public List<Booking> getMyDriverRequests(long userId);

		public int checkVehicleBooking(Booking booking, long id);

		public int checkDriverBooking(Booking booking, long id);

		public int isVehicleBooked(long id);

}
