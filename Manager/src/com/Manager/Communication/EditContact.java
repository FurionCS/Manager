package com.Manager.Communication;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Manager.Bean.ContactBean;
import com.Manager.Service.ContactService;
/**
 * 用于编辑联系人的控制器
 * @author cs
 *
 */
public class EditContact extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5646469347577287460L;
	/**
	 * 用来处理通过Post的请求，这里用来返回一个session("EditContact",EditContact)
	 * @param request
	 * @param response
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		 request.setCharacterEncoding("UTF-8");
		 int ID=Integer.parseInt(request.getParameter("ID"));	 
		 ContactService CS=new ContactService();
		 ArrayList<ContactBean> contact=CS.SelectContact("ID="+ID, "");
		 HttpSession session=request.getSession();	 
		 session.setAttribute("Contact",contact.get(0));	
		 response.sendRedirect("../CommunicationView/EditContact.jsp?active=menupage6_6");
	}
	/**
	 * 转交给doPost处理
	 * @param request
	 * @param response 
	 * 
	 */
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		doPost(request,response);
	}
}