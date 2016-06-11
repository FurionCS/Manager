package com.Manager.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.Manager.Bean.LoginBean;
import com.Manager.Util.DateTimeUtil;
import com.Manager.Util.UtilJDBC;
/**
 * 登入的方法集
 * @author 程胜
 *
 */
public class LoginService {
	/**
	 * 用于检查用户登入
	 * @param Loginer
	 * @return  ArrayList  登入者列表
	 * @throws SQLException 
	 */
	public ArrayList<LoginBean> checkLogin(LoginBean Loginer) throws SQLException{
		PreparedStatement sql=null; 
	    ResultSet rs=null;
	    Connection con=null;
	    ArrayList<LoginBean> login=null;
		try{
			con=UtilJDBC.getConnection();//连接数据		 	
		    sql=con.prepareStatement("select * from  userinfo where NAME='"+Loginer.getUserName()+"'");
		    rs=sql.executeQuery(); //执行！！！
		    int N=0;
		    int P=0;
		    while(rs.next()){
		    	if(Loginer.getUserName().equals(rs.getString("NAME"))){
		    		N=1001;
		    		if(Loginer.getPassword().equals(rs.getString("PASSWORD"))){
		    			P=1001;
		    			//实例化保存用户登入信息LoginBean
		    			LoginBean uu=new LoginBean();
		    			uu.setID(rs.getInt("ID"));
		    			uu.setUserName(rs.getString("Name"));
		    			uu.setPassword(rs.getString("PassWord"));
		    			uu.setAboutMe(rs.getString("aboutMe"));
		    			uu.setDept(rs.getString("Dept"));
		    			uu.setJob(rs.getString("Job"));
		    			uu.setEmail(rs.getString("Email"));
		    			uu.setPhone(rs.getString("Phone"));
		    			uu.setHeadUrl(rs.getString("HeadUrl"));
		    			uu.setStartTime(rs.getTimestamp("StartTime"));
		    			uu.setLastTime(rs.getTimestamp("LastTime"));
	    			login=new ArrayList<LoginBean>();//实例化登入对象列表	
		    			login.add(uu);	
		    		}
		    		else{
		    			//密码错误
		    			
		    		}
		    	}
		    	else{
		    		//不存在该用户		    		
		    	}
		    }
		}catch(SQLException E){
			E.printStackTrace();
		}finally
	       {    
	           if(sql!= null)
				try {
					sql.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	           if(con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	       } 
		return login;	 
	}

	/**
	 * 用于注册用户添加
	 * @param loginer
	 * @return
	 */
	public boolean AddAdmin(LoginBean loginer){
		PreparedStatement sql=null; 
	    Connection con=null;
	    boolean rs=false;
	    try{
			con=UtilJDBC.getConnection();//连接数据		 	
		    sql=con.prepareStatement("insert into userinfo(ID,Name,Password,Email,Phone,StartTime) values(IDAuto.nextval,?,?,?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'))");
	        sql.setString(1, loginer.getUserName());
	        sql.setString(2, loginer.getPassword());
	        sql.setString(3, loginer.getEmail());
	        sql.setString(4, loginer.getPhone());
	        sql.setString(5, DateTimeUtil.getFullTime());
	        if(sql.executeUpdate()>0){
	        	rs=true;
	        }; //执行！！！	   
		}catch(SQLException E){
			E.printStackTrace();
		}finally
	       {    
	           if(sql!= null)
				try {
					sql.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	           if(con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	       } 
		return rs;
		
	}
	/**
	 * 分页取得管理员列表
	 * @param strWhere
	 * @param orderby
	 * @param pageSize
	 * @param pageIndex
	 * @return ArrayList<loginBean>
	 * 
	 */
	
	public ArrayList<LoginBean> GetListByPage(String strWhere, String orderby, int pageSize, int pageIndex){
		PreparedStatement sql=null; 
	    ResultSet rs=null;
	    Connection con=null;
	    ArrayList<LoginBean> login=null;
		try{
			   //连接数据库 
				con=UtilJDBC.getConnection();
				String sqlstr="select * from (select t.*, rownum rn from (select * from userinfo where "+strWhere+") t where rownum<=?) where rn>=?";
				sql = con.prepareStatement(sqlstr);
				sql.setInt(1, pageIndex*pageSize);
				sql.setInt(2, 1+(pageIndex-1)*pageSize);
				rs = sql.executeQuery();
				login = new ArrayList<LoginBean>();
				while (rs.next()) {
					LoginBean lb = new LoginBean();
					lb.setID(rs.getInt("ID"));
					lb.setUserName(rs.getString("Name"));
					lb.setPhone(rs.getString("Phone"));
					lb.setEmail(rs.getString("Email"));
					login.add(lb);	
				}

				if (null != rs) {
					rs.close();
				}
				if (null != sql) {
					sql.close();
				}
				if (null != con) {
					sql.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return login;
		
	}
	
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
				sql="select * from userInfo where "+strWhere;
			}else{
				sql="select * from userInfo";
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
	 * 更新LoginBean 信息
	 * @param newstr
	 * @param whereStr
	 * @return count
	 */
	public int UpdateLogin(String newstr,String whereStr){
		PreparedStatement sql=null; 
	    Connection con=null;	
	    int count=0;
	    try{
	    	  //连接数据库 
			con=UtilJDBC.getConnection();
			String sqlstr="update userinfo set "+newstr+ "where "+whereStr;
			sql = con.prepareStatement(sqlstr);
			count=sql.executeUpdate();
			
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    try {
			sql.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return count;
	}
}
