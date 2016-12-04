package com.example.park.myapplication.adapter;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.park.myapplication.MainFunction;
import com.example.park.myapplication.R;
import com.example.park.myapplication.ResInfo;
import com.example.park.myapplication.dto.Restaurant;

import java.util.List;

import static com.example.park.myapplication.R.id.tab1;

public class ResAdapter extends BaseAdapter {
    private List<Restaurant> list;
    private Button btnresInfo;

    public void setList(List<Restaurant> list) {
        this.list = list;
    }



    private Context context; //범용적으로 생성자주입을 이용하기위해(원래는 mainactivity를 사용한다.) context 사용 // 쉽게 생각하면 Activity라고 보면 된다
    private LayoutInflater layoutInflater;

    public ResAdapter(Context context){
        this.context = context;
        layoutInflater = LayoutInflater.from(context);
    }
    @Override
    public int getCount() {
        return list.size();
    }

    @Override
    public Object getItem(int position) {
        return list.get(position);
    }

    @Override
    public long getItemId(int position) { // 아이템의 id 를 리턴 혹여나 객체에 id가 없으면 리스트 인덱스수(position)를 리턴 // 결론은 position을 리턴하는 이유가 인덱스가 식별번호가 된다.
        return position;
        //board 객체의 경우 return list.get(position).getbno();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if(convertView==null)
        {
            //inplation
            convertView = layoutInflater.inflate(R.layout.res_item ,null);
        }
        //data setting
        Restaurant restaurant = list.get(position);

        TextView resTitle = (TextView) convertView.findViewById(R.id.resTitle);
        resTitle.setText(restaurant.getResTitle());

        TextView resContent = (TextView) convertView.findViewById(R.id.resContent);
        resContent.setText(restaurant.getResContent());

        ImageView resImage = (ImageView) convertView.findViewById(R.id.resImage);
        resImage.setImageBitmap(restaurant.getResImage());

        return convertView;
    }
}
