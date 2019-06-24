/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-24 10:06:06
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-24 11:17:31
 * @Description: 主页面按钮部分
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';

List<Map<String, dynamic>> icons = [
  {
    "icon": Icons.shopping_basket,
    "title": "icon"
  },
  {
    "icon": Icons.ac_unit,
    "title": "icon"
  },
  {
    "icon": Icons.access_alarm,
    "title": "icon"
  },
  {
    "icon": Icons.backup,
    "title": "icon"
  },
  {
    "icon": Icons.cake,
    "title": "icon"
  },
  {
    "icon": Icons.dashboard,
    "title": "icon"
  },
  {
    "icon": Icons.email,
    "title": "icon"
  },
  {
    "icon": Icons.fastfood,
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