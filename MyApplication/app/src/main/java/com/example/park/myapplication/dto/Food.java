package com.example.park.myapplication.dto;

import android.graphics.Bitmap;

/**
 * Created by Park on 2016-11-15.
 */

public class Food {
    private Bitmap image;
    private Bitmap imageLarge;
    private String imageLargeFileName;
    private String title;
    private String content;
    private String price;


    public Bitmap getImage() {
        return image;
    }

    public void setImage(Bitmap image) {
        this.image = image;
    }

    public Bitmap getImageLarge() {
        return imageLarge;
    }

    public void setImageLarge(Bitmap imageLarge) {
        this.imageLarge = imageLarge;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getImageLargeFileName() {
        return imageLargeFileName;
    }

    public void setImageLargeFileName(String imageLargeFileName) {
        this.imageLargeFileName = imageLargeFileName;
    }
}
