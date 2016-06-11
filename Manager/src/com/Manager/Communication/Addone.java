package com.Manager.Communication;
/**
 * 用于通讯录添加联系人的控制器
 * @author cs
 */
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Manager.Bean.ContactBean;
import com.Manager.Service.ContactService;
public class Addone extends HttpServlet{
	/**
	 * 处理view 传过来的参数，存入数据库
	 * @param request
	 * @param response
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		 request.setCharacterEncoding("UTF-8");
		String Name=request.getParameter("Name");
		String phone=request.getParameter("phone");
		String sex=request.getParameter("sex");
		String email=request.getParameter("email");
		Date Birthday =Date.valueOf(request.getParameter("Birthday"));
		String QQ=request.getParameter("QQ");
		String workAddress=request.getParameter("workAdress");
		String HomeAddress=request.getParameter("HomeAdress");
		int Code=Integer.parseInt(request.getParameter("Code"));		
		ContactBean contact=new ContactBean();
		contact.setName(Name);
		contact.setPhone(phone);
		contact.setSex(sex);
		contact.setEmail(email);
		contact.setBirthday(Birthday);
		contact.setQQ(QQ);
		contact.setWorkAddress(workAddress);
		contact.setHomeAddress(HomeAddress);
		contact.setCode(Code);
		ContactService conServic=new ContactService();
		if(conServic.AddContact(contact)){
			response.sendRedirect("../CommunicationView/ContactList.jsp?active=menupage6_6");
		}
		else{
			System.out.print("纳尼出错了哦哦！！！");
			response.sendRedirect("../CommunicationView/Addone.jsp?active=menupage6_5");
		}
		
	}
	/**
	 * 
	 * 处理view Get传过来的参数  交给doPost处理
	 * @param request
	 * @param response
	 * 
	 */
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
}
