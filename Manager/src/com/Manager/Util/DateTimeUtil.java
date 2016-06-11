package com.Manager.Util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期处理辅助类
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2004
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author gaohj
 * @version 1.0
 */
public class DateTimeUtil {
//	private static Log log = Log.getLog(DateTimeUtil.class);
	
	public static final String LONGTIME_PATTERN = "yyyy-MM-dd HH:mm:ss";
	
	public static final String LONGTIME_PATTERN2 = "yyyyMMddHHmmss";

	public static final String MEDIATIME_PATTERN = "yyyy-MM-dd";
	
	public static final String MEDIATIME_PATTERN2 = "yyyyMMdd";

	public static final String SHORTTIME_PATTERN = "HH:mm:SS";
	

	public static boolean isDateTime(String dt) {
		SimpleDateFormat sdf = new SimpleDateFormat();
		try {
			sdf.parse(dt);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 得到指定日期的字符串格式：YYYY-MM-DD HH:mm:SS.ms
	 * 
	 * @param dt
	 *            指定的日期
	 * @return
	 */
	public static String getFullTime(Calendar dt) {
		return formatCalendar(dt, LONGTIME_PATTERN);
	}

	/**
	 * 得到当前日期的字符串格式：YYYY-MM-DD HH:mm:SS.ms
	 * 
	 * @return
	 */
	public static String getFullTime() {
		return getFullTime(Calendar.getInstance());
	}
	
	/**
	 * 得到当前日期的字符串格式：YYYY-MM-DD HH:mm:SS.ms
	 * 
	 * @return
	 */
	public static String getDateTime(String dateTimePattern) {
		return formatCalendar(Calendar.getInstance(), dateTimePattern);
	}
	/**
	 * dateTimeString 格式是Wed Dec 23 2015 00:00:00 GMT+0800 
	 * @param dateTimeString
	 * @return
	 */
	public static String getDateTimeByString(String timeString){
		SimpleDateFormat sdf=new  SimpleDateFormat("yyyy-MM-dd HH:mi:ss");
		System.out.println("testetsetstet:");
		return sdf.format(timeString);
	}

	/**
	 * 得到短日期格式：HH:mm:SS.ms
	 * 
	 * @param datetime
	 *            日期
	 * @return
	 */
	public static String getShortTime(Calendar datetime) {
		return formatCalendar(datetime, SHORTTIME_PATTERN);
	}

	/**
	 * 得到当前日期短日期格式：HH:mm:SS.ms
	 * 
	 * @return
	 */
	public static String getShortTime() {
		return getShortTime(Calendar.getInstance());
	}

	/**
	 * 得到日期格式：YYYY-MM-DD
	 * 
	 * @param datetime
	 *            日期
	 * @return
	 */
	public static String getMediumTime(Calendar datetime) {
		return formatCalendar(datetime, MEDIATIME_PATTERN);
	}

	/**
	 * 得到当前日期的年月日格式：YYYY-MM-DD
	 * 
	 * @return
	 */
	public static String getMediumTime() {
		return getMediumTime(Calendar.getInstance());
	}

	/**
	 * 比较两个日期的早晚，日期格式为：yyyy-MM-dd
	 * 
	 * @param date1
	 *            日期1
	 * @param date2
	 *            日期2
	 * @return 如果日期1晚于日期2，则返回大于0；如果日期1等日期2，则返回0；如果日期1早于日期2，则返回小于0
	 */
	public static int compareDate(String date1, String date2) {
		Date dt1 = toDate(date1);
		Date dt2 = toDate(date2);
		return dt1.compareTo(dt2);
	}

	/**
	 * 得到当前年份
	 * 
	 * @return
	 */
	public static int getCurrentYear() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR);
	}

	/**
	 * 得到当前月份
	 * 
	 * @return
	 */
	public static int getCurrentMonth() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.MONTH) + 1;
	}

	/**
	 * 得到当前日
	 * 
	 * @return
	 */
	public static int getCurrentDay() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 格式化给定时间
	 * 
	 * @param cal
	 *            给定时间
	 * @param pattern
	 *            要格式化的模式
	 * @return 格式化后的字符串
	 */
	public static String formatCalendar(Calendar cal, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(cal.getTime());
	}

	/**
	 * 将字符串(yyy-MM-dd)转化为日期
	 * 
	 * @param strDate
	 *            待转化的日期字符串
	 * @return 日期对象,如果字符串格式非法，则返回null
	 * @throws
	 */
	public static Date toDate(String strDate) {
		SimpleDateFormat sdf = new SimpleDateFormat(MEDIATIME_PATTERN);
		try {
			return sdf.parse(strDate);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 将字符串(yyyy-MM-dd HH:mm:ss)转化为日期
	 * 
	 * @param strDate
	 *            待转化的日期字符串
	 * @return 日期对象,如果字符串格式非法，则返回null
	 * @throws
	 */
	public static Date toDateTime(String strDate) {
		SimpleDateFormat sdf = new SimpleDateFormat(LONGTIME_PATTERN);
		try {
			return sdf.parse(strDate);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 将字符串(yyy-MM-dd)转化为日期
	 * 
	 * @param strDate
	 *            待转化的日期字符串
	 * @return 日期对象,如果字符串格式非法，则返回null
	 * @throws
	 */
	public static Calendar toCalendar(String strDate) {
		Date dt = toDate(strDate);
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);
		return cal;
	}

	public static void main(String[] args) {
//		System.out.println(getFullTime(Calendar.getInstance()));
	}

	/**
	 * 根据 日期（时间）字符串 解析日期（时间）
	 * 
	 * @param strTime
	 *            字符串形式的日期（时间），格式为：
	 *            <p/>
	 *            （1）yyyyMMdd （2） yyyy-MM-dd （3）yyyyMMddHHmmss （4） yyyy-MM-dd
	 *            HH:mm:ss
	 * @return Date 如果解析成功，则返回Date类型的对象，否则为 null
	 */
	private static Date parseDate(final String strTime) {
		if (strTime == null || strTime.trim().length() < 6) // 日期时间的最小长度必须大于等于6
		{
//			log.error("DateTimeUtil.parseDate()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");

			return null;
		}

		try {
			if (strTime.indexOf('-') >= 0) // yyyy-MM-dd HH:mm:ss
			{
				if (strTime.length() > 10) {
					SimpleDateFormat timeFormat2 = new SimpleDateFormat(LONGTIME_PATTERN);
					return timeFormat2.parse(strTime);
				} else{
					SimpleDateFormat dateFormat2 = new SimpleDateFormat(MEDIATIME_PATTERN);
					return dateFormat2.parse(strTime);
				}
			} else
			// yyyyMMddHHmmss
			{
				if (strTime.length() > 8) {
					SimpleDateFormat timeFormat1 = new SimpleDateFormat(LONGTIME_PATTERN2);
					return timeFormat1.parse(strTime);
				} else {
					SimpleDateFormat dateFormat1 = new SimpleDateFormat(MEDIATIME_PATTERN2);
					return dateFormat1.parse(strTime);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 将日期转化为指定格式的字符串
	 * 
	 * @param date
	 *            日期
	 * @param format
	 *            格式字符串
	 * @return 指定格式的日期字符串
	 */
	public static String formatDate(java.util.Date date, String format) {
		if (null == date) {
			return null;
		}
		SimpleDateFormat sdFromat = new SimpleDateFormat(format);
		return sdFromat.format(date);
	}

	/**
	 * 日期转换为字符串 短日期
	 * 
	 * @param date
	 * @return
	 */
	public static String dateToString(Date date) {
		if (date != null) {
			SimpleDateFormat dateFormat2 = new SimpleDateFormat(MEDIATIME_PATTERN);
			return dateFormat2.format(date);
		} else
			return null;
	}

	/**
	 * 日期转换为字符串 长日期
	 * 
	 * @param date
	 * @return
	 */
	public static String dateTimeToString(Date date) {
		if (date != null) {
			SimpleDateFormat timeFormat2 = new SimpleDateFormat(LONGTIME_PATTERN);
			return timeFormat2.format(date);
		} else
			return null;
	}

	/**
	 * 获取指定日期以后（以前）一定年数的日期
	 * 
	 * @param strTime
	 *            字符串形式的日期，格式可以为：（1）yyyyMMdd （2） yyyy-MM-dd
	 * @param count
	 *            要增加（减少）的年数，是负数表示向前的年数
	 * @return String 格式与输入的日期格式相同
	 */
	public static String dateAddYear(String strTime, int count) {
		if (strTime == null) {
//			log.error("DateTimeUtil.dateAddYear()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");
			return null;
		}

		Calendar calendar = Calendar.getInstance();

		Date dtSrc = parseDate(strTime);
		calendar.setTime(dtSrc);

		calendar.add(Calendar.YEAR, count);
		Date dtDst = calendar.getTime();

		if (strTime.indexOf('-') >= 0) // yyyy-MM-dd
		{
			SimpleDateFormat dateFormat2 = new SimpleDateFormat(MEDIATIME_PATTERN);
			return dateFormat2.format(dtDst);
		} else
		// //yyyyMMdd
		{
			SimpleDateFormat dateFormat1 = new SimpleDateFormat(MEDIATIME_PATTERN2);
			return dateFormat1.format(dtDst);
		}
	}

	/**
	 * 获取指定日期以后（以前）一定月份数的日期
	 * 
	 * @param strTime
	 *            字符串形式的日期，格式可以为：（1）yyyyMMdd （2） yyyy-MM-dd
	 * @param count
	 *            要增加（减少）的月份数，是负数表示向前的月份数
	 * @return String 格式与输入的日期格式相同
	 */
	public static String dateAddMonth(String strTime, int count) {
		if (strTime == null) {
//			log.error("DateTimeUtil.dateAddMonth()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");
			return null;
		}

		Calendar calendar = Calendar.getInstance();

		Date dtSrc = parseDate(strTime);
		calendar.setTime(dtSrc);

		calendar.add(Calendar.MONTH, count);
		Date dtDst = calendar.getTime();

		if (strTime.indexOf('-') >= 0) // yyyy-MM-dd
		{
			SimpleDateFormat dateFormat2 = new SimpleDateFormat(MEDIATIME_PATTERN);
			return dateFormat2.format(dtDst);
		} else
		// //yyyyMMdd
		{
			SimpleDateFormat dateFormat1 = new SimpleDateFormat(MEDIATIME_PATTERN2);
			return dateFormat1.format(dtDst);
		}
	}

	/**
	 * 获取指定日期以后（以前）n个星期的日期
	 * 
	 * @param strTime
	 *            字符串形式的日期，格式可以为：（1）yyyyMMdd （2） yyyy-MM-dd
	 * @param count
	 *            要增加（减少）的星期数，是负数表示向前的星期数
	 * @return String 格式与输入的日期格式相同
	 */
	public static String dateAddWeek(String strTime, int count) {
		if (strTime == null) {
//			log.error("DateTimeUtil.dateAddWeek()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");
			return null;
		}

		Calendar calendar = Calendar.getInstance();

		Date dtSrc = parseDate(strTime);
		calendar.setTime(dtSrc);

		calendar.add(Calendar.WEEK_OF_MONTH, count);
		Date dtDst = calendar.getTime();

		if (strTime.indexOf('-') >= 0) // yyyy-MM-dd
		{
			SimpleDateFormat dateFormat2 = new SimpleDateFormat(MEDIATIME_PATTERN);
			return dateFormat2.format(dtDst);
		} else
		// //yyyyMMdd
		{
			SimpleDateFormat dateFormat1 = new SimpleDateFormat(MEDIATIME_PATTERN2);
			return dateFormat1.format(dtDst);
		}
	}

	/**
	 * 获取指定日期以后（以前）一定天数的日期
	 * 
	 * @param strTime
	 *            字符串形式的日期，格式可以为：（1）yyyyMMdd （2） yyyy-MM-dd
	 * @param count
	 *            要增加（减少）的天数，是负数表示向前的天数
	 * @return String 格式与输入的日期格式相同
	 */
	public static String dateAddDay(String strTime, int count) {
		if (strTime == null) {
//			log.error("DateTimeUtil.dateAddDay()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");
			return null;
		}

		Calendar calendar = Calendar.getInstance();

		Date dtSrc = parseDate(strTime);
		calendar.setTime(dtSrc);

		calendar.add(Calendar.DAY_OF_MONTH, count);
		Date dtDst = calendar.getTime();

		if (strTime.indexOf('-') >= 0) // yyyy-MM-dd
		{
			SimpleDateFormat dateFormat2 = new SimpleDateFormat(MEDIATIME_PATTERN);
			return dateFormat2.format(dtDst);
		} else
		// //yyyyMMdd
		{
			SimpleDateFormat dateFormat1 = new SimpleDateFormat(MEDIATIME_PATTERN2);
			return dateFormat1.format(dtDst);
		}
	}

	/**
	 * 获取指定时间以后（以前）一定小时数的时间
	 * 
	 * @param strTime
	 *            字符串形式的时间，格式可以为：（1）yyyyMMddhhmmss （2） yyyy-MM-dd hh:mm:ss
	 * @param count
	 *            要增加（减少）的小时数，是负数表示向前的小时数
	 * @return String 格式与输入的时间格式相同
	 */
	public static String timeAddHour(String strTime, int count) {
		if (strTime == null) {
//			log.error("DateTimeUtil.timeAddHour()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");
			return null;
		}

		Calendar calendar = Calendar.getInstance();

		Date dtSrc = parseDate(strTime);
		calendar.setTime(dtSrc);

		calendar.add(Calendar.HOUR_OF_DAY, count);
		Date dtDst = calendar.getTime();

		if (strTime.indexOf('-') >= 0) // yyyy-MM-dd hh:mm:ss
		{
			SimpleDateFormat timeFormat2 = new SimpleDateFormat(LONGTIME_PATTERN);
			return timeFormat2.format(dtDst);
		} else
		// //yyyyMMddhhmmss
		{
			SimpleDateFormat timeFormat1 = new SimpleDateFormat(LONGTIME_PATTERN2);
			return timeFormat1.format(dtDst);
		}
	}
	
	
	/**
	 * 获取指定时间以后（以前）一定分钟数的时间
	 * 
	 * @param strTime
	 *            字符串形式的时间，格式可以为：（1）yyyyMMddhhmmss （2） yyyy-MM-dd hh:mm:ss
	 * @param count
	 *            要增加（减少）的分钟数，是负数表示向前的分钟数
	 * @return String 格式与输入的时间格式相同
	 */
	public static String timeAddMinute(String strTime, int count) {
		if (strTime == null) {
//			log.error("DateTimeUtil.timeAddMinute()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");
			return null;
		}
		
		Calendar calendar = Calendar.getInstance();
		
		Date dtSrc = parseDate(strTime);
		calendar.setTime(dtSrc);
		
		calendar.add(Calendar.MINUTE, count);
		Date dtDst = calendar.getTime();
		
		if (strTime.indexOf('-') >= 0) // yyyy-MM-dd hh:mm:ss
		{
			SimpleDateFormat timeFormat2 = new SimpleDateFormat(LONGTIME_PATTERN);
			return timeFormat2.format(dtDst);
		} else
			// //yyyyMMddhhmmss
		{
			SimpleDateFormat timeFormat1 = new SimpleDateFormat(LONGTIME_PATTERN2);
			return timeFormat1.format(dtDst);
		}
	}
	
	
	/**
	 * 获取指定时间以后（以前）一定秒数的时间
	 * 
	 * @param strTime
	 *            字符串形式的时间，格式可以为：（1）yyyyMMddhhmmss （2） yyyy-MM-dd hh:mm:ss
	 * @param count
	 *            要增加（减少）的秒数，是负数表示向前的秒数
	 * @return String 格式与输入的时间格式相同
	 */
	public static String timeAddSecond(String strTime, int count) {
		if (strTime == null) {
//			log.error("DateTimeUtil.timeAddSecond()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");
			return null;
		}
		
		Calendar calendar = Calendar.getInstance();
		
		Date dtSrc = parseDate(strTime);
		calendar.setTime(dtSrc);
		
		calendar.add(Calendar.SECOND, count);
		Date dtDst = calendar.getTime();
		
		if (strTime.indexOf('-') >= 0) // yyyy-MM-dd hh:mm:ss
		{
			SimpleDateFormat timeFormat2 = new SimpleDateFormat(LONGTIME_PATTERN);
			return timeFormat2.format(dtDst);
		} else
			// //yyyyMMddhhmmss
		{
			SimpleDateFormat timeFormat1 = new SimpleDateFormat(LONGTIME_PATTERN2);
			return timeFormat1.format(dtDst);
		}
	}

	/**
	 * 将字符串形式的日期时间格式成显示形式
	 * 
	 * @param strTime
	 *            字符串形式的日期（时间），格式为：
	 *            <p/>
	 *            （1）yyyyMMdd （2）yyyyMMddHHmmss
	 * @return String
	 */
	public static String displayDateTimeCN(String strTime) {
		String retString = strTime;
		try {
			if (strTime == null)
				retString = "";
			else if (strTime.length() == 14)
				retString = strTime.substring(0, 4) + "年"
						+ strTime.substring(4, 6) + "月"
						+ strTime.substring(6, 8) + "日 "
						+ strTime.substring(8, 10) + "时"
						+ strTime.substring(10, 12) + "分"
						+ strTime.substring(12, 14) + "秒";
			else if (strTime.length() == 8)
				retString = strTime.substring(0, 4) + "年"
						+ strTime.substring(4, 6) + "月"
						+ strTime.substring(6, 8) + "日";
			else if (strTime.length() == 6)
				retString = strTime.substring(0, 4) + "年"
						+ strTime.substring(4, 6) + "月";
			else if (strTime.length() <= 4)
				retString = strTime.substring(0, 4) + "年";
		} catch (Exception e) {
//			log.error("DateTimeUtil.displayDateTimeCN()日期时间字符串 [" + strTime + "] 不符合系统格式要求！");
		}
		return retString;
	}
}
