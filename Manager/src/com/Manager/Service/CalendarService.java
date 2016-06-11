package com.Manager.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.Manager.Bean.Calendar;
import com.Manager.Util.UtilJDBC;

/**
 * 
 * @author cs
 *
 */
public class CalendarService {

 	Connection con=null;//第一步，初始化对象
 	PreparedStatement sql;	
 	Statement stmt;
	ResultSet rs;//结果集
	ArrayList<Calendar> mList;	//短消息列表
	int ListCount=0;	
	boolean flag=false;
	Timestamp tt=null;
	/**
	 * 得到日历列表
	 * @param str  条件 如：1=1
	 * @return ArrayList<Calendar>
	 * 
	 */
	public ArrayList<Calendar> GetCalendarList(String str){
		try{
			con=UtilJDBC.getConnection();/**获得连接*/
			String sqlStr="select * from Calendar where "+str;	
			sql=con.prepareStatement(sqlStr);
			rs=sql.executeQuery();
			mList=new ArrayList<Calendar>();
			while(rs.next()){
				Calendar cd=new Calendar();
				cd.setID(rs.getInt("ID"));
				cd.setUserId(rs.getInt("UserID"));
				cd.setClassName(rs.getString("ClassName"));			
				cd.setSource(rs.getString("Source"));
				cd.setTitle(rs.getString("Title"));	
				cd.setEditable(true);
				tt=rs.getTimestamp("StartTime");
		         if( tt!=null ){
		        	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		     		cd.setStart(formatter.format(new java.util.Date(tt.getTime())));            
		            }
		        tt=rs.getTimestamp("EndTime");
		         if( tt!=null ){
		        	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		     		cd.setEnd(formatter.format(new java.util.Date(tt.getTime())));            
		            }	
		         String tempAllDay=rs.getString("AllDay");
					if(tempAllDay.equals("1")){
						cd.setAllDay(true);
					}else{
						cd.setAllDay(false);
					}
					mList.add(cd);
				}
				
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				sql.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return mList;
		
	}

	/**
	 * 更新日历标题
	 * @param cd
	 * @return ListCount
	 */
	public int updateTitleCalendar(Calendar cd){
		try{
			con=UtilJDBC.getConnection();/**获得连接*/
			String sqlStr="update Calendar set Title = '"+cd.getTitle()+"' where ID="+cd.getID();
			sql=con.prepareStatement(sqlStr);
			ListCount=sql.executeUpdate();
			System.out.println("lallal:"+ListCount+":ID:::"+cd.getID()+"kkkk:"+cd.getTitle());
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				sql.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return ListCount;
		
	}
	/**
	 * 更新日历时间
	 * @param id
	 * @param dayDelta
	 * @param minuteDelta 时间差
	 * @return
	 */
	public int updateTimeCalendar(int ID,String dayDelta,String minuteDelta){
		try{
			con=UtilJDBC.getConnection();/**获得连接*/
			String sqlStr="update Calendar set StartTime = (StartTime + interval '"+dayDelta+"' day + interval '"+minuteDelta+"' minute), EndTime=(EndTime + interval '"+dayDelta+"' day + interval '"+minuteDelta+"' minute) where ID="+ID;
			sql=con.prepareStatement(sqlStr);
			ListCount=sql.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				sql.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return ListCount;
		
	}
	/**
	 * 增加一个日历安排
	 * @param Calendar cd
	 * @return ListCount
	 */
	public int AddCalendar(Calendar cd){
		try{
			con=UtilJDBC.getConnection();/**获得连接*/
			int isAllDay=1;
			if(cd.isAllDay()){
				isAllDay=1;
			}else isAllDay=0;
			String sqlStr=null;
		//	System.out.println("我是开始时间"+cd.getStart());
			if(cd.getEnd()!=null){
			 sqlStr="insert into Calendar(ID,userID,Title,StartTime,EndTime,AllDay,status,EditAble) values(calendarAutoID.nextval,"+cd.getUserId()+",'"+cd.getTitle()+"',to_date('"+cd.getStart()+"', 'yyyy-mm-dd hh:mi:ss'),to_date('"+cd.getEnd()+"', 'yyyy-mm-dd hh:mi:ss'),'"+isAllDay+"','1','1')";
			
			}
			else{
				sqlStr="insert into Calendar(ID,userID,Title,StartTime,AllDay,status,EditAble) values(calendarAutoID.nextval,"+cd.getUserId()+",'"+cd.getTitle()+"',to_date('"+cd.getStart()+"', 'yyyy-mm-dd hh:mi:ss'),'"+isAllDay+"','1','1')";
			}
			sql=con.prepareStatement(sqlStr);
			ListCount=sql.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				sql.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ListCount;
		
	}
	/**
	 * 删除日历
	 * @param ID
	 * @return ListCount
	 */
	public int DeleteCalendar(int ID){
		try{
			con=UtilJDBC.getConnection();/**获得连接*/
			String sqlStr="update Calendar set status='0' where ID="+ID;
			sql=con.prepareStatement(sqlStr);
			ListCount=sql.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				sql.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ListCount;
		
	}
}
