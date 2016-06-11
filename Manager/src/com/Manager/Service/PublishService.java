package com.Manager.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;



import java.util.Date;

import com.Manager.Bean.PublishBean;
import com.Manager.Bean.ShortMessageBean;
import com.Manager.Util.UtilJDBC;

public class PublishService {

 	Connection con=null;//第一步，初始化对象
 	PreparedStatement sql;	
 	Statement stmt;
	ResultSet rs;//结果集
	ArrayList<PublishBean> PList;	//短消息列表
	int ListCount=0;	
	boolean flag=false;
	Timestamp tt=null;
	/**
	 * 得到公告链表
	 * @param str  筛选条件
	 * @return  arraylist PublishBean
	 */
	public ArrayList<PublishBean> GetPublishList(String str){
		try{
			con=UtilJDBC.getConnection();/**获得连接*/
			String sqlStr="select * from Publish where "+str;	
			sql=con.prepareStatement(sqlStr);
			rs=sql.executeQuery();
			PList=new ArrayList<PublishBean>();
			while(rs.next()){
				PublishBean pb=new PublishBean();
				pb.setID(rs.getInt("ID"));
				pb.setTitle(rs.getString("Title"));
				pb.setPublishTime(rs.getTimestamp("PUBLISHTIME"));
				pb.setContent(rs.getString("Content"));
				pb.setPicUrl(rs.getString("PicUrl"));	
				pb.setTabOne(rs.getString("TabOne"));
				pb.setTabTwo(rs.getString("TabTwo"));
				pb.setTabThree(rs.getString("TabThree"));
				pb.setAttachment1(rs.getString("Attachment1"));
				pb.setAttachment2(rs.getString("Attachment2"));
				pb.setAttachment3(rs.getString("Attachment3"));
				pb.setDownloadCount(rs.getInt("DownloadCount"));
				pb.setPublisherID(rs.getInt("PublisherID"));				
				PList.add(pb);
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
		return PList;
		
	}
	/**
	 * 添加一个公告
	 * @param pb
	 * @return
	 */
	public int AddPublish(PublishBean pb){
		try{
			con=UtilJDBC.getConnection();/**获得连接*/
			 String sqlStr="insert into Publish(ID,Title,PublishTime,Content,downloadCount,TabOne,TabTwo,TabThree,PicUrl,Attachment1,Attachment2,Attachment3,PublisherID) values(PublishAutoID.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
			sql=con.prepareStatement(sqlStr);
			sql.setString(1, pb.getTitle());
			sql.setTimestamp(2,new java.sql.Timestamp(new Date().getTime()));
			sql.setString(3, pb.getContent());
			sql.setInt(4, 0);
			sql.setString(5, pb.getTabOne());
			sql.setString(6, pb.getTabTwo());
			sql.setString(7, pb.getTabThree());
			sql.setString(8, pb.getPicUrl());
			sql.setString(9, pb.getAttachment1());
			sql.setString(10, pb.getAttachment2());
			sql.setString(11, pb.getAttachment3());
			sql.setInt(12,pb.getPublisherID());
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
	 * 更新下载量
	 * @param ID
	 * @return 
	 */
	public int UpdatePublish(int ID){
		try{
			con=UtilJDBC.getConnection();/**获得连接*/
			String sqlStr="update Publish set DownloadCount=DownloadCount+1 where ID="+ID;
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
	 * 得到公告列表
	 * @param str
	 * @param orderBy
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public ArrayList<PublishBean> GetPublishListByPage(String str,String orderBy,int pageSize,int pageIndex){
		try{
			   //连接数据库 
				con=UtilJDBC.getConnection();
				String sqlstr="select * from (select t.*, rownum rn from (select * from Publish where "+str+" order by "+orderBy+") t where rownum<=?) where rn>=?";
				sql = con.prepareStatement(sqlstr);
				sql.setInt(1, pageIndex*pageSize);
				sql.setInt(2, 1+(pageIndex-1)*pageSize);
				rs = sql.executeQuery();
				PList = new ArrayList<PublishBean>();
				while (rs.next()) {
					PublishBean pl=new PublishBean();
					pl.setID(rs.getInt("ID"));
					pl.setTitle(rs.getString("Title"));
					pl.setTabOne(rs.getString("TabOne"));
					pl.setTabTwo(rs.getString("TabTwo"));
					pl.setTabThree(rs.getString("TabThree"));
					pl.setAttachment1(rs.getString("Attachment1"));
					pl.setAttachment2(rs.getString("Attachment2"));
					pl.setAttachment3(rs.getString("Attachment3"));
					pl.setContent(rs.getString("Content"));
					pl.setDownloadCount(rs.getInt("DownloadCount"));
					pl.setPicUrl(rs.getString("PicUrl"));
					pl.setPublishTime(rs.getTimestamp("PublishTime"));
					pl.setPublisherID(rs.getInt("PublisherID"));
					PList.add(pl);	
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
		return PList;
		
	}

	/**
	 * 得到记录数
	 * @param str
	 * @return
	 */
	public int GetRecordCount(String str){
		 //连接数据库 
		con=UtilJDBC.getConnection();
		String selectSql=null;
		try {		
			selectSql="select * from Publish where "+str;
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(selectSql);
			rs.last();
			ListCount=rs.getRow();
			//System.out.println(ListCount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ListCount;
	}
}
