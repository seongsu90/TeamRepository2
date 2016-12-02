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
        String[] kangwon = {"강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"};
        String[] gyeonggi = {"가평군", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시 분당구", "성남시 수정구", "성남시 중원구", "수원시 권선구", "수원시 영통구", "수원시 장안구", "수원시 팔달구", "시흥시", "안산시 단원구", "안산시 상록구", "안성시", "안양시 동안구", "안양시 만안구", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시 기흥구", "용인시 수지구", "용인시 처인구", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"};
        String[] seoul = {"강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"};
        String[] city=null;


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
        Spinner spinnerLoc = (Spinner) findViewById(R.id.btnspinner2);
        Spinner spinneryear = (Spinner) findViewById(R.id.spinneryear);
        Spinner spinnermonth = (Spinner) findViewById(R.id.spinnermonth);
        Spinner spinnerday = (Spinner) findViewById(R.id.spinnerday);


        ArrayAdapter<String> adapter_loc = new ArrayAdapter<String>(
                this,
                android.R.layout.simple_spinner_item,
                location
        );

        ArrayAdapter<String> adapter_detialLoc = new ArrayAdapter<String>(
                this,
                android.R.layout.simple_spinner_item,
                city
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
