package io.flutter.plugins;

import android.app.Activity;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

import java.util.concurrent.TimeUnit;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;

//原生主动发送数据给flutter
public class FlutterPluginCounter implements EventChannel.StreamHandler {

    public static String CHANNEL = "com.jzhu.counter/plugin";

    static EventChannel channel;

    private Activity activity;

    private FlutterPluginCounter(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new EventChannel(registrar.messenger(), CHANNEL);
        FlutterPluginCounter instance = new FlutterPluginCounter(registrar.activity());
        channel.setStreamHandler(instance);
    }

    /**
     * eventSink.success(aLong.intValue());
     * eventSink.error("计时器异常", "异常", e.getMessage());
     */



    private EventChannel.EventSink eventSink;
    private int count=0;
    private Handler handler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            eventSink.success((count++)+"");
            handler.sendEmptyMessageDelayed(1,1000);
        }
    };


    @Override
    public void onListen(Object o, final EventChannel.EventSink eventSink) {
        this.eventSink=eventSink;
        handler.sendEmptyMessageDelayed(1,1000);
    }

    @Override
    public void onCancel(Object o) {
        Log.i("FlutterPluginCounter", "FlutterPluginCounter:onCancel");
    }

}