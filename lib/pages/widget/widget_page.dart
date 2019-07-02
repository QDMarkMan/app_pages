/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-28 10:37:14
 * @LastEditors: etongfu
 * @LastEditTime: 2019-07-02 11:34:00
 * @Description: widget pages
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Widgets', style: TextStyle(color:Theme.of(context).primaryColor),)
      ),
      child:  Container(
        child: Center(
          child: Text('In development'),
        ),
      ),
    );
  }
}
