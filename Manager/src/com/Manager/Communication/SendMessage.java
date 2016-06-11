package com.Manager.Communication;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;






import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.Manager.Bean.LoginBean;
import com.Manager.Bean.ShortMessageBean;
import com.Manager.Service.MessageService;

public class SendMessage extends HttpServlet{
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws  ServletException,IOException{
		String ReceiverIDList=request.getParameter("ReceiverIDList");
		String ReceiverNameList=request.getParameter("ReceiverNameList");
		String content=request.getParameter("content");

		HttpSession session=request.getSession();
		ArrayList<LoginBean> lb=(ArrayList<LoginBean>)session.getAttribute("login");
		String userName=lb.get(0).getUserName();
		String[] idList=ReceiverIDList.split(",");
		String[] nameList=ReceiverNameList.split(",");
		response.setCharacterEncoding("UTF-8");
		JSONObject jb =new JSONObject();
		for(int i=0;i<idList.length;i++){
			ShortMessageBean smb=new ShortMessageBean();
			smb.setSendName(userName);
			smb.setReceiverID(Integer.parseInt(idList[i]));
			smb.setSendID(lb.get(0).getID());
			smb.setReceiverName(nameList[i]);
			smb.setContent(content);
		/*	java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());*/
		//	smb.setSendTime( new java.sql.Timestamp(new Date().getTime()));//这里可能有问题？？？
			smb.setSendStatu("1");
			smb.setReceiverStatu("0");
			
			MessageService ms=new MessageService();
			if(ms.addShortMessage(smb)){
				continue;
			}else{
				jb.put("code", 0);
				jb.put("num", i);
				break;
			}
	
		}
		if(jb.get("code")==null){
			jb.put("code", 1);
			jb.put("num", idList.length);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws  ServletException,IOException{		
		doPost(request,response);
	}

}
