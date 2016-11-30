package com.example.park.myapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.ConsoleMessage;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class Join extends AppCompatActivity {

    String[] location = {"강원도","경기도","서울특별시"};



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_join);

        int year=1920;
        ArrayList<String> years = new ArrayList<String>();
        for(int i=0;i<100;i++)
        {
            years.add(String.valueOf(year+i));
        }

        int month = 1;
        ArrayList<String> months = new ArrayList<String>();
        for(int i=0;i<12;i++)
        {
            months.add(String.valueOf(month));
            month++;
        }

        int day=1;
        ArrayList<String> days = new ArrayList<String>();
        for(int i=0;i<31;i++)
        {
            days.add(String.valueOf(day));
            day++;
        }

        Spinner spinner = (Spinner) findViewById(R.id.btnspinner1);
        Spinner spinneryear = (Spinner) findViewById(R.id.spinneryear);
        Spinner spinnermonth = (Spinner) findViewById(R.id.spinnermonth);
        Spinner spinnerday = (Spinner) findViewById(R.id.spinnerday);

        ArrayAdapter<String> adapter_loc = new ArrayAdapter<String>(
                this,
                android.R.layout.simple_spinner_item,
                location
        );

        ArrayAdapter<String> adapter_year = new ArrayAdapter<String>(
                this,
                android.R.layout.simple_spinner_item,
                years
        );

        ArrayAdapter<String> adapter_month = new ArrayAdapter<String>(
                this,
                android.R.layout.simple_spinner_item,
                months
        );

        ArrayAdapter<String> adapter_day = new ArrayAdapter<String>(
                this,
                android.R.layout.simple_spinner_item,
                days
        );

        spinner.setAdapter(adapter_loc);
        spinner.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        spinneryear.setAdapter(adapter_year);
        spinneryear.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        spinnermonth.setAdapter(adapter_month);
        spinnermonth.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        spinnerday.setAdapter(adapter_day);
        spinnerday.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);

        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinneryear.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinnermonth.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinnerday.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }
}
