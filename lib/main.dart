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
  @override
  void initState() {
    super.initState();
  }

  //获取到插件与原生的交互通道  需要引入 import 'package:flutter/services.dart';
  static const jumpPlugin = const MethodChannel('com.jzhu.jump/plugin');
  Future<Null> _jumpToNative() async {
    String result = await jumpPlugin.invokeMethod('oneAct');

    print("获取来自oneact的数据=============="+result);
  }


  Future<Null> _jumpToNativeWithValue() async {

    Map<String, String> map = { "flutter": "这是一条来自flutter的参数" };
    String result = await jumpPlugin.invokeMethod('twoAct', map);

    print("获取来自twoact的数据=============="+result);
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(
          child: Text("跳转到oneActivity"),
          onTap: (){
            _jumpToNative();

          },
        ),
        GestureDetector(
          child:  Text("跳转到oneActivity"),
          onTap: (){
            _jumpToNativeWithValue();
          },
        )
      ],
    );
  }
}
