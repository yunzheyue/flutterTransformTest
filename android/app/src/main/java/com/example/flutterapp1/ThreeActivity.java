package com.example.flutterapp1;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

import java.nio.ByteBuffer;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.FlutterPluginCounter;

public class ThreeActivity extends Activity implements EventChannel.StreamHandler {

    private EventChannel.EventSink eventSink;

    public ThreeActivity() {
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_three);
    }


    public static String CHANNEL = "com.jzhu.counter/plugin2";

    static EventChannel channel;

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new EventChannel(registrar.messenger(), CHANNEL);
        ThreeActivity instance = new ThreeActivity();
        channel.setStreamHandler(instance);
        Log.e("TAG", "已经注册了");
    }


    @Override
    public void onListen(Object o, final EventChannel.EventSink eventSink) {
        this.eventSink = eventSink;
        Log.e("TAG", "回调成功");
        Log.e("TAG", "eventSink==="+eventSink);
    }

    @Override
    public void onCancel(Object o) {
        Log.i("FlutterPluginCounter", "FlutterPluginCounter:onCancel");
    }



//    下面的回调方法虽然是能够回调的 但是eventSink已经为null，
//     所以怎么在activity销毁的时候将数据传递给flutter是个问题
    @Override
    public void onBackPressed() {
        Log.e("TAG", "onBackPressed=="+eventSink);
        if(eventSink!=null){
            eventSink.success("i onBackPressed myself");
            Log.e("TAG", "onBackPressed");
        }
        super.onBackPressed();
    }


    @Override
    protected void onPause() {
        Log.e("TAG", "onPause"+eventSink);
        if(eventSink!=null){
            eventSink.success("i pause myself");
            Log.e("TAG", "pause");
        }
        super.onPause();
    }

    @Override
    protected void onStop() {
        Log.e("TAG", "onStop"+eventSink);
        if(eventSink!=null){
            eventSink.success("i stop myself");
            Log.e("TAG", "stop");
        }
        super.onStop();
    }

    @Override
    protected void onDestroy() {
        Log.e("TAG", "onDestroy=="+eventSink);
        if(eventSink!=null){
            eventSink.success("i destroy myself");
            Log.e("TAG", "destroy");
        }
        super.onDestroy();

    }
}
