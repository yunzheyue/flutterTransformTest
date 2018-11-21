package com.example.flutterapp1

import android.os.Bundle
import android.util.Log

import io.flutter.app.FlutterActivity
import io.flutter.plugins.FlutterPluginCounter
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.FlutterPluginJumpToAct

class MainActivity(): FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

//    进行注册flutter跳转到native
    FlutterPluginJumpToAct.registerWith(this.registrarFor(FlutterPluginJumpToAct.CHANNEL))

    FlutterPluginCounter.registerWith(this.registrarFor(FlutterPluginCounter.CHANNEL))

    ThreeActivity.registerWith(this.registrarFor(ThreeActivity.CHANNEL))
  }
}
