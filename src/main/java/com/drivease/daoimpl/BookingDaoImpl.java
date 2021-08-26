package com.drivease.daoimpl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.BookingDao;
import com.drivease.dao.GenericDAO;
import com.drivease.daoimpl.GenericDaoImpl;
import com.drivease.model.BookVehicle;
import com.drivease.model.Booking;
import com.drivease.model.User;
import com.drivease.service.BookingService;
import com.drivease.util.DbUtility;
import com.drivease.util.Mailer;

@Repository("bookingDao")
@SessionAttributes("user")

public class BookingDaoImpl  extends GenericDaoImpl<Booking> implements BookingDao  {

		public List<Booking> getMyVehicleBookings(long userId) {
			List<Booking> list=DbUtility.getListData("select b.bookingId as bookingId,b.status as status,b.startingDate as startingDate,b.endingDate as endingDate,b.finalAmount as finalAmount,bv.vehicleId as vehicleId FROM booking b INNER JOIN book_vehicle bv ON b.bookingId=bv.bookingId WHERE b.userId="+userId, Booking.class);
			return list;
		}

		public List<Booking> getMyDriverBookings(long userId) {
			List<Booking> list=DbUtility.getListData("select b.bookingId as bookingId,b.status as status,b.startingDate as startingDate,b.endingDate as endingDate,b.finalAmount as finalAmount,bd.driverId as driverId FROM booking b INNER JOIN book_driver bd ON b.bookingId=bd.bookingId WHERE b.userId="+userId, Booking.class);
			return list;
		}

		
		public List<Booking> getMyVehicleRequests(long userId) {
			List<Booking> list=DbUtility.getListData("select b.bookingId as bookingId,b.userId as userId,b.status as status,b.startingDate as startingDate,b.endingDate as endingDate,b.finalAmount as finalAmount,bv.vehicleId as vehicleId FROM booking b INNER JOIN book_vehicle bv ON b.bookingId=bv.bookingId INNER JOIN vehicle v ON bv.vehicleId=v.vehicleId  WHERE v.userId="+userId, Booking.class);
			return list;
		}
		
		public List<Booking> getMyDriverRequests(long userId) {
			List<Booking> list=DbUtility.getListData("select b.bookingId as bookingId,b.userId as userId,b.status as status,b.startingDate as startingDate,b.endingDate as endingDate,b.finalAmount as finalAmount,bd.driverId as driverId FROM booking b INNER JOIN book_driver bd ON b.bookingId=bd.bookingId INNER JOIN driver d ON bd.driverId=d.driverId  WHERE d.userId="+userId, Booking.class);
			return list;
		}


		public long updateBookingStatus(long bid, String status) {
			Booking booking = super.getById(Booking.class, bid);
			booking.setStatus(status);
			if(booking.getStatus().equalsIgnoreCase("Accept"))
			{
				//Mailer.send("easypg123@gmail.com", "easypgmtv@123", booking.getTemail(), "Hello,How r u?","your request for booking is accepted.");
			}
			if(booking.getStatus().equals("decline"))
			{
				//Mailer.send("easypg123@gmail.com", "easypgmtv@123", booking.getTemail(), "Hello,How r u?","your request for booking is declined.");
			}
			return super.updateObject(booking).getBookingId();
			}

		public int checkVehicleBooking(Booking booking, long id) {
			String query ="select b.bookingId, b.startingDate,b.endingDate "
					+ "from booking b inner join book_vehicle bv on b.bookingId = bv.bookingId"
					+ " where b.status='Accepted' and bv.vehicleId='"+id+"' and  (b.startingDate between '"+booking.getStartingDate()+"' "
					+ "and '"+booking.getEndingDate()+"' or b.endingDate  between '"+booking.getStartingDate()+"' "
					+ "and '"+booking.getEndingDate()+"')";
			List<Booking> list=DbUtility.getListData(query, Booking.class);
			return list.size();
		}

		public int checkDriverBooking(Booking booking, long id) {
			String query ="select b.bookingId, b.startingDate,b.endingDate "
					+ "from booking b inner join book_driver bd on b.bookingId = bd.bookingId"
					+ " where b.status='Accepted' and bd.driverId='"+id+"' and  (b.startingDate between '"+booking.getStartingDate()+"' "
					+ "and '"+booking.getEndingDate()+"' or b.endingDate  between '"+booking.getStartingDate()+"' "
					+ "and '"+booking.getEndingDate()+"')";
			List<Booking> list=DbUtility.getListData(query, Booking.class);
			return list.size();
		}

		public int isVehicleBooked(long id) {
			LocalDateTime dateTime = LocalDateTime.now();
			Timestamp currtime = Timestamp.valueOf(dateTime);
			String query = "select b.bookingId, b.startingDate,b.endingDate,b.status from booking b inner join book_vehicle bv"
					+ " on b.bookingId = bv.bookingId where b.status='Accepted' and bv.vehicleId=" + id 
					+ " and  '"+currtime+"' between b.startingDate and  b.endingDate";
			List<Booking> list=DbUtility.getListData(query, Booking.class);
			return list.size();
		}
}

