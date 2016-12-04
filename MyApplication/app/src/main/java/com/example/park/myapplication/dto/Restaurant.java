package com.example.park.myapplication.dto;

import android.graphics.Bitmap;

/**
 * Created by Park on 2016-11-15.
 */

public class Restaurant {
    private Bitmap resImage;
    private String resTitle;
    private String resContent;
    private int resid;
    private String resname;
    private String reslocation;
    private int restotaltable;
    private String resinfo;
    private String restel;
    private String rescloseday;
    private String resopen;
    private String resclose;
    private String[] closeday;

    public String getResname() {
        return resname;
    }

    public void setResname(String resname) {
        this.resname = resname;
    }

    public String getReslocation() {
        return reslocation;
    }

    public void setReslocation(String reslocation) {
        this.reslocation = reslocation;
    }

    public int getRestotaltable() {
        return restotaltable;
    }

    public void setRestotaltable(int restotaltable) {
        this.restotaltable = restotaltable;
    }

    public String getResinfo() {
        return resinfo;
    }

    public void setResinfo(String resinfo) {
        this.resinfo = resinfo;
    }

    public String getRestel() {
        return restel;
    }

    public void setRestel(String restel) {
        this.restel = restel;
    }

    public String getRescloseday() {
        return rescloseday;
    }

    public void setRescloseday(String rescloseday) {
        this.rescloseday = rescloseday;
    }

    public String getResopen() {
        return resopen;
    }

    public void setResopen(String resopen) {
        this.resopen = resopen;
    }

    public String getResclose() {
        return resclose;
    }

    public void setResclose(String resclose) {
        this.resclose = resclose;
    }


    public String[] getCloseday() {
        return closeday;
    }

    public void setCloseday(String[] closeday) {
        this.closeday = closeday;
    }

    public int getResid() {
        return resid;
    }

    public void setResid(int resid) {
        this.resid = resid;
    }

    public Bitmap getResImage() {
        return resImage;
    }

    public void setResImage(Bitmap resImage) {
        this.resImage = resImage;
    }

    public String getResTitle() {
        return resTitle;
    }

    public void setResTitle(String resTitle) {
        this.resTitle = resTitle;
    }

    public String getResContent() {
        return resContent;
    }

    public void setResContent(String resContent) {
        this.resContent = resContent;
    }
}
