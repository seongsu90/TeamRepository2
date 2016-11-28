package com.mycompany.teamapp.dto;

public class Pos {
	private int ptableno;
	private int presid;
	private String pmlname;
	private int pcount;
	
	private String[] tempmenu;	
	private int[] tempcount;

	
	public String[] getTempmenu() {
		return tempmenu;
	}
	public void setTempmenu(String[] tempmenu) {
		this.tempmenu = tempmenu;
	}
	public int[] getTempcount() {
		return tempcount;
	}
	public void setTempcount(int[] tempcount) {
		this.tempcount = tempcount;
	}
	public int getPtableno() {
		return ptableno;
	}
	public void setPtableno(int ptableno) {
		this.ptableno = ptableno;
	}
	public int getPresid() {
		return presid;
	}
	public void setPresid(int presid) {
		this.presid = presid;
	}
	public String getPmlname() {
		return pmlname;
	}
	public void setPmlname(String pmlname) {
		this.pmlname = pmlname;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
}
