package edu.xbmu.myblog.dao;

public class UserDetails {
	private int userId;
	private String trueName;
	private String gender;
	private int age;
	private String mail;
	private String qq;
	private String headerimg;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getHeaderimg() {
		return headerimg;
	}

	public void setHeaderimg(String headerimg) {
		this.headerimg = headerimg;
	}

}
