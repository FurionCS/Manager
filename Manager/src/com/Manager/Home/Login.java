package com.Manager.Home;
/**
 * 本类是用户登入的控制器(servlet)
 * @author cs
 * 
 * 
 * 
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Manager.Bean.LoginBean;
import com.Manager.Service.LoginService;
import com.Manager.Util.DateTimeUtil;
import com.Manager.Util.UtilJDBC;

public class Login extends HttpServlet{
	/**
	 * 
	 * 用于处理view 传过来的登入请求
	 * @param request   
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
	//	System.out.println("########################s");
		request.setCharacterEncoding("utf-8");
		String Validate=request.getParameter("Validate");
		//获取session 对象
		HttpSession session=request.getSession();
		if(!Validate.toLowerCase().equals(((String)session.getAttribute("Validate")).toLowerCase())){
			session.setAttribute("ValidateError", "验证码错误");
			response.sendRedirect("../Index.jsp");
			return;
		}else{
			session.removeAttribute("ValidateError");
		}
		String name=request.getParameter("playerID");
		String Pass=request.getParameter("password");
		LoginBean Loginer=new LoginBean();
		Loginer.setUserName(name);
		Loginer.setPassword(Pass);
		ArrayList<LoginBean> login= null;
		try {
			login = new LoginService().checkLogin(Loginer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		if(login!=null&&login.size()>0){
			LoginService ls=new LoginService();
			//System.out.println("当前时间："+DateTimeUtil.getFullTime());
			ls.UpdateLogin("LastTime= to_date('"+DateTimeUtil.getFullTime()+"','yyyy-mm-dd hh24:mi:ss')", " ID="+login.get(0).getID());
			session.setAttribute("login", login);
			//session.setMaxInactiveInterval(100);设置session生命周期
			response.sendRedirect("../Weclome.jsp");
		}
		else{
			response.sendRedirect("../Index.jsp");
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
