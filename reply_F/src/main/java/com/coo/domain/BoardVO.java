package com.coo.domain;

import java.util.Date;

public class BoardVO {
	
	Integer bno;
	Integer uno; 
	String nickname;
	String pw;
	String title;
	String content;
	Date regdate;
	Date updatedate;
	Integer viewcnt;
	Integer replycnt;
	Integer likecnt;
	
	public Integer getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(Integer likecnt) {
		this.likecnt = likecnt;
	}
	public Integer getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(Integer replycnt) {
		this.replycnt = replycnt;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Integer getUno() {
		return uno;
	}
	public void setUno(Integer uno) {
		this.uno = uno;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public Integer getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(Integer viewcnt) {
		this.viewcnt = viewcnt;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", uno=" + uno + ", nickname=" + nickname + ", pw=" + pw + ", title=" + title
				+ ", content=" + content + ", regdate=" + regdate + ", updatedate=" + updatedate + ", viewcnt="
				+ viewcnt + ", replycnt=" + replycnt + ", likecnt=" + likecnt + "]";
	}
	
	
}
