import 'package:flutter/material.dart';
import 'achievement_view_list_item.dart';

// 创建类，成就视图列表项目，继承StatefulWidget（有状态的控件）
class AchievementViewList extends StatefulWidget {
  // 构造函数
  AchievementViewList({
    // 自变量，目标列表
    this.targets,
    // 控件和元素的标识符
    Key key,
  })
      : super(key: key); // 使用父类的控件和元素标识符

  // 最终值，目标列表
  final List<Target> targets;

  /*
   * 覆盖具有相同名称的超类成员
   * 在树中的给定位置为此控件创建可变状态
   *  子类应重写此方法以返回其关联的State子类新创建的实例
   */
  @override
  _AchievementViewState createState() => new _AchievementViewState();
}

/*
 * 关联State子类的实例
 *  继承State：StatefulWidget（有状态的控件）逻辑和内部状态
 */
class _AchievementViewState extends State<AchievementViewList> {
  // 类成员，存储成就集合
  Set<Target> _achievements = new Set<Target>();

  /*
   * 类函数，成就改变
   *  target：传递目标
   *  nowTarget：是否新目标
   */
  void _achievementsChanged(Target target, bool nowTarget) {
    // 通知框架此对象的内部状态已更改
    setState(() {
      /*
       * 如果是新目标
       *  存储成就集合，增加目标
       *  否则，移除目标
       */
      if (nowTarget)
        _achievements.add(target);
      else
        _achievements.remove(target);
    });
  }

  // 覆盖此函数以构建依赖于动画的当前状态的控件
  @override
  Widget build(BuildContext context) {
    // 返回值，创建包含列表项的可滚动列表
    return new ListView(
        /*
       * 要在此列表中显示的控件
       *  迭代当前配置的目标列表中的目标
       *  为每一个调用函数创建成就目标类
       */

        children: widget.targets.map((Target target) {
      // 返回值，创建成就目标类
      return new AchievementViewItem(
        // 传递目标：本轮迭代中的目标
        target: target,
        // 是否新目标：如果目标在成就集合中，则返回true
        nowTarget: _achievements.contains(target),
        // 对目标的改变：类函数，成就改变
        onTargetChanged: _achievementsChanged,
      );
    }).toList());
  }
}
