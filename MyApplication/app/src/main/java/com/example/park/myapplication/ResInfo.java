package com.example.park.myapplication;

import android.app.TabActivity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.widget.TabHost;

public class ResInfo extends TabActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        TabHost mTab = getTabHost();

        LayoutInflater inflater = LayoutInflater.from(this);

        inflater.inflate(R.layout.activity_res_info, mTab.getTabContentView(),true);

        mTab.addTab(mTab.newTabSpec("tag").setIndicator("메뉴").setContent(R.id.tab1));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("위치").setContent(R.id.tab2));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("이벤트").setContent(R.id.tab3));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("리뷰").setContent(R.id.tab4));

        setContentView(R.layout.activity_res_info);
    }
}
