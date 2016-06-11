package com.Manager.Bean;

import java.util.Date;

/**
 * 本类是建立了一个登入类，用于保存用户登入信息；
 * @author cs 
 *
 */
public class LoginBean{
	private int ID;
	private String userName;
	private String password;
	private String email;
	private String Phone;
	private String aboutMe;
	private String Dept;
	private String Job;
	private Date StartTime;
	private Date LastTime;
	private String HeadUrl;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAboutMe() {
		return aboutMe;
	}
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}
	public String getDept() {
		return Dept;
	}
	public void setDept(String dept) {
		Dept = dept;
	}
	public String getJob() {
		return Job;
	}
	public void setJob(String job) {
		Job = job;
	}
	public Date getStartTime() {
		return StartTime;
	}
	public void setStartTime(Date startTime) {
		StartTime = startTime;
	}
	public Date getLastTime() {
		return LastTime;
	}
	public void setLastTime(Date lastTime) {
		LastTime = lastTime;
	}
	public String getHeadUrl() {
		return HeadUrl;
	}
	public void setHeadUrl(String headUrl) {
		HeadUrl = headUrl;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}