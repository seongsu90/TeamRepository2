package com.mycompany.teamapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	public final static int MRANK_ADMINISTRATOR = 2;
	public final static int MRANK_RES_MANAGER = 1;
	public final static int MRANK_NORMAL = 0;
	private String mid;
	private String mname;
	private String mpassword;
	private String mphone;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mbirth;
	private String mlocation;
	private int mrank;
	private int mpoint;
	private int mresid;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public String getMlocation() {
		return mlocation;
	}
	public void setMlocation(String mlocation) {
		this.mlocation = mlocation;
	}
	public int getMrank() {
		return mrank;
	}
	public void setMrank(int mrank) {
		this.mrank = mrank;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	public int getMresid() {
		return mresid;
	}
	public void setMresid(int mresid) {
		this.mresid = mresid;
	}

}
