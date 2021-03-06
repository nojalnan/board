package com.bo.dm.dto;

import org.springframework.stereotype.Component;

@Component
public class BoardInfo {
	private Integer biNum;
	private String biTitle;
	private String biPublisher;
	private String creUsr;
	private String keyword;
	private String isbn;
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
	public String getBiPublisher() {
		return biPublisher;
	}
	public void setBiPublisher(String biPublisher) {
		this.biPublisher = biPublisher;
	}
	public String getCreUsr() {
		return creUsr;
	}
	public void setCreUsr(String creUsr) {
		this.creUsr = creUsr;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getCreDat() {
		return creDat;
	}
	public void setCreDat(String creDat) {
		this.creDat = creDat;
	}
	
}
