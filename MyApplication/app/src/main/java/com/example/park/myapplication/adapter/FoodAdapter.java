package com.example.park.myapplication.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.park.myapplication.R;
import com.example.park.myapplication.dto.Food;

import java.util.List;

/**
 * Created by Park on 2016-11-15.
 */

public class FoodAdapter extends BaseAdapter {
    private List<Food> foodList;

    public void setFoodList(List<Food> foodList) {
        this.foodList = foodList;
    }

    private Context context;
    private LayoutInflater layoutInflater;

    public FoodAdapter(Context context) {
        this.context = context;
        layoutInflater = layoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return foodList.size();
    }

    @Override
    public Object getItem(int position) {
        return foodList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if(convertView==null)
        {
            convertView = layoutInflater.inflate(R.layout.food_item,null);
        }
        Food food = foodList.get(position);

        ImageView foodimage = (ImageView) convertView.findViewById(R.id.foodimage);
        foodimage.setImageBitmap(food.getImage());

        TextView foodtitle = (TextView) convertView.findViewById(R.id.foodtitle);
        foodtitle.setText(food.getTitle());

        TextView foodprice = (TextView) convertView.findViewById(R.id.foodprice);
        foodprice.setText(food.getPrice());

        TextView foodcontent = (TextView)convertView.findViewById(R.id.foodcontent);
        foodcontent.setText(food.getContent());

        return convertView;
    }
}
