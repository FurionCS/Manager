package com.Manager.Communication;
/**
 * 用于通讯列表展示的控制器
 * @author cs
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Manager.Bean.ContactBean;
import com.Manager.Service.ContactService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class GetContactByPage extends HttpServlet {
	/**
	 * 
	 * 用于接受view 传过来的参数
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String strWhere=request.getParameter("strSearch");
		if(strWhere!=""&&strWhere!=null){
			strWhere=" name like '%"+strWhere+"%' or phone like '%"+strWhere+"%' or workAdress like '%"+strWhere+"%'";
		}
		//System.out.println(strWhere);
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int pageIndex =Integer.parseInt(request.getParameter("pageIndex"));
		//System.out.println(pageSize);
		ArrayList<ContactBean> rs=null;
		ContactService conServic=new ContactService();
		rs=conServic.GetListByPage(strWhere, "ID desc", pageSize, pageIndex);
		response.setCharacterEncoding("UTF-8");
		//System.out.print("@@@@@@@@"+rs.getClass());
		int count=conServic.GetRecordCount(strWhere);
		JSONObject jb =new JSONObject();	 
		jb.put("code", 1);	
		jb.put("count", count);
		jb.put("ContactList", rs);
		
		//System.out.println(jb.get("count"));
		PrintWriter out=response.getWriter();
		out.print(jb);
	}
	/**
	 * 
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
