package com.mycompany.teamapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Event {
	private String ename; 
	private int eresid;
	private String esavedfile;
	private String einfo;
	private String emlname;
	private int eprice;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date estart;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date eend;
	
	private MultipartFile ephoto;
	private String emime;
	private String eoriginfile;
	
	public MultipartFile getEphoto() {
		return ephoto;
	}
	public void setEphoto(MultipartFile ephoto) {
		this.ephoto = ephoto;
	}
	public String getEmime() {
		return emime;
	}
	public void setEmime(String emime) {
		this.emime = emime;
	}
	public String getEoriginfile() {
		return eoriginfile;
	}
	public void setEoriginfile(String eoriginfile) {
		this.eoriginfile = eoriginfile;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getEresid() {
		return eresid;
	}
	public void setEresid(int eresid) {
		this.eresid = eresid;
	}
	public String getEsavedfile() {
		return esavedfile;
	}
	public void setEsavedfile(String esavedfile) {
		this.esavedfile = esavedfile;
	}
	public String getEinfo() {
		return einfo;
	}
	public void setEinfo(String einfo) {
		this.einfo = einfo;
	}
	public String getEmlname() {
		return emlname;
	}
	public void setEmlname(String emlname) {
		this.emlname = emlname;
	}
	public int getEprice() {
		return eprice;
	}
	public void setEprice(int eprice) {
		this.eprice = eprice;
	}
	public Date getEstart() {
		return estart;
	}
	public void setEstart(Date estart) {
		this.estart = estart;
	}
	public Date getEend() {
		return eend;
	}
	public void setEend(Date eend) {
		this.eend = eend;
	}
	
	
}
