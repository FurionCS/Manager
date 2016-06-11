package com.Manager.Util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadServlet extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//����һ��DiskFileItemFactory����(�������󣺸��𴴽��ļ��������ļ�) ֪ʶ�����죺���ģʽ�еĹ���ģʽ
		FileItemFactory factory =  new DiskFileItemFactory();
		//ͨ��ServletFileUpload��������������ִ�н��������еı?���ݶ�������һ��List�С�
		//���������ԭ�������ϴ�����ݴ����������ͣ��ַ����ͺ��ļ����ͣ�Ҫ����ͳһ���
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");//���http��ͷ���룬�������ļ�������
		String name = "";
		String password = "";
		String filename = ""; //��¼�����������ļ������
		String realfilepath = ""; //��¼�����������ļ��ľ��·��
		String cfilepath = ""; // ��¼�����������ļ������·��
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(FileItem item : items){
			//��鵱ǰ��Ŀ����ͨ�?��Ŀ�����ϴ��ļ���
				if(item.isFormField()){ //�������ͨ�?��Ŀ�����������д��?���������ʾ�?���ݡ�
					String fieldName = item.getFieldName();
					if("name".equals(fieldName)){
						name = item.getString("UTF-8"); //����?�ύ�ֶε�������������
					}
					if("pwd".equals(fieldName)){
						password = item.getString();
					}
								
					}else{ ////������ϴ��ļ�,���ļ��ϴ���ָ��Ŀ¼
						String oldPath = item.getName();
						System.out.println("�ϴ��ļ���ԭ���֣�" + oldPath);
						//ע��˴��ļ�����һ����Ϊ��ͬ�û��ϴ����ļ������һ��
						//ʹ��UUID���������Ψһ��ʶ�ַ���Ϊ�ļ���
						//���Ƚ�ȡ��׺���ļ������ļ���ͺ�׺��
						String extName = oldPath.substring(oldPath.lastIndexOf("."));
						// ʹ��UUID�㷨
						String newName = UUID.randomUUID().toString();					
						filename = newName + extName ;					
						System.out.println("�ϴ��ļ��������֣� " + filename);					
						String rootPath = this.getServletContext().getRealPath("/upload");
						realfilepath = rootPath + "\\" + filename;
						cfilepath = "upload" + "/" + filename; //����ͼƬ�����·��					
						System.out.println("�ļ��ľ��·���� " + realfilepath);	
						System.out.println("�ļ������·���� " + cfilepath);
						item.write(new File(realfilepath));										
					}
				}			
					System.out.println("���� " + name);
					System.out.println("���룺 " + password);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
