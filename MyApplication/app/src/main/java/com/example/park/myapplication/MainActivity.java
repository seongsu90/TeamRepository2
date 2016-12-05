package com.example.park.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
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
import java.util.Iterator;


public class MainActivity extends AppCompatActivity {

    private Button btnIDsearch;
    private Button btnPwSearch;
    private Button btnJoin;
    private Button btnGuest;
    private Button btnLogin;
    private EditText mid;
    private EditText mpassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        supportRequestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mid = (EditText)findViewById(R.id.editMid);
        mpassword = (EditText)findViewById(R.id.editMpassword);

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
                Intent intent = new Intent(MainActivity.this,MainFunction.class);
                startActivity(intent);
            }
        });

        btnLogin = (Button) findViewById(R.id.btnLogin);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = mid.getText().toString();
                String password = mpassword.getText().toString();
                Login(id, password);
            }
        });

    }

    public void Login(String id, String password) {
        //Log.i("mylog", "Login : " + id + " " + password);
        AsyncTask<String, Void, String> asyncTask = new AsyncTask<String, Void, String>() {
            @Override
            protected String doInBackground(String... params) {
                //Log.i("mylog", "Login & AsyncTask 실행");
                String id = params[0];
                String password = params[1];
                String result = "";

                try {
                    URL url = new URL("http://192.168.0.29:8080/teamapp/login");

                    JSONObject body = new JSONObject();
                    body.put("mid", id);
                    body.put("mpassword", password);

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
                    Toast.makeText(getApplicationContext(),"로그인 성공", Toast.LENGTH_SHORT).show();
                    SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
                    SharedPreferences.Editor editor = pref.edit();
                    editor.putString("login", mid.getText().toString());
                    editor.commit();

                    Intent intent = new Intent(MainActivity.this, MainFunction.class);
                    startActivity(intent);
                } else {
                    Toast.makeText(getApplicationContext(),"로그인 실패",Toast.LENGTH_SHORT).show();
                }
            }

        };

        asyncTask.execute(id, password);

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
