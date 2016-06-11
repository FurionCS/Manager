package com.Manager.Communication;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.Manager.Service.MessageService;

/**
 * 
 * 用于将消息修改为已读
 * @author cs
 *
 */
public class markerMessage extends HttpServlet{
	/**
	 * 
	 * 处理短消息状态
	 * 通过调用MessageService 中的markMessageByID(idList)  返回count
	 * 返回前台json   (code:0/1,count)
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String idList=request.getParameter("ids");	
		MessageService ms=new MessageService();
		int count=ms.markerMessageByID(idList);
		response.setCharacterEncoding("UTF-8");
		JSONObject jb =new JSONObject();
		if(count<1){
			jb.put("code", 0);
		}
		else {
			jb.put("code", 1);		
			jb.put("count", count);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
	}
	/**
	 * 交给doPost处理
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
