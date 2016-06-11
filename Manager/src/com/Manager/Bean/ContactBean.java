package com.Manager.Bean;

import java.util.Date;

/**
 * 联系人的Bean
 * @author cs
 * 
 */


public class ContactBean {
	private int ID;
	private String Name;
	private String Sex;
	private Date Birthday;
	private String Phone;
	private String Email;
	private String 	QQ;
	private String WorkAddress;
	private String HomeAddress;
	private int Code;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}

	public Date getBirthday() {
		return Birthday;
	}
	public void setBirthday(Date birthday) {
		Birthday = birthday;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	public String getWorkAddress() {
		return WorkAddress;
	}
	public void setWorkAddress(String workAddress) {
		WorkAddress = workAddress;
	}
	public String getHomeAddress() {
		return HomeAddress;
	}
	public void setHomeAddress(String homeAddress) {
		HomeAddress = homeAddress;
	}
	public int getCode() {
		return Code;
	}
	public void setCode(int code) {
		Code = code;
	}
}
