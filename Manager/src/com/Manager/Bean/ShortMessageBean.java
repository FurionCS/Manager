package com.Manager.Bean;

import java.util.Date;

public class ShortMessageBean {
	private int ID;
	private String SendName;
	private int SendID;
	private String ReceiverName;
	private int ReceiverID;
	private String Content;
	private Date SendTime;
	private String SendStatu;
	private String ReceiverStatu;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getSendName() {
		return SendName;
	}
	public void setSendName(String sendName) {
		SendName = sendName;
	}
	public int getSendID() {
		return SendID;
	}
	public void setSendID(int sendID) {
		SendID = sendID;
	}
	public String getReceiverName() {
		return ReceiverName;
	}
	public void setReceiverName(String receiverName) {
		ReceiverName = receiverName;
	}
	public int getReceiverID() {
		return ReceiverID;
	}
	public void setReceiverID(int receiverID) {
		ReceiverID = receiverID;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Date getSendTime() {
		return SendTime;
	}
	public void setSendTime(Date sendTime) {
		SendTime = sendTime;
	}
	public String getSendStatu() {
		return SendStatu;
	}
	public void setSendStatu(String sendStatu) {
		SendStatu = sendStatu;
	}
	public String getReceiverStatu() {
		return ReceiverStatu;
	}
	public void setReceiverStatu(String receiverStatu) {
		ReceiverStatu = receiverStatu;
	}
}
