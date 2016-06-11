package com.Manager.Service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.Manager.Bean.ContactBean;
import com.Manager.Util.UtilJDBC;

public class ContactService {	
	/**
	 * 添加联系人方法
	 * @param contact  联系人对象
	 * @return  true or false 
	 * 
	 */
	public boolean AddContact(ContactBean contact){
		//第一步，初始化对象
	 	Connection con=null;
	    PreparedStatement sql=null; 
	    boolean IsSuccess=false;
	   //连接数据库 
		con=UtilJDBC.getConnection();
		try {
			sql=con.prepareStatement("insert into ContactInfo(ID,Name,Sex,Birthday,Phone,Email,QQ,WorkAdress,HomeAdress,Code) values(ContactIDAuto.nextval,?,?,?,?,?,?,?,?,?)");
			sql.setString(1, contact.getName());
		    sql.setString(2, contact.getSex());
		    sql.setDate(3, (Date) contact.getBirthday());
		    sql.setString(4, contact.getPhone());
		    sql.setString(5, contact.getEmail());
		    sql.setString(6, contact.getQQ());
		    sql.setString(7, contact.getWorkAddress());
		    sql.setString(8, contact.getHomeAddress());
		    sql.setInt(9, contact.getCode());		    
		    if(sql.executeUpdate()>0){
		    	IsSuccess=true;
		    }; //执行！！！		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(sql!=null){
				try {
					sql.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	    
		return IsSuccess;
	};
	/**
	 * 删除一个或一组联系人
	 * @param IDList   String
	 * @return  返回删除的个数
	 * 
	 */
	public int DeleteContact(String IDList){		
		//第一步，初始化对象
	 	Connection con=null;
	    PreparedStatement sql=null; 
	    int DeleteNum=0;
	   //连接数据库 
		con=UtilJDBC.getConnection();
		try {
			System.out.println("ID:"+IDList);
			sql=con.prepareStatement("delete from  ContactInfo where ID in ( ? )");
			sql.setString(1,IDList);
		    if((DeleteNum=sql.executeUpdate())>0){
		    	System.out.print("DeleteNum:"+DeleteNum);
		    }; //执行！！！		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(sql!=null){
				try {
					sql.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	    

		return DeleteNum;
		
	};

	/**
	 * 更新一个联系人信息
	 * @param contact 联系人对象
	 * @return true or  false
	 */
	public boolean UpdateContact(ContactBean contact){
		//第一步，初始化对象
	 	Connection con=null;
	    PreparedStatement sql=null; 
	    boolean IsSuccess=false;
	   //连接数据库 
		con=UtilJDBC.getConnection();
		try {
			
			sql=con.prepareStatement("update ContactInfo set Name=? , Sex=? , Birthday=? , Phone=?, Email=? , QQ=? , WorkAdress=? , HomeAdress=? , Code=? where ID=?");
			sql.setString(1, contact.getName());
		    sql.setString(2, contact.getSex());
		    sql.setDate(3, (Date) contact.getBirthday());
		    sql.setString(4, contact.getPhone());
		    sql.setString(5, contact.getEmail());
		    sql.setString(6, contact.getQQ());
		    sql.setString(7, contact.getWorkAddress());
		    sql.setString(8, contact.getHomeAddress());
		    sql.setInt(9, contact.getCode());		
		    sql.setInt(10, contact.getID());
		    if(sql.executeUpdate()>0){
		    	IsSuccess=true;
		    }; //执行！！！		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(sql!=null){
				try {
					sql.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	    
		return IsSuccess;		
	};
	/**
	 * 
	 * @param strWhere
	 * @return count   返回记录数
	 */
	public int GetRecordCount(String strWhere){
		//第一步，初始化对象
	 	Connection con=null;
	    Statement stmt=null; 
	    String sql=null;
	    ResultSet rs;
	    int count = 0;
	   //连接数据库 
		con=UtilJDBC.getConnection();
		try {
			if(strWhere!=""&&strWhere!=null){
				sql="select * from ContactInfo where "+strWhere;
			}else{
				sql="select * from ContactInfo";
			}
			 stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			 rs=stmt.executeQuery(sql);
			 rs.last();
			 count=rs.getRow();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}	
		return count;
	}
	
	/**
	 * 
	 * 分页查询
	 * @param strWhere
	 * @param orderby
	 * @param pageSize
	 * @param pageIndex
	 * @return ArrayList<ContactBean>
	 */
	public ArrayList<ContactBean> GetListByPage(String strWhere, String orderby, int pageSize, int pageIndex){
		//第一步，初始化对象
	 	Connection con=null;
	   //连接数据库 
		con=UtilJDBC.getConnection();
		ArrayList<ContactBean> ContactList=new ArrayList<ContactBean>();
		int  intPageSize=pageSize; //一页要显示的记录数
		int  intRowCount;          //记录总数
		int  intPageCount;         //总页数
		int  intPage=pageIndex;    //待显示页码
		int  i;
		try {
			Statement stmt=con.createStatement(
					ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY);		
			String sql="select * from ContactInfo ";
			if(strWhere!=""&& strWhere!=null){
				sql+="where "+strWhere;
			}
			if(orderby.trim()!=""&&orderby.trim()!=null){
				sql+="order by "+orderby;
			}

			ResultSet rs=stmt.executeQuery(sql);
			rs.last(); //将光标移到结果的最后一条记录
			intRowCount=rs.getRow();//得到记录总数
			intPageCount=(intRowCount+intPageSize-1)/intPageSize;//计算总页数
			if(intPage>intPageCount) intPage=intPageCount;
			if(intPageCount>0){
				rs.absolute((intPage-1)*intPageSize+1);
				i=0;
				while(i<intPageSize && !rs.isAfterLast()){
					ContactBean CB=new ContactBean();
					CB.setID(rs.getInt("ID"));
					CB.setName(rs.getString("NAME"));
					CB.setSex(rs.getString("SEX"));					
					CB.setBirthday(rs.getTimestamp("BIRTHDAY"));
					CB.setPhone(rs.getString("PHONE"));
					CB.setEmail(rs.getString("EMAIL"));
					CB.setQQ(rs.getString("QQ"));
					CB.setWorkAddress(rs.getString("WORKADRESS"));
					CB.setHomeAddress(rs.getString("HOMEADRESS"));
					CB.setCode(rs.getInt("CODE"));
					ContactList.add(CB);			
					rs.next();
					i++;		
				}			
			}
			rs.close();
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ContactList ;
		
	}
	/**
	 * 
	 * @param str  查询条件
	 * @param orderby   排序方式
	 * @return 联系人列表
	 * 
	 */
	
	public ArrayList<ContactBean> SelectContact(String str,String odr){
		//第一步，初始化对象
	 	Connection con=null;
	    PreparedStatement sql=null; 
	    ResultSet rs=null;
	   //连接数据库 
		con=UtilJDBC.getConnection();
		ArrayList<ContactBean> ContactList=new ArrayList<ContactBean>();
		String sqlstr=null;
		if((str==""||str==null)&&(odr==""||odr==null)){
			 sqlstr="select * from ContactInfo";
		}
		else if((str!=null&&str!="")&& (odr==""||odr==null)){
			sqlstr="select * from ContactInfo where "+str;
		}
		else if((str==null||str=="")&& (odr!=""&&odr!=null)){
			sqlstr="select * from ContactInfo order by "+odr;
		}
		else{
			sqlstr="select * from ContactInfo where "+str+" order by "+odr;
		}
		try {		
			sql=con.prepareStatement(sqlstr);		    
		    rs=sql.executeQuery(); 		    
		   // HttpSession session=request.getSession();
			
				try {
					while(rs.next()){
						ContactBean CB=new ContactBean();
						CB.setID(rs.getInt("ID"));
						CB.setName(rs.getString("NAME"));
						CB.setSex(rs.getString("SEX"));
						CB.setBirthday(rs.getTimestamp("BIRTHDAY"));
						CB.setPhone(rs.getString("PHONE"));
						CB.setEmail(rs.getString("EMAIL"));
						CB.setQQ(rs.getString("QQ"));
						CB.setWorkAddress(rs.getString("WORKADRESS"));
						CB.setHomeAddress(rs.getString("HOMEADRESS"));
						CB.setCode(rs.getInt("CODE"));
					///	System.out.print(rs.getString("NAME")+"@@@@@@@"+CB+".......");
						ContactList.add(CB);
					//	System.out.println(ContactList.size());
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
					
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(sql!=null){
				try {
					sql.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	    
		
		return ContactList;
	}
}
