package com.Manager.Home;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateServlet extends HttpServlet {

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//去除浏览器缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);	
		int width =90, height = 34;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		
		//获得画笔
		Graphics g = image.getGraphics();
		//设置颜色
		g.setColor(new Color(200,200,200));
		//大小
		g.fillRect(0, 0, 90, 34); 

		g.setFont(new Font("Times New Roman", Font.PLAIN, 24));  
		g.setColor(new Color(200,22,122)); 
		Random rand = new Random();
		String str="";
		 for (int i = 0; i < 4; i++) {  
		        boolean b = rand.nextBoolean();  
		        if (b) { // 字符串  
		            // int choice = random.nextBoolean() ? 65 : 97; 取得65大写字母还是97小写字母  
		            str += (char) (65 + rand.nextInt(26));// 取得大写字母  
		        } else { // 数字  
		            str += String.valueOf(rand.nextInt(10));  
		        }  
		    }  
	//	int randNum = rand.nextInt(8999) + 1000;
		g.drawString(str, 15, 24);
		for(int i=0; i<1000; i++){
			int x = rand.nextInt(100);
			int y = rand.nextInt(50);		
			g.drawOval(x, y, 1, 1);
		}
		g.setColor(new Color(75,45,120));
		for(int i=0;i<15;i++){		
			int x1=rand.nextInt(90);
			int y1=rand.nextInt(50);
			int x2=rand.nextInt(90);
			int y2=rand.nextInt(50);
			g.drawLine(x1, y1, x2, y2);
		}
		g.dispose();
		HttpSession session=request.getSession();
		session.setAttribute("Validate", str);
		ImageIO.write(image, "JPEG", response.getOutputStream()); 
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
