package com.example.park.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
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
import android.widget.Toast;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
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
    private boolean validation_signal = false;

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
                mbirth = inputYear + "-" + inputMonth + "-" + inputDay;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinnermonth.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                inputMonth = (String) spinnermonth.getSelectedItem();
                mbirth = inputYear + "-" + inputMonth + "-" + inputDay;
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
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        btnMidCheck =(Button)findViewById(R.id.btnMidCheck);
        btnMidCheck.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = mid.getText().toString();
                id_validation_check(id);
            }
        });

        btnPIN = (Button) findViewById(R.id.btnPIN);
        btnPIN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Join.this,MainFunction.class);
                startActivity(intent);
            }
        });

        btnNext = (Button) findViewById(R.id.btnNext);
        btnNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = mid.getText().toString();
                String password = mpassword.getText().toString();
                String name = mname.getText().toString();
                String phone = mphone.getText().toString();
                String birth = mbirth;
                String inputLocation = mlocation;
                join(id, password, name, phone, birth, inputLocation);
            }
        });

    }

    /* 아이디 중복 체크 */
    public void id_validation_check(String id) {
        AsyncTask<String, Void, String> asyncTask = new AsyncTask<String, Void, String>() {
            @Override
            protected String doInBackground(String... params) {
                String id = params[0];
                String result = "";

                try {
                    URL url = new URL("http://192.168.0.29:8080/teamapp/validationCheck");

                    JSONObject body = new JSONObject();
                    body.put("mid", id);

                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setReadTimeout(15000);
                    conn.setConnectTimeout(15000);
                    conn.setRequestMethod("POST");
                    conn.setDoInput(true);
                    conn.setDoOutput(true);

                    OutputStream os = conn.getOutputStream();
                    OutputStreamWriter osw = new OutputStreamWriter(os, "UTF-8");
                    BufferedWriter writer = new BufferedWriter(osw);
                    writer.write(getPostDataString(body));
                    writer.flush();
                    writer.close();

                    if (conn.getResponseCode() == HttpURLConnection.HTTP_OK){
                        InputStreamReader isp = new InputStreamReader(conn.getInputStream());
                        BufferedReader br = new BufferedReader(isp);
                        String strJson = "";

                        while (true) {
                            String data = br.readLine();
                            if (data == null) break;
                            strJson  += data;
                        }

                        JSONObject jsonObject = new JSONObject(strJson);
                        result = jsonObject.getString("result");

                        br.close();
                        isp.close();
                    }

                } catch (Exception e) {
                    Log.i("mylog", e.getMessage());
                }

                return result;
            }

            @Override
            protected void onPostExecute(String result) {
                super.onPostExecute(result);

                if (result.equals("possible")){
                    validation_signal = true;
                    Toast.makeText(getApplicationContext(),"아이디 사용 가능", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(getApplicationContext(),"아이디가 존재합니다.\n다른 아이디를 입력해 주세요",Toast.LENGTH_SHORT).show();
                }
            }

        };

        asyncTask.execute(id);

    }

    /* Join 실행 */
    public void join(String id, String password, String name, String phone, String birth, String inputLocation) {
        AsyncTask<String, Void, String> asyncTask = new AsyncTask<String, Void, String>() {
            @Override
            protected String doInBackground(String... params) {
                String id = params[0];
                String password = params[1];
                String name = params[2];
                String phone = params[3];
                String birth = params[4];
                String inputLocation = params[5];
                String result = "";

                try {
                    URL url = new URL("http://192.168.0.29:8080/teamapp/join");

                    JSONObject body = new JSONObject();
                    body.put("mid", id);
                    body.put("mpassword", password);
                    body.put("mname", name);
                    body.put("mphone", phone);
                    body.put("mbirth", birth);
                    body.put("mlocation", inputLocation);

                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setReadTimeout(15000);
                    conn.setConnectTimeout(15000);
                    conn.setRequestMethod("POST");
                    conn.setDoInput(true);
                    conn.setDoOutput(true);

                    OutputStream os = conn.getOutputStream();
                    OutputStreamWriter osw = new OutputStreamWriter(os, "UTF-8");
                    BufferedWriter writer = new BufferedWriter(osw);
                    writer.write(getPostDataString(body));
                    writer.flush();
                    writer.close();

                    if (conn.getResponseCode() == HttpURLConnection.HTTP_OK){
                        InputStreamReader isp = new InputStreamReader(conn.getInputStream());
                        BufferedReader br = new BufferedReader(isp);
                        String strJson = "";

                        while (true) {
                            String data = br.readLine();
                            if (data == null) break;
                            strJson  += data;
                        }

                        JSONObject jsonObject = new JSONObject(strJson);
                        result = jsonObject.getString("result");

                        br.close();
                        isp.close();
                    }

                } catch (Exception e) {
                    Log.i("mylog", e.getMessage());
                }

                return result;
            }

            @Override
            protected void onPostExecute(String result) {
                super.onPostExecute(result);

                if (result.equals("success")){
                    Toast.makeText(getApplicationContext(),"가입 완료", Toast.LENGTH_SHORT).show();
                    Intent intent = new Intent(Join.this, MainActivity.class);
                    startActivity(intent);
                } else if ( validation_signal == false || result.equals("validation")){
                    Toast.makeText(getApplicationContext(),"아이디 중복체크를 해주세요",Toast.LENGTH_SHORT).show();
                } else if(result.equals("toomany")){
                    Toast.makeText(getApplicationContext(),"20글자 이하의 id, password를 입력하세요",Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(getApplicationContext(),"모든 항목을 입력해 주세요",Toast.LENGTH_SHORT).show();
                }
            }

        };

        asyncTask.execute(id, password, name, phone, birth, inputLocation);

    }

    public String getPostDataString(JSONObject params) throws Exception {
        StringBuilder result = new StringBuilder();
        boolean first = true;

        Iterator<String> itr = params.keys();

        while(itr.hasNext()){

            String key= itr.next();
            Object value = params.get(key);

            if (first)
                first = false;
            else
                result.append("&");

            result.append(URLEncoder.encode(key, "UTF-8"));
            result.append("=");
            result.append(URLEncoder.encode(value.toString(), "UTF-8"));

        }

        return result.toString();
    }



}
