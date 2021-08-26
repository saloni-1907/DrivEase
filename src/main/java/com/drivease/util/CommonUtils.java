package com.drivease.util;

public class CommonUtils {
	
	public static String convertInClause(String inClause) {
		String arr[] = inClause.split(",");
		String str2="";
		for (String string : arr) {
			str2+='"' +string + '"' + ',';
		}
		return str2.substring(0,str2.length()-1);

	}

}
