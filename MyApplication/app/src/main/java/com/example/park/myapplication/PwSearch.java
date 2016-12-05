package com.example.park.myapplication;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class PwSearch extends AppCompatActivity {
    private Button btnpw1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pw_search);

        btnpw1 = (Button) findViewById(R.id.btnpw1);
        btnpw1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(PwSearch.this, PwModify.class);
                startActivity(intent);
            }
        });


    }
}
