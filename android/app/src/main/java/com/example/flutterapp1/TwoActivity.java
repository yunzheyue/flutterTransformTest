package com.example.flutterapp1;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class TwoActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_two);

        String test = getIntent().getStringExtra("Test");

        TextView tv_test = findViewById(R.id.tv_test);
        tv_test.setText("来自fluttter的数据=====" + test);


    }
}
