package com.mycompany.teamapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class MenuList {
	private String mlname;
	private int mlprice;
	private int mlresid;
	private String mlinfo;
	private String mlsavedfile;
	private boolean mlishot;
	
	private MultipartFile mlphoto;
	private String mlmime;
	private String mloriginfile;
	
	public MultipartFile getMlphoto() {
		return mlphoto;
	}
	public void setMlphoto(MultipartFile mlphoto) {
		this.mlphoto = mlphoto;
	}
	public String getMlmime() {
		return mlmime;
	}
	public void setMlmime(String mlmime) {
		this.mlmime = mlmime;
	}
	public String getMloriginfile() {
		return mloriginfile;
	}
	public void setMloriginfile(String mloriginfile) {
		this.mloriginfile = mloriginfile;
	}
	public String getMlname() {
		return mlname;
	}
	public void setMlname(String mlname) {
		this.mlname = mlname;
	}
	public int getMlprice() {
		return mlprice;
	}
	public void setMlprice(int mlprice) {
		this.mlprice = mlprice;
	}
	public int getMlresid() {
		return mlresid;
	}
	public void setMlresid(int mlresid) {
		this.mlresid = mlresid;
	}
	public String getMlinfo() {
		return mlinfo;
	}
	public void setMlinfo(String mlinfo) {
		this.mlinfo = mlinfo;
	}
	public String getMlsavedfile() {
		return mlsavedfile;
	}
	public void setMlsavedfile(String mlsavedfile) {
		this.mlsavedfile = mlsavedfile;
	}
	public boolean getMlishot() {
		return mlishot;
	}
	public void setMlishot(boolean mlishot) {
		this.mlishot = mlishot;
	}
	
	
	
	
}
