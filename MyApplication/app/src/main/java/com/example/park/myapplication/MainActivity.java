package com.example.park.myapplication;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.Button;


public class MainActivity extends AppCompatActivity {

    private Button btnIDsearch;
    private Button btnPwSearch;
    private Button btnJoin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        supportRequestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnIDsearch = (Button) findViewById(R.id.btnIDsearch);
        btnIDsearch.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this,IdSearch.class);
                startActivity(intent);
            }
        });

        btnPwSearch = (Button) findViewById(R.id.btnPwSearch);
        btnPwSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, PwSearch.class);
                startActivity(intent);
            }
        });

        btnJoin =(Button)findViewById(R.id.btnJoin);
        btnJoin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, Join.class);
                startActivity(intent);
            }
        });

    }
}
