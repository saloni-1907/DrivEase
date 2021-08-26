package com.drivease.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateTimeOperation {
	
	public static Timestamp changeStrToDate(String strInput)
	{
		/*
		//String str = "2020-07-31T23:07";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime dateTime = LocalDateTime.parse(str, formatter);
		Timestamp date_Time = Timestamp.valueOf(dateTime);
		return date_Time; */
		
		//String strInput ="07/29/2020 6:01 PM";
		SimpleDateFormat sdfmt1 = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
		SimpleDateFormat sdfmt2= new SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.util.Date dDate = new Date();
		try {
			dDate = sdfmt1.parse( strInput );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String strOutput = sdfmt2.format( dDate );
		DateTimeFormatter formattert = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime ldt = LocalDateTime.parse(strOutput,formattert);
		Timestamp dt = Timestamp.valueOf(ldt);
		//System.out.println(dDate + " " + strOutput + " " + dt);
		//System.out.println(dt);
		return dt;

	}

}
