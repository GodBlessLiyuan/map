package com.talentmap.common.utils;


import org.apache.commons.lang.time.DateUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/20 15:39
 * @description
 */
public class DateUtil {
    public static final SimpleDateFormat YMD = new SimpleDateFormat("yyyy-MM-dd");
    public static final SimpleDateFormat HM = new SimpleDateFormat("HH:mm");

    public static final SimpleDateFormat YMD2 = new SimpleDateFormat("yyyy.MM.dd");
    public static final SimpleDateFormat YM = new SimpleDateFormat("yyyy.MM");
    public static final SimpleDateFormat YY = new SimpleDateFormat("yyyy");

    private static String[] parsePatterns = {/*"yyyy-MM-dd","yyyy年MM月dd日",*/
            /*"yyyy-MM-dd", "yyyy/MM/dd", "yyyy年MM月","yyyy-MM",*/"yyyy","yyyy.MM","yyyy.MM.dd",
            /*"yyyy/MM/dd", "yyyyMMdd"*/};

    /**
     * str 转 date
     *
     * @param str
     * @return
     */
    public static Date str2Date(String str) throws ParseException {
        return str2Date(str, YMD);
    }

    /**
     * str 转 date
     *
     * @param str
     * @param sdf
     * @return
     */
    public static Date str2Date(String str, SimpleDateFormat sdf) throws ParseException {
        if (null == str || "".equals(str)) {
            return null;
        }
        str = str.trim();
        if(str.length()<3){
            throw new ParseException("日期格式错误，长度小于3",0);
        }
        int len=str.length();
        if(len==4 || len==7 || len==10){
            if(len==4) {
                YY.setLenient(false);
                return YY.parse(str);
            }
            if(len==7) {
                YM.setLenient(false);
                return  YM.parse(str);
            }
            if(len==10){
                YMD2.setLenient(false);
                return YMD2.parse(str);
            }
            else{
                throw  new ParseException("日期格式错误不符合",0);
            }
        }else{
            throw  new ParseException("日期格式错误不符合",0);
        }

    }

    /**
     * date 转 str
     *
     * @param date
     * @param sdf
     * @return
     */
    public static String date2Str(Date date, SimpleDateFormat sdf) {
        if (null == date) {
            return "";
        }

        return sdf.format(date);
    }

    /**
     * 当前时间是否在对应的时间段内
     *
     * @param date
     * @param start
     * @param end
     * @return
     */
    public static boolean isEffectiveDate(Date date, String start, String end, SimpleDateFormat sdf) {
        Calendar nowCal = Calendar.getInstance();
        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        try {
            nowCal.setTime(sdf.parse(sdf.format(date)));
            startCal.setTime(sdf.parse(start));
            endCal.setTime(sdf.parse(end));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return !nowCal.before(startCal) && !nowCal.after(endCal);
    }

    /**
     * @param nowDate
     * @param startTime
     * @param endTime
     * @param ymd
     * @return
     */
    public static boolean isEffectiveDate(Date nowDate, Date startTime, Date endTime, SimpleDateFormat ymd) {
        return isEffectiveDate(nowDate, ymd.format(startTime), ymd.format(endTime), ymd);
    }

    /**
     * 计算相差天数
     *
     * @param start
     * @param end
     * @return
     */
    public static long getDifferenceDay(Date start, Date end) {
        if (end.getTime() < start.getTime()) {
            return 0;
        }

        try {
            start = YMD.parse(YMD.format(start));
            end = YMD.parse(YMD.format(end));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return (end.getTime() - start.getTime()) / (24 * 60 * 60 * 1000) + 1;
    }

    /**
     * 获取前一日
     */
    public static String getYesterday() {
        //今天
        Date today = new Date();
        //获取日历
        Calendar calendar = Calendar.getInstance();
        //把当前时间赋给日历
        calendar.setTime(today);
        //设置为前一天
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        //得到前一天的时间
        Date yesterday = calendar.getTime();
        //格式化
        return YMD.format(yesterday);
    }


    /**
     * String转date，设置为当天最后一刻后，再转回String
     */
    public static String str2str2(String strDate) {
        if (null == strDate || "".equals(strDate)) {
            return null;
        } else {
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return format.format(str2date2(strDate));
        }
    }


    /**
     * String转date，并设置为当天最后一刻
     */
    public static Date str2date2(String strDate) {

        if (null == strDate || strDate.length() < 1) {
            return null;
        }

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;

        try {
            date = format.parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        date = calendar.getTime();

        return date;
    }
}
