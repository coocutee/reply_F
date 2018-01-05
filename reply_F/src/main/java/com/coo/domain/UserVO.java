package com.coo.domain;

import java.util.Date;

public class UserVO {

	int uno;
	String id;
	String pw;
	String nickname;
	Date regdate;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "UserVO [uno=" + uno + ", id=" + id + ", pw=" + pw + ", nickname=" + nickname + ", regdate=" + regdate
				+ "]";
	}
	
	
}
