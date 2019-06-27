/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-24 10:06:06
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-27 09:30:04
 * @Description: 主页面按钮部分
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';
import 'package:app_pages/constants/icons.dart';

List<Map<String, dynamic>> icons = [
  {
    "icon": CustomIcons.iconCard,
    "title": "icon"
  },
  {
    "icon": CustomIcons.iconFridends,
    "title": "icon"
  },
  {
    "icon": CustomIcons.iconMap,
    "title": "icon"
  },
  {
    "icon": CustomIcons.iconMoney,
    "title": "icon"
  },
  {
    "icon": CustomIcons.iconTalk,
    "title": "icon"
  },
  {
    "icon": CustomIcons.iconVideo,
    "title": "icon"
  },
  {
    "icon": CustomIcons.iconVip,
    "title": "icon"
  },
  {
    "icon": CustomIcons.iconVoice,
    "title": "icon"
  },
];

class HomeIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    // 图标中心包裹层
    return Container(
      width: _size.width,
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 5
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5, 0),
            blurRadius: 5
          ),
        ]
      ),
      child: Wrap(
        runSpacing: 10, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.start,
        children: icons.map((item){
          num index = icons.indexOf(item);
          return Container(
            // 相当于盒子模型的算法
            width: (_size.width-10) / 4,
            child: Center(
              child: GestureDetector(
                onTap: (){
                  print('tap icon$index');
                },
                child: Column(
                  children: <Widget>[
                    Icon(item["icon"], color: Theme.of(context).primaryColor),
                    Text(item["title"] + index.toString(), style: TextStyle(color: Colors.black54),)
                  ],
                ),
              ),
            )
          );
        }).toList(),
      ),
    );
  }
}