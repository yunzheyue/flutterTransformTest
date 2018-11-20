package io.flutter.plugins;

import android.app.Activity;
import android.content.Intent;

import com.example.flutterapp1.OneActivity;
import com.example.flutterapp1.ThreeActivity;
import com.example.flutterapp1.TwoActivity;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterPluginJumpToAct implements MethodChannel.MethodCallHandler {

    public static String CHANNEL = "com.jzhu.jump/plugin";

    static MethodChannel channel;

    private Activity activity;

    private FlutterPluginJumpToAct(Activity activity) {
        this.activity = activity;
    }

    //    进行注册
    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterPluginJumpToAct instance = new FlutterPluginJumpToAct(registrar.activity());
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance);
    }

    //    调用后进行方法回调
    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {

        //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务，本案例做了2个跳转的业务
        //接收来自flutter的指令oneAct
        if (call.method.equals("oneAct")) {
            //跳转到指定Activity
            Intent intent = new Intent(activity, OneActivity.class);
            activity.startActivity(intent);
            //返回给flutter的参数
            result.success("success");

        }
        //接收来自flutter的指令twoAct
        else if (call.method.equals("twoAct")) {
//            这是获取到的来自flutter的值
            String text = call.argument("flutter");
            //带参数跳转到指定Activity
            Intent intent = new Intent(activity, TwoActivity.class);
            intent.putExtra("Test", text);
            activity.startActivity(intent);
            //返回给flutter的参数
            result.success("success");
        } else if(call.method.equals("threeAct")) {
            //跳转到指定Activity
            Intent intent = new Intent(activity, ThreeActivity.class);
            activity.startActivity(intent);
            //返回给flutter的参数
            result.success("success");
        } else{
            result.notImplemented();
        }
    }
}




