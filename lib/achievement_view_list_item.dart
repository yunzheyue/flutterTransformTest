import 'package:flutter/material.dart';

// 创建类，成就目标
class Target {
  // 常量，构建函数
  const Target(
      {
      // 自变量，目标名称
      this.name,
      // 自变量，目标奖励
      this.reward});

  // 最终值，成就目标名称
  final String name;

  // 最终值，成就目标奖励
  final String reward;
}

// 定义数据类型，目标改变回调
typedef void TargetChangedCallback(
    // 类型参数，目标
    Target target,
    // 类型参数，是否新目标
    bool nowTarget);

// 创建类，成就视图列表项目，继承StatelessWidget（无状态的控件）
class AchievementViewItem extends StatelessWidget {
  // 构造函数
  AchievementViewItem(
      {
      // 目标参数，传递目标
      Target target,
      // 自变量，是否新目标
      this.nowTarget,
      // 自变量，对目标的改变
      this.onTargetChanged})
      :
        // 接收传递的目标
        target = target,
        // 调用父类
        super(
            /*
       * 控件和元素的标识符：
       *  将其对象的标识用作其值
       *  用于将控件的标识绑定到用于生成该控件的对象的标识
       */
            key: new ObjectKey(target));

  // 类成员，存储目标
  final Target target;

  // 类成员，存储是否新目标
  final bool nowTarget;

  // 类成员，对目标的改变
  final TargetChangedCallback onTargetChanged;

  // 类函数，获得颜色
  Color _getColor(BuildContext context) {
    /*
     *  是否新目标
     *    是：返回灰色
     *    否：返回主题的背景色
     */
    return nowTarget ? Colors.black54 : Theme.of(context).primaryColor;
  }

  // 类函数，获得文本样式
  TextStyle _getNameTextStyle(BuildContext context) {
    // 如果不是新目标，返回文本样式控件
    if (!nowTarget)
      return new TextStyle(
        // 绘制文本的大小：16.0
        fontSize: 16.0,
        // 绘制文本时使用的颜色：黑色
        color: Colors.black,
        // 绘制文本时加粗字体
        fontWeight: FontWeight.bold,
      );
    // 返回文本样式控件
    return new TextStyle(
      fontSize: 16.0,
      // 绘制文本时使用的颜色：灰色
      color: Colors.black54,
      // 绘制文本时加粗字体
      fontWeight: FontWeight.bold,
      // 在文本附近绘制的装饰：文本中绘制一条横线
      decoration: TextDecoration.lineThrough,
    );
  }

  // 类函数，获得文本样式
  TextStyle _getRewardTextStyle(BuildContext context) {
    // 如果不是新目标，返回文本样式控件
    if (!nowTarget)
      return new TextStyle(
        // 绘制文本的大小：13.0
        fontSize: 13.0,
        // 绘制文本时使用的颜色：黑色
        color: Colors.black,
      );
    // 返回文本样式控件
    return new TextStyle(
      // 绘制文本的大小：13.0
      fontSize: 13.0,
      // 绘制文本时使用的颜色：灰色
      color: Colors.black54,
      // 在文本附近绘制的装饰：文本中绘制一条横线
      decoration: TextDecoration.lineThrough,
    );
  }

  // 覆盖此函数以构建控件
  @override
  Widget build(BuildContext context) {
    // 返回值：创建列表项，通常包含图标和一些文本
    return new ListTile(
        // 当用户点击此列表项时调用
        onTap: () {
          // 调用对目标的改变函数
          onTargetChanged(target, !nowTarget);
        },
        // 要在标题之前显示的控件：创建圆形头像控件
        leading: new CircleAvatar(
          // 填充圆形的颜色：获得颜色函数
          backgroundColor: _getColor(context),
          // 子控件：文字控件
          child: new Text('囧'),
        ),
        // 列表项目的主要内容：创建堆栈布局控件
        title: new Stack(
            /*
         * 列表项目的主要内容：
         *  定位位置
         *    左边与顶部
         *  文本控件
         *    文本内容
         *    获得文本样式函数
         */
            children: <Widget>[
              new Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: new Text(
                    target.name,
                    style: _getNameTextStyle(context),
                  )),
              new Positioned(
                  left: 0.0,
                  top: 20.0,
                  child: new Text(
                    '奖励' + '\n' + target.reward,
                    style: _getRewardTextStyle(context),
                  )),
            ]));
  }
}
