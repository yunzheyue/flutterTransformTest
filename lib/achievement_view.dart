import 'package:flutter/material.dart';
import 'achievement_view_list.dart';
import 'achievement_view_list_item.dart';
class AchievementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("---"+_kTargets.length.toString());
    return new AchievementViewList(targets: _kTargets);
  }
}
final List<Target> _kTargets = <Target>[
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
];