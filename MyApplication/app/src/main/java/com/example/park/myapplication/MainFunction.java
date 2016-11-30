package com.example.park.myapplication;

import android.app.TabActivity;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TabHost;

public class MainFunction extends TabActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        TabHost mTab = getTabHost();

        LayoutInflater inflater = LayoutInflater.from(this);

        inflater.inflate(R.layout.activity_main_function, mTab.getTabContentView(),true);


        mTab.addTab(mTab.newTabSpec("tag").setIndicator("식당목록").setContent(R.id.tab1));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("나의식당").setContent(R.id.tab2));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("이벤트").setContent(R.id.tab3));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("회원정보").setContent(R.id.tab4));

        ArrayAdapter<CharSequence> infoAdapter;
        infoAdapter = ArrayAdapter.createFromResource(this, R.array.info, R.layout.infoitem);

        ListView infoList = (ListView) findViewById(R.id.infoList);
        infoList.setAdapter(infoAdapter);
        infoList.setDivider(new ColorDrawable(Color.WHITE));
        infoList.setDividerHeight(1);
        infoList.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
    }
}
