package com.Manager.Company;

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
import com.Manager.Bean.PublishBean;
import com.Manager.Service.PublishService;

public class AddPublish extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3774407874823966262L;
	/**
	 * 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);	
	}
	/**
	 * 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Title=request.getParameter("Title");
		String PicUrl=request.getParameter("PicUrl");
		String content=request.getParameter("content");
		String TabList=request.getParameter("TabList");
		String Attachment1="";String Attachment2="";String Attachment3="";		
		Attachment1=request.getParameter("Attachment1");
		Attachment2=request.getParameter("Attachment2");
		Attachment3=request.getParameter("Attachment3");
		String[] TabLists=TabList.split(",");
		
		PublishBean pb=new PublishBean();
		pb.setContent(content);
		pb.setPicUrl(PicUrl);
		pb.setTitle(Title);		
		pb.setAttachment1(Attachment1);
		pb.setAttachment2(Attachment2);
		pb.setAttachment3(Attachment3);
		HttpSession session=request.getSession();
		ArrayList<LoginBean> lb=(ArrayList<LoginBean>)session.getAttribute("login");
		int PublishID=lb.get(0).getID();
		pb.setPublisherID(PublishID);
		pb.setTabOne(TabLists[0]);
		if(TabLists.length>1)
		pb.setTabTwo(TabLists[1]);
		if(TabLists.length>2)
		pb.setTabThree(TabLists[2]);
		response.setCharacterEncoding("UTF-8");
		JSONObject jb =new JSONObject();	
		PublishService ps=new PublishService();
		if(ps.AddPublish(pb)>0){
			jb.put("code", 1);		
		}else{
			jb.put("code", 0);
		};
		PrintWriter out=response.getWriter();
		out.print(jb);
		
	}

}
