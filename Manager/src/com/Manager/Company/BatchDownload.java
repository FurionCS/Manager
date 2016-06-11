package com.Manager.Company;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BatchDownload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8174763506867991561L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-Disposition", "attachment;filename=Attachment.zip");
		String path = getServletContext().getRealPath("/") + "Attachment/";
		String attachment1=request.getParameter("attachUrl");
		String attachment2=request.getParameter("attachUrl2");
		String attachment3=request.getParameter("attachUrl3");
		ArrayList<String> filenames=new ArrayList<String>();
		if(attachment1!=null&&attachment1!=""){
			attachment1=attachment1.split("\\/")[2];
			filenames.add(attachment1);
		}
		if(attachment2!=null&&attachment2!=""){
			attachment2=attachment2.split("\\/")[2];
			filenames.add(attachment2);
		}
		if(attachment3!=null&&attachment3!=""){
			attachment3=attachment3.split("\\/")[2];
			filenames.add(attachment3);
		}
		String str = "";
		String rt = "\r\n";
		ZipOutputStream zos = new ZipOutputStream(response.getOutputStream());
		for(String filename : filenames){
			str += filename + rt;
			File file = new File(path + filename);
			zos.putNextEntry(new ZipEntry(filename));
			FileInputStream fis = new FileInputStream(file);
			byte b[] = new byte[1024];
			int n = 0;
			while((n = fis.read(b)) != -1){
				zos.write(b, 0, n);
			}
			zos.flush();
			fis.close();
		}
		zos.setComment("download success:" + rt + str);
		zos.flush();
		zos.close();
	
	}

}
