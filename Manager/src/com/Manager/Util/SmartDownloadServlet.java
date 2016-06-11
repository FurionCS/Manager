package com.Manager.Util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class SmartDownloadServlet extends HttpServlet {
	/**
	 * 
	 * 调用doPost
	 * @param request 
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * 
	 * 处理下载
	 * @param request 
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String filename=request.getParameter("filename");	
		filename=new String(filename.getBytes("iso-8859-1"),"UTF-8");
		System.out.println(filename);
		SmartUpload su=new SmartUpload();
		su.initialize(getServletConfig(), request, response);
		su.setContentDisposition(null);//设置下载方式  null就是不使用默认下载方式
		try {
			su.downloadFile("/DownLoadFile/"+filename);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	
		
	}
	

}






