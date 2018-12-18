package com.news24.beans;

import java.sql.Date;

public class News {
	private int newsId;
	private String title, category,detail,image,author;
	private Date newsDt;
	
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getNewsDt() {
		return newsDt;
	}
	public void setNewsDt(Date newsDt) {
		this.newsDt = newsDt;
	}
	
	
}
