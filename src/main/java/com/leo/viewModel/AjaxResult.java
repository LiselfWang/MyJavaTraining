package com.leo.viewModel;

public class AjaxResult {

	public AjaxResult(int status, String messages) {
		this.status = status;
		this.messages = messages;
	}

	int status;
	String messages;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessages() {
		return messages;
	}

	public void setMessages(String messages) {
		this.messages = messages;
	}

}
