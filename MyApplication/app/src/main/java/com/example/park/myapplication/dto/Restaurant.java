package com.example.park.myapplication.dto;

import android.graphics.Bitmap;

/**
 * Created by Park on 2016-11-15.
 */

public class Restaurant {
    private Bitmap resImage;
    private String resTitle;
    private String resContent;

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
