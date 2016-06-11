package com.Manager.Company;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * 使用SmartUpload组件（上传文件）
 * @author cs
 *
 */
public class SmartUploadForAttachment extends HttpServlet {
	private static final long serialVersionUID = -8022638012492835607L;

	
	/**
	 * 
	 * 调用doPost方法
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
	 * 处理上传
	 * @param request 
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String filePath = getServletContext().getRealPath("/") + "Attachment";
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdir();
		}
		//申明对象
		SmartUpload su = new SmartUpload();
		//对象初始化
		su.initialize(getServletConfig(), request, response);
		//设置单个文件最大大小  1024*1024*10  表示1kb*1kb=1m 这里表示10m
		su.setMaxFileSize(1024*1024*100);
		//设置总共上传文件大小  这里表示100M
		su.setTotalMaxFileSize(1024*1024*1000);
		//设置文件上传的格式（以图片格式作为例子）
		//su.setAllowedFilesList("jpg,gif,png,bmp,jpeg");
		String result = "上传成功";
		String newName="";
		response.setCharacterEncoding("UTF-8");
		JSONObject jb =new JSONObject();	
		try {
			//设置不能上传的文件格式
			su.setDeniedFilesList("rar,jsp,js,css,cs,java");
			//上传
			su.upload();
			//保存到filepath   返回的是成功文件数目
			/*for(int i =0; i < su.getFiles().getCount(); i++){*/
			com.jspsmart.upload.File tempFile = su.getFiles().getFile(0);
			newName = UUID.randomUUID().toString()+"."+tempFile.getFileExt();						
			tempFile.saveAs(filePath+"/"+newName);
			jb.put("code", 1);	
			jb.put("Rurl", "./Attachment/"+newName);
			//System.out.println("我成功了 ");
			//}
		//	int count = su.save(filePath);
		//	System.out.println("成功上传" +  count + "个文件"+filePath);
		} catch (Exception e) {
			result = "上传失败";
			
			if(e.getMessage().indexOf("1015")!=-1){
				result="上传失败：上传文件类型不正确";
			}else if(e.getMessage().indexOf("1010")!=-1){
				result="上传失败：上传文件类型不正确";
			}else if(e.getMessage().indexOf("1105")!=-1){
				result="上传失败：大小超过单个文件允许的最大值";
			}else if(e.getMessage().indexOf("1110")!=-1){
				result="上传失败：上传文件总大小超过所有文件的总大小允许的最大值";
			}
			jb.put("code", 0);	
			jb.put("result",result);
			System.out.println("我失败了");
			e.printStackTrace();
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
	/*	for(int i =0; i < su.getFiles().getCount(); i++){
			com.jspsmart.upload.File tempFile = su.getFiles().getFile(i);
			System.out.println("---------------------------");
			System.out.println("表单中name的值" + tempFile.getFieldName());
			System.out.println("上传文件名" + tempFile.getFieldName());
			System.out.println("上传文件的大小:" + tempFile.getSize());
			System.out.println("上传文件的拓展名" + tempFile.getFileExt());
			System.out.println("上传文件的全名" + tempFile.getFilePathName());
		
			System.out.println("---------------------------");
		}*/
		 
		
	}

}
