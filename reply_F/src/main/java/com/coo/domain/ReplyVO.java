package com.coo.domain;

import java.util.Date;

public class ReplyVO {
	
	private int rno;
	private int uno;
	private int bno;
	private int replycnt;
	private String nickname;
	private String reptxt;
	private Date regdate;
	
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getReptxt() {
		return reptxt;
	}
	public void setReptxt(String reptxt) {
		this.reptxt = reptxt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", uno=" + uno + ", bno=" + bno + ", replycnt=" + replycnt + ", nickname="
				+ nickname + ", reptxt=" + reptxt + ", regdate=" + regdate + "]";
	}
	
	
}
