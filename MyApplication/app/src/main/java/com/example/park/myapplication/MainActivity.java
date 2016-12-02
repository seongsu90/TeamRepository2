package com.example.park.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;


public class MainActivity extends AppCompatActivity {

    private Button btnIDsearch;
    private Button btnPwSearch;
    private Button btnJoin;
    private Button btnGuest;
    private EditText mid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        supportRequestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mid = (EditText)findViewById(R.id.editMid);

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

        btnGuest = (Button) findViewById(R.id.btnGuest);
        btnGuest.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = mid.getText().toString();

                Log.i("mylog", id);

                SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
                SharedPreferences.Editor editor = pref.edit();
                editor.putString("hi", ""+id);
                editor.commit();

                Intent intent = new Intent(MainActivity.this,MainFunction.class);
                startActivity(intent);
            }
        });







    }
}
