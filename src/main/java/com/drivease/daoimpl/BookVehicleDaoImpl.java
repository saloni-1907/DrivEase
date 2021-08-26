package com.drivease.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.BookVehicleDao;
import com.drivease.model.BookVehicle;
import com.drivease.util.DbUtility;

@Repository("bookVehicleDao")
@SessionAttributes("user")

public class BookVehicleDaoImpl  extends GenericDaoImpl<BookVehicle> implements BookVehicleDao  {

		public boolean isVehicleBooking(long bookingId) {
		// TODO Auto-generated method stub
		return false;
	}

	public BookVehicle updateBookingStatus(long bid, String status) {
		List<BookVehicle> list=super.getByQuery("FROM BookVehicle bv WHERE bv.bookingId="+bid);
		BookVehicle bk = list.get(0);
		bk.setStatus(status);
		return super.updateObject(bk);
	}

	
}
