package com.Manager.Individual;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Manager.Bean.Calendar;
import com.Manager.Bean.LoginBean;
import com.Manager.Service.CalendarService;
import com.Manager.Util.DateTimeUtil;




public class InsertUpdateDelCal extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		String title=request.getParameter("title");
		if(title!=null){
		 title= new String(title.getBytes("iso-8859-1"),"utf-8");
		}
		//System.out.println("Title:"+title);
		String allDay= request.getParameter("allDay");
		//status=0 为新增 1为修改title 2为修改时间段 3为删除  
		String status= request.getParameter("status");
		int ID=0;
		if(request.getParameter("id")!=null){
		ID=Integer.parseInt(request.getParameter("id"));
		}
		String dayDelta= request.getParameter("dayDelta");
		String minuteDelta= request.getParameter("minuteDelta");
		/**获取用户id**/		
		HttpSession session =request.getSession();
		ArrayList<LoginBean> lb=(ArrayList<LoginBean>)session.getAttribute("login");
		int UserID=lb.get(0).getID();
		Calendar cd=new Calendar();
		/**allDay是否为全天事件的处理**/
		if(null==allDay){
			
		}else if(allDay.equals("true")){
			cd.setAllDay(true);
		}else{
			cd.setAllDay(false);
		}	
		cd.setID(ID);
		cd.setUserId(UserID);
		cd.setTitle(title);	
		cd.setStart(start);	
		cd.setEnd(end);
		cd.setStatus(status);
		
		CalendarService cs=new CalendarService();
		//status=0 为新增 1为修改title 2为修改时间段 3为删除  
		if(status.equals("0")){//新增
			cs.AddCalendar(cd);
		}else if(status.equals("1")){//修改Title
			//System.out.println("我是修改Title哦！！！！！");
			cs.updateTitleCalendar(cd);
		}else if(status.equals("2")){//修改时间段
			//System.out.println("我是修改时间哦！！！！！");
			cs.updateTimeCalendar(ID,dayDelta,minuteDelta);
		}else if(status.equals("3")){//删除
			System.out.println("我是删除！！！！！");
			cs.DeleteCalendar(ID);
		}else if(status.equals("4")){
			System.out.println("我是删除！！！！！");
			cs.updateTimeCalendar(ID,dayDelta,minuteDelta);
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}

}
