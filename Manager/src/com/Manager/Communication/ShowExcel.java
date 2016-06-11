package com.Manager.Communication;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Manager.Util.ExeclUtil;

public class ShowExcel extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		System.out.println("我是上传文件到数据");
		/*InputStream excelFile=request.getInputStream();
		//String filename=request.getParameter("file");
		try {
			String[][] data=ExeclUtil.getData(excelFile, 0);
			for( int i = 0 ; i < data.length ; i++ ){
				for( int j = 0 ; j < data[i].length ; j++ ){
					System.out.print(data[i][j] + "\t\t");
				}
				System.out.println();
			}		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(excelFile);	*/	
	}
	public void doGet(HttpServletRequest reqeust,HttpServletResponse response) throws ServletException,IOException{
		doPost(reqeust,response);
	}

}
