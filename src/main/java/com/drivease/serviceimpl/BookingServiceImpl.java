package com.drivease.serviceimpl;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.BookDriverDao;
import com.drivease.dao.BookVehicleDao;
import com.drivease.dao.BookingDao;
import com.drivease.dao.DriverDao;
import com.drivease.dao.VehicleDao;
import com.drivease.dao.UserDao;
import com.drivease.model.BookDriver;
import com.drivease.model.BookVehicle;
import com.drivease.model.Booking;
import com.drivease.model.Driver;
import com.drivease.model.Vehicle;
import com.drivease.model.User;
import com.drivease.service.BookingService;
import com.drivease.util.DateTimeOperation;
import com.drivease.util.Mailer;

@Service("bookingservice")
@Transactional
@SessionAttributes("user")

public class BookingServiceImpl implements BookingService {
	
	@Autowired
	BookingDao bookingDao;

	@Autowired
	HttpSession session;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	VehicleDao vehicleDao;
	
	@Autowired
	BookVehicleDao bookVehicleDao;
	
	@Autowired
	BookDriverDao bookDriverDao;
	
	@Autowired
	DriverDao driverdao;
	


	public long addBooking(Booking booking) {
	booking.setBookingDate(new Date(System.currentTimeMillis()));
	User ad = (User) session.getAttribute("user");
	booking.setStartingDate(DateTimeOperation.changeStrToDate(booking.getStartDate()));
	booking.setEndingDate(DateTimeOperation.changeStrToDate(booking.getEndDate()));
	//booking.setStartingDate(Timestamp.valueOf(booking.getStartDate()));
	//booking.setEndingDate(Timestamp.valueOf(booking.getEndDate()));
	booking.setUserId(ad.getUserId());
	booking.setStatus("Requested");
	booking.setIsActive(1);
	Booking b = bookingDao.saveObject(booking);
	if(b!=null)
	{
		return b.getBookingId(); 
	}
	return 0;
}

	public long bookVehicle(long bookingId, long vehicleId) {
		BookVehicle bk = new BookVehicle();
		bk.setBookingId(bookingId);
		bk.setVehicleId(vehicleId);
		bk.setStatus("Requested");
		bk.setIsActive(1);
		BookVehicle bkv = bookVehicleDao.saveObject(bk);
		if(bkv.getBookVehicleId()==0) {
			return 0;
		}
		Booking book = bookingDao.getById(Booking.class, bkv.getBookingId());
		User borrower = userDao.getById(User.class, book.getUserId());
		Vehicle v = vehicleDao.getById(Vehicle.class, bkv.getVehicleId());
		User lender = userDao.getById(User.class, v.getUserId());
		String msg =borrower.getFname()+" " + borrower.getLname()+ " has requested for your vehicle "+ v.getVehicleNumber() +" .";
		Mailer.send("drivease2419@gmail.com", "drivEase@1924", lender.getEmailId(), "Request for your vehicle","Dear " +lender.getFname() +" "+ lender.getLname() + "\n"+ msg);
		return bkv.getBookVehicleId();
		
	}
	
	public long bookDriver(long bookingId, long driverId) {
		BookDriver bk = new BookDriver();
		bk.setBookingId(bookingId);
		bk.setDriverId(driverId);
		bk.setStatus("Requested");
		bk.setIsActive(1);
		BookDriver bkv = bookDriverDao.saveObject(bk);
		if(bkv.getBookDriverId()==0) {
			return 0;
		}
		Booking book = bookingDao.getById(Booking.class, bkv.getBookingId());
		User borrower = userDao.getById(User.class, book.getUserId());
		Driver d = driverdao.getById(Driver.class, bkv.getDriverId());
		User driver = userDao.getById(User.class, d.getUserId());
		String msg =borrower.getFname()+" " + borrower.getLname()+ " has requested for your driving service "+ " .";
		Mailer.send("drivease2419@gmail.com", "drivEase@1924", driver.getEmailId(), "Request for your driving service","Dear " +driver.getFname() +" "+ driver.getLname() + "\n"+ msg);
		return bkv.getBookDriverId();
		
	}

	public List<Booking> getMyVehicleBookings() {
		User ad = (User) session.getAttribute("user");
		List<Booking> list = bookingDao.getMyVehicleBookings(ad.getUserId());
		return list;
	}
	
	public List<Booking> getMyDriverBookings() {
		User ad = (User) session.getAttribute("user");
		List<Booking> list = bookingDao.getMyDriverBookings(ad.getUserId());
		return list;
	}


	public List<Booking> getMyVehicleRequests() {
		User ad = (User) session.getAttribute("user");
		List<Booking> list = bookingDao.getMyVehicleRequests(ad.getUserId());
		return list;
	}
	
	public List<Booking> getMyDriverRequests() {
		User ad = (User) session.getAttribute("user");
		List<Booking> list = bookingDao.getMyDriverRequests(ad.getUserId());
		return list;
	}

	public long updateBookingStatus(long bid, String status,String bookingfor) {
		Booking booking = bookingDao.getById(Booking.class, bid);
		booking.setStatus(status);
		User borrower = userDao.getById(User.class, booking.getUserId());
		String msg="";
		if("Vehicle".equalsIgnoreCase(bookingfor))
		{
			BookVehicle bkv = bookVehicleDao.updateBookingStatus(bid,status);
			if(bkv==null) {
				return 0;
			}
			Vehicle v = vehicleDao.getById(Vehicle.class, bkv.getVehicleId());
			User lender = userDao.getById(User.class, v.getUserId());
			msg ="Your booking for "+ v.getVehicleNumber() + " has been " + status + " by lender: " + lender.getFname() + " "+ lender.getLname() +" .";
		}
		else if("Driver".equalsIgnoreCase(bookingfor))
		{
			BookDriver bkd = bookDriverDao.updateBookingStatus(bid, status);
			if(bkd==null) {
				return 0;
			}
			Driver d = driverdao.getById(Driver.class, bkd.getDriverId());
			User driver = userDao.getById(User.class, d.getUserId());
			msg ="Your booking request for Driver: "+ driver.getFname() +" " + driver.getLname()  + " has been " + status + " .";
			
		}
		Mailer.send("drivease2419@gmail.com", "drivEase@1924", borrower.getEmailId(), "Your request has been accepted","Dear " +borrower.getFname()+" " + borrower.getLname() + "\n"+ msg);
		return bookingDao.updateObject(booking).getBookingId();
	}

	public int checkVehicleBooking(Booking booking, long id) {
		booking.setStartingDate(DateTimeOperation.changeStrToDate(booking.getStartDate()));
		booking.setEndingDate(DateTimeOperation.changeStrToDate(booking.getEndDate()));
		return bookingDao.checkVehicleBooking(booking,id);
	}

	public int checkDriverBooking(Booking booking, long id) {
		booking.setStartingDate(DateTimeOperation.changeStrToDate(booking.getStartDate()));
		booking.setEndingDate(DateTimeOperation.changeStrToDate(booking.getEndDate()));
		return bookingDao.checkDriverBooking(booking,id);
	}

	public int isVehicleBooked(long id) {
		return bookingDao.isVehicleBooked(id);
	}

	
	
	
}




