package com.wfms.util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utility {
	public static Date convertToSQLDate(String str) {
		Date date = null;
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date dt;
		try {
			dt = formatter.parse(str);
			date = new java.sql.Date(dt.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static String getOnlyDate(Date date){
		SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy");
		return sd.format(date);
	}
	
	public static String getFormattedDate(Date date){
		SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		return sd.format(date);
	}
}
