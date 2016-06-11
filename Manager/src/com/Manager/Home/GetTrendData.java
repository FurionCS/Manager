package com.Manager.Home;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;




import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.Manager.Util.TrendData;

public class GetTrendData extends HttpServlet{
	/**
	 * 获得每个时间点的记录数，通过调用com.Manager.util 中的TrendData
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @author cs
	 * @return json jb
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		int num=Integer.parseInt(request.getParameter("num"));
		String unit=request.getParameter("unit");
		//System.out.println("我获得记录要求："+unit);
		ArrayList<long[]> ALSM=new ArrayList<long[]>();
		ArrayList<long[]> ALSM2=new ArrayList<long[]>();
        TrendData td=new TrendData();
        JSONObject jb =new JSONObject();	
        try
        {
            for (int i = (num - 1); i > -1; i--)
            {
                Date time = new Date();
               System.out.println("我获得当前时间："+time);
                int n = 0 - i;
                if (unit.equals("day")) { 
                	Calendar cal = Calendar.getInstance();  
                	cal.setTime(time);  
                	cal.add(Calendar.DATE, n);  
                	time=cal.getTime();  
             //   	 System.out.println("我获得当前时间day："+time);
                }
                else if (unit.equals("month")) { 
                	Calendar cal = Calendar.getInstance();  
                    cal.setTime(time);  
                    cal.add(Calendar.MONTH, n);  
                    time=cal.getTime();  
            //        System.out.println("我获得当前时间month："+time);
                  }
                else if (unit.equals("hour")) { 
                	Calendar cal = Calendar.getInstance();  
                    cal.setTime(time);  
                    cal.add(Calendar.HOUR, n);  
                    time=cal.getTime();  
                    //System.out.println("我获得当前时间hour："+time);
                   // System.out.println("我获得当前时间秒："+DateToInt(time));
                    
                    }
                else if (unit.equals("year")) { 
                	Calendar cal = Calendar.getInstance();  
                    cal.setTime(time);  
                    cal.add(Calendar.YEAR, n);  
                    time=cal.getTime();  
              //      System.out.println("我获得当前时间year："+time);
                }
                ALSM.add(new long[] { DateToInt(time) + (8 * 60 * 60 * 1000), td.GetRecordCountByUnit("shortMessage", "sendtime", time, unit) });
                ALSM2.add(new long[] { DateToInt(time) + (8 * 60 * 60 * 1000), td.GetRecordCountByUnit("shortMessage", "sendtime", time, unit) });
            }
            jb.put("code",1);
            jb.put("ALSM", ALSM);
            jb.put("ALSM2", ALSM2);
            System.out.println("TSETE:"+jb.get("ALSM"));
        }
        catch (Exception err){
            jb.put("code", "0");
        }
        PrintWriter out=response.getWriter();
		out.print(jb);
	}
	/**
	 * 时间转化,求得和计算机元年的时间差
	 * @param time
	 * @return long
	 * 
	 */
	public long DateToInt(Date time)
    {
		Calendar start=Calendar.getInstance();
		start.set(1970, 1, 1,8,0,0);//8是东八区
		Calendar endTime=Calendar.getInstance();
		endTime.setTime(time);
        return (long)(endTime.getTimeInMillis()-start.getTimeInMillis());
    }
	/**
	 * 转给doPost处理
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doPost(request,response);
	}

}
