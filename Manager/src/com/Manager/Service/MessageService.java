package com.Manager.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import com.Manager.Bean.ShortMessageBean;
import com.Manager.Util.UtilJDBC;




/**
 * 
 * 短消息方法集
 * @author cs
 *
 */
public class MessageService{
	
 	Connection con=null;//第一步，初始化对象
 	PreparedStatement sql;	
 	Statement stmt;
	ResultSet rs;//结果集
	ArrayList<ShortMessageBean> mList;	//短消息列表
	int ListCount=0;	
	boolean flag=false;
	/**
	 * 得到记录数
	 * @param strWhere  -筛选条件
	 * @return   ListCount
	 */
	public int GetRecordCount(String strWhere){
		 //连接数据库 
		con=UtilJDBC.getConnection();
		String selectSql=null;
		try {		
			selectSql="select * from ShortMessage where "+strWhere;
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(selectSql);
			rs.last();
			ListCount=rs.getRow();
			System.out.println(ListCount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ListCount;
	}
	public int GetRecordCountByUnit(){
		
		return ListCount;
		
	}
	
	/**
	 * 
	 * 实现短消息分页功能
	 * @param strWhere  - 筛选条件
	 * @param orderby	- 排序方式
	 * @param pageSize  - 每页行数
	 * @param pageIndex  - 当前页
	 * @return ArrayList ShortMessageBean    - 短消息对象链表
	 */
	
	public ArrayList<ShortMessageBean> GetListByPage(String strWhere, String orderby, int pageSize, int pageIndex){	
		try{
	   //连接数据库 
		con=UtilJDBC.getConnection();
		String sqlstr="select * from (select t.*, rownum rn from (select * from ShortMessage where "+strWhere+" order by "+orderby+") t where rownum<=?) where rn>=?";
		sql = con.prepareStatement(sqlstr);
		sql.setInt(1, pageIndex*pageSize);
		sql.setInt(2, 1+(pageIndex-1)*pageSize);
		rs = sql.executeQuery();
		mList = new ArrayList<ShortMessageBean>();
		while (rs.next()) {
			ShortMessageBean msg = new ShortMessageBean();
			msg.setID(rs.getInt("ID"));
			msg.setReceiverID(rs.getInt("ReceiverID"));
			msg.setReceiverName(rs.getString("ReceiverName"));
			msg.setSendID(rs.getInt("SendID"));
			msg.setSendName(rs.getString("SendName"));
			msg.setSendStatu(rs.getString("SendStatu"));
			msg.setSendTime(rs.getTimestamp("SendTime"));
			msg.setContent(rs.getString("Content"));
			msg.setReceiverStatu(rs.getString("ReceiverStatu"));
			mList.add(msg);	
		}

		if (null != rs) {
			rs.close();
		}
		if (null != sql) {
			sql.close();
		}
		if (null != con) {
			con.close();
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return mList;
	}
	
	/**
	 * 标记短消息已读
	 * @param idlist   -ID字符串
	 * @return ListCount  -更新记录数
	 */
	
	public int markerMessageByID(String idlist){
		con=UtilJDBC.getConnection();
		String sqlstr="update shortMessage set receiverStatu=1 where ID in("+idlist+")"; 
		try {
			sql = con.prepareStatement(sqlstr);
			ListCount=sql.executeUpdate();	
			
			/*关闭连接*/
			sql.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ListCount;
		
	}
	/**
	 * 添加一条短消息记录
	 * @param smb
	 * @return  flag   
	 * 
	 */
	
	public boolean addShortMessage(ShortMessageBean smb){
		 //连接数据库 
		con=UtilJDBC.getConnection();
		try {
			sql = con.prepareStatement("insert into shortmessage(ID,sendname,sendid,receivername,receiverid,content,sendtime,sendstatu,receiverstatu) values(AutoMessID.nextval,?,?,?,?,?,?,?,?)");
			sql.setString(1, smb.getSendName());
			sql.setInt(2, smb.getSendID());
			sql.setString(3, smb.getReceiverName());
			sql.setInt(4, smb.getReceiverID());
			sql.setString(5, smb.getContent());
			sql.setTimestamp(6, new java.sql.Timestamp(new Date().getTime()));
			sql.setString(7, smb.getSendStatu());
			sql.setString(8, smb.getReceiverStatu());
			if(sql.executeUpdate()>0){
				flag=true;
			}else flag=false;		
			/*关闭连接*/
			sql.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
		
	}
	
	/**
	 * 获得所有短消息记录
	 * @return
	 */
	public ArrayList<ShortMessageBean> GetListAll(){
		try{
			   //连接数据库 
				con=UtilJDBC.getConnection();
				sql = con.prepareStatement("select * from ShortMessage");
				rs = sql.executeQuery();
				mList = new ArrayList<ShortMessageBean>();
				while (rs.next()) {
					ShortMessageBean msg = new ShortMessageBean();
					msg.setID(rs.getInt("ID"));
					msg.setReceiverID(rs.getInt("ReceiverID"));
					msg.setReceiverName(rs.getString("ReceiverName"));
					msg.setSendID(rs.getInt("SendID"));
					msg.setSendName(rs.getString("SendName"));
					msg.setSendStatu(rs.getString("SendStatu"));
					msg.setSendTime(rs.getTimestamp("SendTime"));
					msg.setContent(rs.getString("Content"));
					msg.setReceiverStatu(rs.getString("ReceiverStatu"));
					mList.add(msg);	
				}
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					try {
						if (null != rs) {						
								rs.close();
							} 						
						if (null != sql) {				
								sql.close();
						}
						if (null != con) {					
								con.close();
						} }catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
		return mList;
	}
}