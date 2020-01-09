package com.bo.dm.dto;

import org.springframework.stereotype.Component;

@Component
public class BoardInfo {
	private Integer biNum;
	private String biTitle;
	private String biContent;
	private String biPwd;
	private String creUsr;
	private String creDat;
	
	public Integer getBiNum() {
		return biNum;
	}
	public void setBiNum(Integer biNum) {
		this.biNum = biNum;
	}
	public String getBiTitle() {
		return biTitle;
	}
	public void setBiTitle(String biTitle) {
		this.biTitle = biTitle;
	}
	public String getBiContent() {
		return biContent;
	}
	public void setBiContent(String biContent) {
		this.biContent = biContent;
	}
	public String getBiPwd() {
		return biPwd;
	}
	public void setBiPwd(String biPwd) {
		this.biPwd = biPwd;
	}
	public String getCreUsr() {
		return creUsr;
	}
	public void setCreUsr(String creUsr) {
		this.creUsr = creUsr;
	}
	public String getCreDat() {
		return creDat;
	}
	public void setCreDat(String creDat) {
		this.creDat = creDat;
	}
	
}
