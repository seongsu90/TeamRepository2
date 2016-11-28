package com.mycompany.teamapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Coupon {
	private int cnumber;
	private String cname;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date cdday;
	private String cinfo;
	private int cresid;
	private int cdiscount;
	private String cresname;
	
	public String getCresname() {
		return cresname;
	}
	public void setCresname(String cresname) {
		this.cresname = cresname;
	}
	public int getCnumber() {
		return cnumber;
	}
	public void setCnumber(int cnumber) {
		this.cnumber = cnumber;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Date getCdday() {
		return cdday;
	}
	public void setCdday(Date cdday) {
		this.cdday = cdday;
	}
	public String getCinfo() {
		return cinfo;
	}
	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}
	public int getCresid() {
		return cresid;
	}
	public void setCresid(int cresid) {
		this.cresid = cresid;
	}
	public int getCdiscount() {
		return cdiscount;
	}
	public void setCdiscount(int cdiscount) {
		this.cdiscount = cdiscount;
	}
	
	
	}
