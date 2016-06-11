package com.Manager.Bean;

import java.util.Date;

public class PublishBean {
	private int ID;
	private String Title;
	private Date PublishTime;
	private String Content;
	private int downloadCount;
	private String TabOne;
	private String TabTwo;
	private String TabThree;
	private String PicUrl;
	private String Attachment1;
	private String Attachment2;
	private String Attachment3;
	private int PublisherID;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public Date getPublishTime() {
		return PublishTime;
	}
	public void setPublishTime(Date publishTime) {
		PublishTime = publishTime;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	public String getTabOne() {
		return TabOne;
	}
	public void setTabOne(String tabOne) {
		TabOne = tabOne;
	}
	public String getTabTwo() {
		return TabTwo;
	}
	public void setTabTwo(String tabTwo) {
		TabTwo = tabTwo;
	}
	public String getTabThree() {
		return TabThree;
	}
	public void setTabThree(String tabThree) {
		TabThree = tabThree;
	}
	public String getPicUrl() {
		return PicUrl;
	}
	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
	public String getAttachment1() {
		return Attachment1;
	}
	public void setAttachment1(String attachment1) {
		Attachment1 = attachment1;
	}
	public String getAttachment2() {
		return Attachment2;
	}
	public void setAttachment2(String attachment2) {
		Attachment2 = attachment2;
	}
	public String getAttachment3() {
		return Attachment3;
	}
	public void setAttachment3(String attachment3) {
		Attachment3 = attachment3;
	}
	public int getPublisherID() {
		return PublisherID;
	}
	public void setPublisherID(int publisherID) {
		PublisherID = publisherID;
	}
	
	
}
