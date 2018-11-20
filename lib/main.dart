import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      home: AddMessageScreen(),
    );
  }
}

class AddMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add message'),
      ),
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State {

  //获取到插件与原生的交互通道  需要引入 import 'package:flutter/services.dart';
  static const jumpPlugin = const MethodChannel('com.jzhu.jump/plugin');

  //这是获取到来自原生的数据
  static const counterPlugin = const EventChannel('com.jzhu.counter/plugin');
  StreamSubscription _counterSub;

  var _count="";

  @override
  void initState() {
    super.initState();
    _startCounterPlugin();
  }


  void _startCounterPlugin(){
    if(_counterSub == null){
//      第一个方法是正常返回的数据
      _counterSub =  counterPlugin.receiveBroadcastStream().listen(_onCounterEvent,onError: _onCounterError);
    }
  }

  void _onCounterEvent(Object event) {
    setState(() {
      _count = event;
    });
  }

  void _onCounterError(Object error) {
    setState(() {
      _count = "计时器异常";
      print(error);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if(_counterSub!=null){
      _counterSub.cancel();
    }
  }


  Future<Null> _jumpToNative() async {
    String result = await jumpPlugin.invokeMethod('oneAct');

    print("获取来自oneact的数据==============" + result);
  }

  Future<Null> _jumpToNativeWithValue() async {
    Map<String, String> map = {"flutter": "这是一条来自flutter的参数"};
    //这里填写的泛型参数  可以是map  也可以是jsonObject
    String result = await jumpPlugin.invokeMethod('twoAct', map);

    print("获取来自twoact的数据==============" + result);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(
          child: SizedBox(
            child: Align(
              child: Text(
                "跳转到oneActivity",
                style: TextStyle(),
              ),
              alignment: FractionalOffset(0.0, 0.5),
            ),
            height: 50,
          ),
          onTap: () {
            _jumpToNative();
          },
        ),
        GestureDetector(
          child: SizedBox(
            child:Align(child:  Text("跳转到oneActivity"),
            alignment: FractionalOffset(0.0, 0.5),),
            height: 50,
          ),
          onTap: () {
            _jumpToNativeWithValue();
          },
        ),
        SizedBox(
          child:Align(child:  Text("收到数据($_count)"),
            alignment: FractionalOffset(0.0, 0.5),),
          height: 50,
        ),

      ],
    );
  }
}
