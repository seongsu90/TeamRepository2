package com.example.park.myapplication;

import android.app.TabActivity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TabHost;

import com.example.park.myapplication.adapter.ResAdapter;
import com.example.park.myapplication.dto.Restaurant;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class MainFunction extends TabActivity {

    private ResAdapter resAdapter;
    private ListView resList;
    String location = "";
    String detailLoc = "";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        /*탭호스트 설정*/

        TabHost mTab = getTabHost();

        LayoutInflater inflater = LayoutInflater.from(this);

        inflater.inflate(R.layout.activity_main_function, mTab.getTabContentView(),true);


        mTab.addTab(mTab.newTabSpec("tag").setIndicator("식당목록").setContent(R.id.tab1));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("나의식당").setContent(R.id.tab2));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("이벤트").setContent(R.id.tab3));
        mTab.addTab(mTab.newTabSpec("tag").setIndicator("회원정보").setContent(R.id.tab4));

        /*스피너 설정*/
        final Spinner spinnerLoc = (Spinner) findViewById(R.id.spinnerLoc);
        final Spinner spinnerDetailLoc = (Spinner) findViewById(R.id.spinnerDetailLoc);

        ArrayAdapter extraAdapter = ArrayAdapter.createFromResource(this, R.array.location, android.R.layout.simple_spinner_dropdown_item);
        extraAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        spinnerLoc.setAdapter(extraAdapter);
        spinnerLoc.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);

        spinnerLoc.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                location = (String) spinnerLoc.getSelectedItem();
                switch (location) {
                    case "강원도":
                        // city= Arrays.copyOf(kangwon, kangwon.length);
                        ArrayAdapter extraAdapter2 = ArrayAdapter.createFromResource(MainFunction.this, R.array.kangwon, android.R.layout.simple_spinner_dropdown_item);
                        extraAdapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerDetailLoc.setAdapter(extraAdapter2);
                        spinnerDetailLoc.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                        break;
                    case "경기도":
                        ArrayAdapter extraAdapter3 = ArrayAdapter.createFromResource(MainFunction.this, R.array.gyeonggi, android.R.layout.simple_spinner_dropdown_item);
                        extraAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerDetailLoc.setAdapter(extraAdapter3);
                        spinnerDetailLoc.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                        break;
                    case "서울특별시":
                        ArrayAdapter extraAdapter4 = ArrayAdapter.createFromResource(MainFunction.this, R.array.seoul, android.R.layout.simple_spinner_dropdown_item);
                        extraAdapter4.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerDetailLoc.setAdapter(extraAdapter4);
                        spinnerDetailLoc.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
                        break;
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinnerDetailLoc.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                detailLoc = (String) spinnerDetailLoc.getSelectedItem();
                String resultLoc = location + " " + detailLoc;
                resultLoc = resultLoc.trim();

                fillItems(resultLoc);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });



        /*식당 리스트 설정*/
        resList = (ListView)findViewById(R.id.resList);

        /*리스트뷰 아이템 클릭*/
        resList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
               final Restaurant restaurant = (Restaurant) resAdapter.getItem(position);
                Restaurant res = null;
                Log.i("mylog","리스트뷰클릭"+restaurant.getResid());
                int resid = restaurant.getResid();
                res = startResinfo(resid);
                Log.i("mylog",res.getResopen());
                Intent intent = new Intent(MainFunction.this,ResInfo.class);
                intent.putExtra("resname",res.getResname());
                Log.i("mylog",res.getReslocation());
                intent.putExtra("reslocation",res.getReslocation());
                intent.putExtra("resinfo",res.getResinfo());
                intent.putExtra("restel",res.getRestel());
                Log.i("mylog",res.getRestel());
                intent.putExtra("rescloseday",res.getRescloseday());
                intent.putExtra("resopen",res.getResopen());
                intent.putExtra("resclose",res.getResclose());
                startActivity(intent);
            }
        });

        /*회원정보 리스트 설정*/
        ArrayAdapter<CharSequence> infoAdapter;
        infoAdapter = ArrayAdapter.createFromResource(this, R.array.info, R.layout.infoitem);

        ListView infoList = (ListView) findViewById(R.id.infoList);
        infoList.setAdapter(infoAdapter);
        infoList.setDivider(new ColorDrawable(Color.WHITE));
        infoList.setDividerHeight(1);
        infoList.setChoiceMode(ListView.CHOICE_MODE_SINGLE);

    }

    public Restaurant startResinfo(int resid)
    {
        AsyncTask<Integer,Void,Restaurant> asyncTask = new AsyncTask<Integer, Void, Restaurant>() {
            @Override
            protected Restaurant doInBackground(Integer... params) {
                Restaurant res = new Restaurant();
                try {
                    URL url= new URL("http://192.168.0.120:8080/teamapp/info?resid="+URLEncoder.encode(String.valueOf(params[0]),"utf-8"));
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.connect();

                    if (conn.getResponseCode() == HttpURLConnection.HTTP_OK){
                        InputStream is = conn.getInputStream();
                        Reader reader = new InputStreamReader(is);
                        BufferedReader br = new BufferedReader(reader);
                        String strJson = "";

                        while (true) {
                            String data = br.readLine();
                            if (data == null) {//* 더 이상 데이터가 없을 때, 마지막 라인을 읽은 후 *//*
                                break;
                            }
                            strJson += data;
                        }
                        Log.i("mylog",strJson);
                        br.close();
                        reader.close();
                        is.close();

                        res =parseJson2(strJson);
                    }
                    conn.disconnect();
                }catch (Exception e){
                    Log.i("mylog",e.getMessage());
                }
                return res;
            }

            @Override
            protected void onPostExecute(List<Restaurant> restaurants) {
                resAdapter = new ResAdapter(MainFunction.this);
                resAdapter.setList(restaurants);
                resList.setAdapter(resAdapter);
            }
        };
        asyncTask.execute(resid);

    }

    public void fillItems(String resultLo)
    {
        AsyncTask<String,Void,List<Restaurant>> asyncTask = new AsyncTask<String, Void, List<Restaurant>>() {

            @Override
            protected List<Restaurant> doInBackground(String... params) {
                //List<Restaurant> list = null;
                List<Restaurant> list = new ArrayList<Restaurant>();
                try {
                    URL url= new URL("http://192.168.0.120:8080/teamapp/reslist?mreslocaion="+ URLEncoder.encode(params[0],"utf-8"));
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.connect();

                    if (conn.getResponseCode() == HttpURLConnection.HTTP_OK){
                        InputStream is = conn.getInputStream();
                        Reader reader = new InputStreamReader(is);
                        BufferedReader br = new BufferedReader(reader);
                        String strJson = "";

                        while (true) {
                            String data = br.readLine();
                            if (data == null) {//* 더 이상 데이터가 없을 때, 마지막 라인을 읽은 후 *//*
                                break;
                            }
                            strJson += data;
                        }
                        Log.i("mylog",strJson);
                        br.close();
                        reader.close();
                        is.close();

                        list = parseJson(strJson);
                    }
                    conn.disconnect();
                }catch (Exception e){
                    Log.i("mylog",e.getMessage());
                }
                return list;
            }

            @Override
            protected void onPostExecute(List<Restaurant> restaurants) {
               resAdapter = new ResAdapter(MainFunction.this);
                resAdapter.setList(restaurants);
                resList.setAdapter(resAdapter);
            }
        };
        asyncTask.execute(resultLo);
    }

    public List<Restaurant> parseJson(String strJson) {

        List<Restaurant> list = new ArrayList<>();
        try {
            JSONArray jsonArray = new JSONArray(strJson);
            for (int i=0; i<jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                Restaurant res = new Restaurant();
                res.setResImage(getBitmap(jsonObject.getString("resImage")));
                res.setResTitle(jsonObject.getString("resTitle"));
                res.setResContent(jsonObject.getString("resContent"));
                res.setResid(jsonObject.getInt("resid"));

                list.add(res);

                Log.i("myLog",list.get(0).getResTitle());
            }
        } catch (JSONException e) {
            Log.i("mylog", e.getMessage());
        }
        return list;
    }

    public Restaurant parseJson2(String strJson) {
        Restaurant res = new Restaurant();
        try {
            JSONArray jsonArray = new JSONArray(strJson);
            for (int i=0; i<jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                res.setResImage(getBitmap(jsonObject.getString("resImage")));

                res.setResid(jsonObject.getInt("resid"));
                res.setResname(jsonObject.getString("resname"));
                res.setReslocation(jsonObject.getString("reslocation"));
                res.setRestotaltable(jsonObject.getInt("restotaltable"));
                res.setResinfo(jsonObject.getString("resinfo"));
                res.setRestel(jsonObject.getString("restel"));
                res.setRescloseday(jsonObject.getString("rescloseday"));
                res.setResopen(jsonObject.getString("resopen"));
                res.setResclose(jsonObject.getString("resclose"));
            }
        } catch (JSONException e) {
            Log.i("mylog", e.getMessage());
        }
        return res;
    }

    public Bitmap getBitmap(String fileName){
        Bitmap bitmap= null;
        try {
            URL url = new URL("http://192.168.0.120:8080/teamapp/restaurant/showPhoto?ressavedfile="+fileName);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.connect();

            if(conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                InputStream is = conn.getInputStream();
                bitmap = BitmapFactory.decodeStream(is);
            }
            conn.disconnect();
        } catch (Exception e) {
            Log.i("mylog", e.getMessage());
        }
        return bitmap;
    }
}