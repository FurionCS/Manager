package com.Manager.Home;

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
import com.Manager.Service.ContactService;
import com.Manager.Service.MessageService;

public class GetNumList extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		int msCount=0;
		int csCount=0;
		HttpSession session=request.getSession();
		ArrayList<LoginBean> lb=(ArrayList<LoginBean>)session.getAttribute("login");
		int userID=lb.get(0).getID();
		MessageService ms =new MessageService();	
		ContactService cs=new ContactService();
		msCount=ms.GetRecordCount(" receiverid="+userID+" and receiverstatu=0");
		csCount=cs.GetRecordCount("");
		JSONObject jb =new JSONObject();
		jb.put("code", 1);
		jb.put("msCount", msCount);
		jb.put("csCount", csCount);
		PrintWriter out=response.getWriter();
		out.print(jb);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doPost(request,response);
	}
}
