package com.drivease.service;

import java.util.List;

import com.drivease.model.Booking;

public interface BookingService {

	long addBooking(Booking booking);

	long bookVehicle(long result1, long id);

	List<Booking> getMyVehicleBookings();

	List<Booking> getMyVehicleRequests();

	long updateBookingStatus(long bid, String status, String bookingfor);

	int checkVehicleBooking(Booking booking, long id);

	int checkDriverBooking(Booking booking, long id);

	long bookDriver(long result1, long id);

	List<Booking> getMyDriverBookings();

	List<Booking> getMyDriverRequests();

	int isVehicleBooked(long id);


}
