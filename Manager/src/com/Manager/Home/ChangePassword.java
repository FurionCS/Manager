package com.Manager.Home;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.Manager.Bean.LoginBean;
import com.Manager.Service.LoginService;

public class ChangePassword extends HttpServlet{
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String OldPassword=request.getParameter("OldPassword");
		String NewPassword=request.getParameter("NewPassword");
		String setStr="password='"+NewPassword+"'";
		
		HttpSession session=request.getSession();
		ArrayList<LoginBean> lb=(ArrayList<LoginBean>)session.getAttribute("login");
		String userName=lb.get(0).getUserName();
		String whereStr=" Name='"+userName+"'";
		LoginBean LB=new LoginBean();
		LB.setUserName(userName);
		LB.setPassword(OldPassword);
		LoginService LS=new LoginService();
		response.setCharacterEncoding("UTF-8");
		JSONObject jb =new JSONObject();
		try {
			ArrayList<LoginBean> LBlist=LS.checkLogin(LB);
			if(LBlist!=null&&LBlist.size()>0){
				if(LS.UpdateLogin(setStr,whereStr)>0){
					jb.put("code", 1);
					jb.put("msg", "成功修改");
				}
				else{
					jb.put("code",0);
					jb.put("msg", "修改失败");
				}
			}else{		
				jb.put("code",2);	
				jb.put("msg", "您输入的密码错误");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out=response.getWriter();
		out.print(jb);	
	}
	/**
	 * 调用doPost
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
