/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 底部导航栏
 * @youWant: add you want info here
 * @Date: 2019-03-28 10:38:53
 * @LastEditTime: 2019-06-21 10:49:07
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibrate/vibrate.dart';

// 引入的页面
import 'package:app_pages/pages/home/home_page.dart';


class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

const _iconStyle= TextStyle(fontWeight: FontWeight.bold);

class _BottomBarState extends State<BottomBar> {

  num _currentIndex = 0; // 当前选中tabs
  num _tapCount = 0; // 当前点击次数
  DateTime _lastTapTime; // 上一次点击的时间
  // 页面list
  List<Widget> pages = [
    // SliverHomePage(),
    HomePage(),
  ];
  // bottoms中的按钮
  List<BottomNavigationBarItem> bottoms = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('Home', style: _iconStyle,)),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), title: Text('Widgets', style: _iconStyle,)),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder), title: Text('Page', style: _iconStyle,))
  ];
  /// 是否超过2S
  bool _isExceed2 (DateTime oldTime, DateTime newTime) {
    return newTime.millisecondsSinceEpoch - oldTime.millisecondsSinceEpoch > 1000;
  }

  /// 物理返回按键的拦截
  /// 如果已经登录了那么就屏蔽当前的物理返回按键
  /// 
  Future<bool> _popIntercept () async{
    // 先检查登陆状态
    /* UserStatus().getLoginStatus().then((value) {
      if (value != true) {
        Navigator.pop(context);
        Navigator.of(context).pop();
      }
    }); */
    // 时间赋值
    var currentTime = DateTime.now();
    _lastTapTime ??= currentTime;
    //次数赋值
    _tapCount ++;
    print(_lastTapTime);
    print(_tapCount);
    if (_tapCount == 1) {
      // ToastHelp(msg: "再按一次退出程序", bgColor: Theme.of(context).primaryColor).bottomToast();
      print("再按一次退出程序");
    }
    // 判断是否在2s内点击了两次
    if (_tapCount == 2 && _isExceed2(_lastTapTime, currentTime) == false) {
      // 先清空状态
      _tapCount = 0;
      _lastTapTime = null;
      // 退出App
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return false;
    }
    // 三秒之后清空所有状态
    Future.delayed(Duration(seconds: 2), () {
      _tapCount = 0;
      _lastTapTime = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope 可以对物理按键进行拦截
    return WillPopScope(
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: CupertinoTabBar(
          // type: CupertinoTabBar.fixed,
          iconSize: 24,
          activeColor: Theme.of(context).primaryColor,
          items: bottoms,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // 开启震动
            Vibrate.feedback(FeedbackType.light);
          },
        ),
      ),
      onWillPop: _popIntercept,
    );
  }
}
