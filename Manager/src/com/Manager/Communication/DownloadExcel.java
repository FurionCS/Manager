package com.Manager.Communication;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;


import com.Manager.Bean.ShortMessageBean;
import com.Manager.Service.MessageService;
import com.Manager.Util.DateTimeUtil;
import com.Manager.Util.PropertiesUtil;

public class DownloadExcel  extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
			  this.doPost(request, response);
	 }
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		System.out.println("wo jinglai lo");
		 //往excel中写入数据
   	 String destPath = PropertiesUtil.getDestPath();
   	 File destFile = null;
   	 try {
   		 destFile = new File(destPath + File.separator + "test2.xls");
   		 //创建读写excel的对象
   		 WritableWorkbook book = jxl.Workbook.createWorkbook( destFile );
   		 WritableSheet sheet  = book.createSheet("第一页", 0);
   		 Label label = null;
   		 MessageService ms=new MessageService();
   		 ArrayList<ShortMessageBean> alsm=ms.GetListAll();
   		 for(int i=0;i<alsm.size();i++){
   			 int j=0;
   			 label=new Label(j,i,alsm.get(i).getSendName());
   			 sheet.addCell(label);
   			 j++;
   			label=new Label(j,i,alsm.get(i).getContent());
  			 sheet.addCell(label);
  			 j++;
  			label=new Label(j,i,alsm.get(i).getReceiverName());
  			 sheet.addCell(label);
  			 j++;
  			label=new Label(j,i,DateTimeUtil.formatDate(alsm.get(i).getSendTime(),"yyyy-mm-dd hh:mi:ss"));
  			 sheet.addCell(label);
  			 j++;
   		 }
   		 
   		book.write();
		book.close();
		} catch (FileNotFoundException e) {
			System.out.println("目标文件夹："+destPath +"不存在,请先创建该文件夹!");
			return;
		}catch (IOException e) {
			e.printStackTrace();
			return;
		}catch (WriteException e) {
			e.printStackTrace();
			return;
		}
   	 System.out.println("文件写入完成,保存路径为:" + destFile.getAbsolutePath());
 }
}
