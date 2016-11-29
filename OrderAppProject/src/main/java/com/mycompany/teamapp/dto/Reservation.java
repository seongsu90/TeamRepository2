package com.mycompany.teamapp.dto;

public class Reservation {

	private String rvtime;
	private int rvperson;
	private String rvmid;
	private int rvresid;
	private String rvresname;
	private String rvmname;
	
	public String getRvmname() {
		return rvmname;
	}
	public void setRvmname(String rvmname) {
		this.rvmname = rvmname;
	}
	
	public String getRvresname() {
		return rvresname;
	}
	public void setRvresname(String rvresname) {
		this.rvresname = rvresname;
	}
	
	public int getRvperson() {
		return rvperson;
	}
	public void setRvperson(int rvperson) {
		this.rvperson = rvperson;
	}
	public String getRvmid() {
		return rvmid;
	}
	public void setRvmid(String rvmid) {
		this.rvmid = rvmid;
	}
	public int getRvresid() {
		return rvresid;
	}
	public void setRvresid(int rvresid) {
		this.rvresid = rvresid;
	}
	public String getRvtime() {
		return rvtime;
	}
	public void setRvtime(String rvtime) {
		this.rvtime = rvtime;
	}

}
