package com.Manager.Home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 用户注销方法
 * @author Administrator
 *
 */
public class LoginOut extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3644772244768413009L;
	/**
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		HttpSession session=request.getSession();
		if(session.getAttribute("login")!=null){
			session.invalidate();
			response.sendRedirect("../index.jsp");
		}
		else{
			session.invalidate();
			response.sendRedirect("../index.jsp");
		}
	}
	/**
	 * 
	 */
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
}
