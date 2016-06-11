package com.Manager.Individual;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.Manager.Bean.Calendar;
import com.Manager.Bean.LoginBean;
import com.Manager.Service.CalendarService;
/**
 * 获得日程安排
 * @author cs
 *
 */
public class Arrangement extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 调用CalendarServic 中的GetCalendarList(String str) 
	 * 获得ArrayList
	 * 返回前台jsonarray
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
		@SuppressWarnings("null")
		public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			HttpSession session =request.getSession();
			ArrayList<LoginBean> lb=(ArrayList<LoginBean>)session.getAttribute("login");
			int ID=lb.get(0).getID();
			/**获取用户id**/		
			JSONObject jo=null;
			JSONArray ja=null;
			CalendarService cs=new CalendarService();
			ja=new JSONArray();		
			response.setCharacterEncoding("UTF-8");
			ArrayList<Calendar> alcd=cs.GetCalendarList("UserID="+ID+"and Status='1'");	
			if(alcd.size()>=0){
				for(int i=0;i<alcd.size();i++){
					jo=JSONObject.fromObject(alcd.get(i));
					ja.add(jo);
				} 
			}
			//System.out.println(ja);
			response.getWriter().print(ja.toString());
		}
		/**
		 * 转交给doPost 处理
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 * 
		 */
		public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			doPost(request,response);
		}

}
