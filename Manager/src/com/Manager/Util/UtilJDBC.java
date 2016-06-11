package com.Manager.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UtilJDBC {
	//驱动程序
//	private String driverName="oracle.jdbc.driver.OracleDriver";
	static{
		//加载驱动器
		 try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 System.out.print("看看我是不是加载一次");
	}
	public static Connection getConnection(){
	 try{   	
	    return DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl3205", "CS", "123456");  
	 }
	 catch (SQLException e) {
         e.printStackTrace();
         return null;
     } 
	
	}
}
