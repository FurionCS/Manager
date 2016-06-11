package com.Manager.Util;

import java.util.Date;
import java.util.Properties;

import javax.mail.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.mail.internet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class Mail extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response){
		String qm=request.getParameter("password");
		//String qm ="cs950211@"; //您的QQ密码
		String SendEmail=request.getParameter("email");
		String[] maillist =SendEmail.split("@"); ; //你邮箱的后缀域名
		String tu=maillist[maillist.length-1];
		String tto=request.getParameter("GetEmail");
		//String tto="3339408831@qq.com"; //接收邮件的邮箱
		String ttitle=request.getParameter("thome");
		//String ttitle="好空间网络数据库密码修改成功通知信!操作人ip:";
		String tcontent=request.getParameter("content");
		//String tcontent="您的会员:zcdnsz 里的 haokongjian 的mysql 数据库,密码已经被修改为:123456 请切记! 操作人ip:127.0.0.1 ,如不是您本人操作说明您的密码已经泄漏,请立即和我们联系! ! ";
		JSONObject jb =new JSONObject();
		//给消息对象设置发件人/收件人/主题/发信时间
		response.setCharacterEncoding("UTF-8");
		try {
			Properties props=new Properties();
			props.put("mail.smtp.host","smtp."+tu);//发信的主机，这里我填写的是我们公司的主机！可以不用修改！
			props.put("mail.smtp.auth","true");
			Session s=Session.getInstance(props);
			s.setDebug(true);
			MimeMessage message=new MimeMessage(s);
			InternetAddress from=new InternetAddress(SendEmail); //这里的115798090 改为您发信的QQ号
			message.setFrom(from);	
			InternetAddress to=new InternetAddress(tto);
			message.setRecipient(Message.RecipientType.TO,to);
			message.setSubject(ttitle);
			message.setSentDate(new Date());
			//给消息对象设置内容
			BodyPart mdp=new MimeBodyPart();//新建一个存放信件内容的BodyPart对象
			mdp.setContent(tcontent,"text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式
			Multipart mm=new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对
			//象(事实上可以存放多个)
			mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
			message.setContent(mm);//把mm作为消息对象的内容
			message.saveChanges();
			Transport transport=s.getTransport("smtp");
			transport.connect("smtp."+tu,maillist[0],qm); //这里的115798090也要修改为您的QQ号码
			transport.sendMessage(message,message.getAllRecipients());
			transport.close();
				 
			jb.put("code", 1);	
			//System.out.println(jb.get("count"));
			PrintWriter out = response.getWriter();	
			out.print(jb);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			jb.put("code", 0);	
			jb.put("result", "请确认您的发件邮箱是否开启了POP3/SMTP服务或者密码是否正确");		
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}	
			out.print(jb);
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			jb.put("code", 0);	
			jb.put("result", "请确认您的发件邮箱是否开启了POP3/SMTP服务或者密码是否正确");		
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}	
			out.print(jb);
			e.printStackTrace();
		}
		
		
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		doPost(request,response);
	}
	
}