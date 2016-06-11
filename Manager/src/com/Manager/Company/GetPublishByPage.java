package com.Manager.Company;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Manager.Bean.PublishBean;
import com.Manager.Service.PublishService;

import net.sf.json.JSONObject;



/**
 * 
 * @author cs
 *
 */
public class GetPublishByPage extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 876751746238132405L;
	/**
	 * 
	 * 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);	
	}
	/**
	 * 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//System.out.println(strWhere);
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int pageIndex =Integer.parseInt(request.getParameter("pageIndex"));
		//System.out.println(pageSize);
		ArrayList<PublishBean> rs=null;
		PublishService ps=new PublishService();
		rs=ps.GetPublishListByPage("1=1", "PublishTime desc", pageSize, pageIndex);
		response.setCharacterEncoding("UTF-8");
		//System.out.print("@@@@@@@@"+rs.getClass());
		int count=ps.GetRecordCount("1=1");
		JSONObject jb =new JSONObject();	 
		jb.put("code", 1);	
		jb.put("count", count);
		jb.put("PublishList", rs);
		//System.out.println(rs.get(0).getPicUrl());
		
		//System.out.println(jb.get("count"));
		PrintWriter out=response.getWriter();
		out.print(jb);
		
	}
}
