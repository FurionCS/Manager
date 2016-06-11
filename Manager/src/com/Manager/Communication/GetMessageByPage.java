package com.Manager.Communication;
/**
 * 用于短消息展示的控制器
 * @author cs
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Manager.Bean.LoginBean;
import com.Manager.Bean.ShortMessageBean;
import com.Manager.Service.MessageService;

import net.sf.json.JSONObject;


public class GetMessageByPage extends HttpServlet {
	/**
	 * 
	 * 用于接受view 传过来的参数
	 * 方法：
	 * 调用 MessageService 中的 GetListByPage(strWhere,orderby,pageSize,pageIndex )获得消息列表
	 * 调用MessageService 中的 GetRecordCount(strWhere);获得列表数目
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String strWhere=request.getParameter("strSearch");
		int type=Integer.parseInt(request.getParameter("type"));
		//System.out.println("我是类型："+type);
		HttpSession session=request.getSession();
		ArrayList<LoginBean> lb=(ArrayList<LoginBean>)session.getAttribute("login");
		String userName=lb.get(0).getUserName();	
		if(strWhere!=""&&strWhere!=null&&type==1){
			strWhere="receiverName='"+userName+"' and (sendName like '%"+strWhere+"%' or sendTime like '%"+strWhere+"%' or content like '%"+strWhere+"%')";
		}
		else if(type==1){strWhere="receiverName='"+userName+"'";}
		else {strWhere="sendName='"+userName+"'";}
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int pageIndex =Integer.parseInt(request.getParameter("pageIndex"));
		//System.out.println(pageSize);
		ArrayList<ShortMessageBean> rs=null;
		MessageService MsService=new MessageService();
		//System.out.println("look:"+strWhere);
		rs=MsService.GetListByPage(strWhere, "sendTime desc", pageSize, pageIndex);
		response.setCharacterEncoding("UTF-8");
		//System.out.print("@@@@@@@@"+rs.getClass());
		int count=MsService.GetRecordCount(strWhere);
		//System.out.println("共："+count);
		JSONObject jb =new JSONObject();	
		if(count<1){
			jb.put("code", 0);
		}
		else {
			jb.put("code", 1);		
			jb.put("count", count);
			jb.put("MessageList", rs);
		}
		
		//System.out.println(jb.get("MessageList"));
		PrintWriter out=response.getWriter();
		out.print(jb);
	}
	/**
	 * 
	 * 交给doPost(request,response)处理
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
