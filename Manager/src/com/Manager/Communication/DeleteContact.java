package com.Manager.Communication;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.Manager.Service.ContactService;

/**
 * 删除联系人链表
 * @author cs
 * 
 */
public class DeleteContact extends HttpServlet{
	/**
	 * 删除
	 * @param request
	 * @param response
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		 request.setCharacterEncoding("UTF-8");
		 String IDList=request.getParameter("ids");
		 ContactService conServic=new ContactService();
		 int DeleteNum=conServic.DeleteContact(IDList);
		 response.setCharacterEncoding("UTF-8");
		 JSONObject jb =new JSONObject();
		 if(DeleteNum>0){			 
				jb.put("code", 1);	
				jb.put("DeleteNum",DeleteNum );
		 }else{
			 jb.put("code", 1);	
			 jb.put("DeleteNum",0 );
		 }
		 PrintWriter out=response.getWriter();
		 out.print(jb);
		 
	}
	/**
	 * 调用doPost 方法
	 * 
	 * @param request
	 * @param response
	 * 
	 */
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
}
