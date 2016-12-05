package com.example.park.myapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.ConsoleMessage;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Join extends AppCompatActivity {
        private String location = null;
        private String detailLoc = null;
        private String inputYear = null;
        private String inputMonth = null;
        private String inputDay = null;
        private Button btnMidCheck;
        private Button btnPIN;
        private Button btnNext;
        private EditText mid;
        private EditText mpassword;
        private EditText mname;
        private EditText mphone;
        private String mbirth;
        private String mlocation;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_join);

        mid = (EditText)findViewById(R.id.editMid);
        mpassword = (EditText)findViewById(R.id.editMpassword);
        mname = (EditText)findViewById(R.id.editMname);
        mphone = (EditText)findViewById(R.id.editMphone);

        final int year=2016;
        ArrayList<String> years = new ArrayList<String>();
        for(int i=0;i<100;i++)
        {
            years.add(String.valueOf(year-i));
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

        final Spinner spinner = (Spinner) findViewById(R.id.btnspinner1);
        final Spinner spinnerLoc = (Spinner) findViewById(R.id.btnspinner2);
        final Spinner spinneryear = (Spinner) findViewById(R.id.spinneryear);
        final Spinner spinnermonth = (Spinner) findViewById(R.id.spinnermonth);
        final Spinner spinnerday = (Spinner) findViewById(R.id.spinnerday);

        ArrayAdapter extraAdapter = ArrayAdapter.createFromResource(this, R.array.location, android.R.layout.simple_spinner_dropdown_item);
        extraAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

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

        /*spinner.setAdapter(adapter_loc);*/
        spinner.setAdapter(extraAdapter);
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
                location = (String) spinner.getSelectedItem();
                switch (location)
                {
                    case "강원도":
                       // city= Arrays.copyOf(kangwon, kangwon.length);
                        ArrayAdapter extraAdapter2 = ArrayAdapter.createFromResource(Join.this, R.array.kangwon, android.R.layout.simple_spinner_dropdown_item);
                        extraAdapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerLoc.setAdapter(extraAdapter2);
                        spinnerLoc.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                        break;
                    case "경기도":
                        ArrayAdapter extraAdapter3 = ArrayAdapter.createFromResource(Join.this, R.array.gyeonggi, android.R.layout.simple_spinner_dropdown_item);
                        extraAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerLoc.setAdapter(extraAdapter3);
                        spinnerLoc.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                        break;
                    case "서울특별시":
                        ArrayAdapter extraAdapter4 = ArrayAdapter.createFromResource(Join.this, R.array.seoul, android.R.layout.simple_spinner_dropdown_item);
                        extraAdapter4.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerLoc.setAdapter(extraAdapter4);
                        spinnerLoc.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                        break;
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinnerLoc.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                detailLoc = (String) spinnerLoc.getSelectedItem();
                mlocation = location + " " + detailLoc;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });



        spinneryear.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                inputYear = (String) spinneryear.getSelectedItem();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinnermonth.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                inputMonth = (String) spinnermonth.getSelectedItem();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinnerday.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                inputDay = (String) spinnerday.getSelectedItem();
                mbirth = inputYear + "-" + inputMonth + "-" + inputDay;
                Log.i("mylog", mbirth);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
    }
}
