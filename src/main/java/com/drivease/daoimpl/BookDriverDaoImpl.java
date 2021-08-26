package com.drivease.daoimpl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.drivease.dao.BookDriverDao;
import com.drivease.model.BookDriver;
import com.drivease.util.DbUtility;

@Repository("bookDriverDao")
@SessionAttributes("user")

public class BookDriverDaoImpl  extends GenericDaoImpl<BookDriver> implements BookDriverDao  {

		public boolean isDriverBooking(long bookingId) {
		// TODO Auto-generated method stub
		return false;
	}

	public BookDriver updateBookingStatus(long bid, String status) {
		List<BookDriver> list=super.getByQuery("FROM BookDriver bv WHERE bv.bookingId="+bid);
		BookDriver bk = list.get(0);
		bk.setStatus(status);
		return super.updateObject(bk);
	}

	
}
