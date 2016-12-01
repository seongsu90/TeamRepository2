package com.example.park.myapplication.dto;

import android.graphics.Bitmap;

/**
 * Created by Park on 2016-11-15.
 */

public class Restaurant {
    private Bitmap image;
    private String title;
    private String content;


    public Bitmap getImage() {
        return image;
    }

    public void setImage(Bitmap image) {
        this.image = image;
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

}
