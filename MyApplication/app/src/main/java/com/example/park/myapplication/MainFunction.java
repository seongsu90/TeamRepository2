package com.example.park.myapplication;

import android.app.TabActivity;
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
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
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
import java.util.ArrayList;
import java.util.List;

public class MainFunction extends TabActivity {

    private ResAdapter resAdapter;
    private ListView resList;

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


        /*식당 리스트 설정*/
        resList = (ListView)findViewById(R.id.resList);


       /* fillItems();*/



        /*회원정보 리스트 설정*/
        ArrayAdapter<CharSequence> infoAdapter;
        infoAdapter = ArrayAdapter.createFromResource(this, R.array.info, R.layout.infoitem);

        ListView infoList = (ListView) findViewById(R.id.infoList);
        infoList.setAdapter(infoAdapter);
        infoList.setDivider(new ColorDrawable(Color.WHITE));
        infoList.setDividerHeight(1);
        infoList.setChoiceMode(ListView.CHOICE_MODE_SINGLE);

    }

    public void fillItems()
    {
        AsyncTask<Void,Void,List<Restaurant>> asyncTask = new AsyncTask<Void, Void, List<Restaurant>>() {

            @Override
            protected List<Restaurant> doInBackground(Void... params) {
                List<Restaurant> list = null;
                try {
                    URL url= new URL("http://192.168.0.120:8080/teamapp/reslist");
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
        asyncTask.execute();
    }

    public List<Restaurant> parseJson(String strJson) {

        List<Restaurant> list = new ArrayList<>();
        try {
            JSONArray jsonArray = new JSONArray(strJson);
            for (int i=0; i<jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                Restaurant res = new Restaurant();
                res.setImage(getBitmap(jsonObject.getString("resImage")));
                res.setTitle(jsonObject.getString("resTitle"));
                res.setContent(jsonObject.getString("resContent"));

                list.add(res);

                Log.i("myLog",list.get(0).getTitle());
            }
        } catch (JSONException e) {
            Log.i("mylog", e.getMessage());
        }
        return list;
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
