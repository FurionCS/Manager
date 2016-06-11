package com.Manager.Communication;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;





import com.Manager.Bean.LoginBean;
import com.Manager.Service.LoginService;



public class GetAdminList extends HttpServlet{
		/**
		 * 
		 * 
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 * 
		 * 
		 */
		public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
			String strWhere=request.getParameter("strWhere");
			int pageSize=Integer.parseInt(request.getParameter("pageSize"));
			int pageIndex =Integer.parseInt(request.getParameter("pageIndex"));
			//System.out.println(pageSize);
			ArrayList<LoginBean> rs=null;
			LoginService ls=new LoginService();
			rs=ls.GetListByPage("1=1","ID desc", pageSize, pageIndex);
			response.setCharacterEncoding("UTF-8");
			//System.out.print("@@@@@@@@"+rs.getClass());
			int count=ls.GetRecordCount(strWhere);
			JSONObject jb =new JSONObject();	 
			jb.put("code", 1);	
			jb.put("count", count);
			jb.put("LoginList", rs);
			System.out.println("联系人："+count);
			PrintWriter out=response.getWriter();
			out.print(jb);
		}
		/**
		 * 
		 * 交给doPost(request,response)处理
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 * 
		 * 
		 */
		public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
			doPost(request,response);
		}
}
