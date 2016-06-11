package com.Manager.Communication;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.Manager.Bean.ContactBean;
import com.Manager.Service.ContactService;

public class UpdateContact extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws  ServletException,IOException{
	
		 request.setCharacterEncoding("UTF-8");
		 	int ID=Integer.parseInt(request.getParameter("ID"));
			String Name=request.getParameter("user");
			String phone=request.getParameter("phone");
			String sex=request.getParameter("sex");
			String email=request.getParameter("email");
			Date Birthday =Date.valueOf(request.getParameter("Birthday"));
			String QQ=request.getParameter("QQ");
			String workAddress=request.getParameter("workAdress");
			String HomeAddress=request.getParameter("HomeAdress");
			int Code=Integer.parseInt(request.getParameter("Code"));		
			ContactBean contact=new ContactBean();
			contact.setID(ID);
			contact.setName(Name);
			contact.setPhone(phone);
			contact.setSex(sex);
			contact.setEmail(email);
			contact.setBirthday(Birthday);
			contact.setQQ(QQ);
			contact.setWorkAddress(workAddress);
			contact.setHomeAddress(HomeAddress);
			contact.setCode(Code);
			ContactService conServic=new ContactService();
			 JSONObject jb =new JSONObject();
			if(conServic.UpdateContact(contact)){			 
				jb.put("code", 1);		
			}
			else{
				jb.put("code", 0);	
			}
			
			 PrintWriter out=response.getWriter();
			 out.print(jb);
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws  ServletException,IOException{
		doPost(request,response);
	}

}
