package com.bo.dm.dto;

import org.springframework.stereotype.Component;

@Component
public class SearchVO {
	private String biTitle;
	private String biPublisher;
	private String creUsr;
	private String keyword;
	private String isbn;
	private String creDat;
	private String startDate;
	private String endDate;
	
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}
