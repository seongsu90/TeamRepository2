package com.mycompany.teamapp.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Review {
	private int revno;
	private int revresid;
	private String revmid;
	private String revcontent;
	private int revscore;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date revdate;
	
	public int getRevno() {
		return revno;
	}
	public void setRevno(int revno) {
		this.revno = revno;
	}
	public int getRevresid() {
		return revresid;
	}
	public void setRevresid(int revresid) {
		this.revresid = revresid;
	}
	public String getRevmid() {
		return revmid;
	}
	public void setRevmid(String revmid) {
		this.revmid = revmid;
	}
	public String getRevcontent() {
		return revcontent;
	}
	public void setRevcontent(String revcontent) {
		this.revcontent = revcontent;
	}
	public int getRevscore() {
		return revscore;
	}
	public void setRevscore(int revscore) {
		this.revscore = revscore;
	}
	public Date getRevdate() {
		return revdate;
	}
	public void setRevdate(Date revdate) {
		this.revdate = revdate;
	}
}
