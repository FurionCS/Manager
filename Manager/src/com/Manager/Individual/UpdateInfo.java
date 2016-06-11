package com.Manager.Individual;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.Manager.Bean.LoginBean;
import com.Manager.Service.LoginService;
/**
 * 
 * @author cs
 *
 */
public class UpdateInfo extends HttpServlet{
	/**
	 * 
	 * @param request
	 * @param response
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		int ID=Integer.parseInt(request.getParameter("ID"));
		String Name=request.getParameter("Name");
		String Email=request.getParameter("Email");
		String AboutMe=request.getParameter("AboutMe");
		String Dept=request.getParameter("Dept");
		String Job=request.getParameter("Job");
		String Phone=request.getParameter("Phone");
		/*调用UpdateLogin方法*/
		LoginService ls=new LoginService();
		String newstr="Name='"+Name+"',Email='"+Email+"',AboutMe='"+AboutMe+"',Phone='"+Phone+"',Dept='"+Dept+"',Job='"+Job+"'";
		String whereStr=" ID="+ID;
		response.setCharacterEncoding("UTF-8");
		JSONObject jb =new JSONObject();
		if(ls.UpdateLogin(newstr, whereStr)>0){
			HttpSession session=request.getSession();
			ArrayList<LoginBean> allb=(ArrayList<LoginBean>)session.getAttribute("login");
			allb.get(0).setUserName(Name);
			allb.get(0).setEmail(Email);
			allb.get(0).setDept(Dept);
			allb.get(0).setJob(Job);
			allb.get(0).setPhone(Phone);
			allb.get(0).setAboutMe(AboutMe);
			session.setAttribute("login", allb);
			jb.put("code", 1);
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
	}
	/**
	 * 转交给doPost处理
	 * @param request
	 * @param response
	 * 
	 */
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}

}
