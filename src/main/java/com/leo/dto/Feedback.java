package com.leo.dto;

public class Feedback extends BaseDto {

	private String title;
	private String content;
	private Integer type;
	private String submitPhoneNumber;
	private String submitEmail;
	private Integer isProcessed;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getSubmitPhoneNumber() {
		return submitPhoneNumber;
	}

	public void setSubmitPhoneNumber(String submitPhoneNumber) {
		this.submitPhoneNumber = submitPhoneNumber;
	}

	public String getSubmitEmail() {
		return submitEmail;
	}

	public void setSubmitEmail(String submitEmail) {
		this.submitEmail = submitEmail;
	}

	public Integer getIsProcessed() {
		return isProcessed;
	}

	public void setIsProcessed(Integer isProcessed) {
		this.isProcessed = isProcessed;
	}

}
