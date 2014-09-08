package edu.xbmu.myblog.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Articles {
	private int articleId;
	private int authorId;
	private String title;
	private String contents;
	private Date pubDate;
	private int clicks;
	private int commCount;
	
	
	
	public int getCommCount() {
		return commCount;
	}
	public void setCommCount(int commCount) {
		this.commCount = commCount;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public String getContents2String(){
		if(this.contents.length()<200){
			return this.contents;
		}
		else{
			return this.contents.substring(0, 200);
		}
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getPubDate() {
		return pubDate;
	}
	public String getPubDate2String(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(this.pubDate);
	}
	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}
	public int getClicks() {
		return clicks;
	}
	public void setClicks(int clicks) {
		this.clicks = clicks;
	}
	
}
