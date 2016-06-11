package com.Manager.Bean;

public class ErrorMsgBean {

	/**
	 * 成功与否相关标识
	 */
	private boolean flag;
	/**
	 * 提示消息
	 */
	private String msg;
	
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
