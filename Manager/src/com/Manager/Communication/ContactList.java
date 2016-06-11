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


public class ContactList extends HttpServlet {
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
		/*ArrayList<ContactBean> rs=null;
		ContactService conServic=new ContactService();
		rs=conServic.SelectContact("", "");
		HttpSession session=request.getSession();
		session.setAttribute("ContactList", rs);*/		
		response.sendRedirect("../CommunicationView/ContactList.jsp?active=menupage6_6");		
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
