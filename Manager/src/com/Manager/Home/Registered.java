package com.Manager.Home;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Manager.Bean.LoginBean;
import com.Manager.Service.LoginService;
import com.Manager.Util.*;
/**
 * 本类是用于用户注册的类
 * 
 * @author cs
 *
 */
public class Registered extends HttpServlet{
	/**
	 * 
	 * 用于处理view 传过来的注册请求
	 * @param request   
	 * @param response
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		  //获得数据
	    request.setCharacterEncoding("UTF-8");
	    String Name=(String)request.getParameter("playerID");
	    String Password=(String)request.getParameter("password");
	    String email=(String)request.getParameter("email");
	    String phone=(String)request.getParameter("phone");    

	    LoginBean loginer=new LoginBean();
	    loginer.setUserName(Name);
	    loginer.setPassword(Password);
	    loginer.setEmail(email);
	    loginer.setPhone(phone);	    
	   if(new LoginService().AddAdmin(loginer)){
		 
		   response.sendRedirect("../index.jsp");
	   }else{
		   response.sendRedirect("../Registered.jsp");
	   }	    
	}
	/**
	 * 
	 * 本类是用于处理view 通过get  请求的类
	 * @param request
	 * @param response
	 * 
	 */
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
}
