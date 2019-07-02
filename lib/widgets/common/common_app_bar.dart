/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @LastEditors: etongfu
 * @Description: 通用appBar
 * @youWant: add you want info here
 * @Date: 2019-04-24 09:29:19
 * @LastEditTime: 2019-07-02 11:33:23
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget leading; 
  final String title;
  final List<Widget> actions;
  final bool autoShowBack;
  final bool centerTitle; //标题居中 默认false

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  CommonAppBar({
    Key key,
    this.title,
    this.leading,
    this.actions,
    this.autoShowBack,
    this.centerTitle = false
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: autoShowBack == true ? true : false,
      actions: actions,
      
    );
  }
}


@deprecated
class CommonIOSAppBar extends StatelessWidget {

  final Widget leading; 
  final String title;
  final List<Widget> actions;

  /* this.leading,//导航栏左侧组件
  this.automaticallyImplyLeading = true,//是否显示左边组件
  this.automaticallyImplyMiddle = true,//是否显示中间组件,好像无效
  this.previousPageTitle,//导航栏左侧组件的右边的文本
  this.middle,////导航栏中间组件
  this.trailing,////导航栏右侧组件
  this.border = _kDefaultNavBarBorder,//
  this.backgroundColor = _kDefaultNavBarBackgroundColor,//背景色
  this.padding,// 内填充
  this.actionsForegroundColor = CupertinoColors.activeBlue,//左侧默认组件和左侧组件右边文本的颜色
  this.transitionBetweenRoutes = true,//
  this.heroTag = _defaultHeroTag,//transitionBetweenRoutes:false时才能设置 */

  CommonIOSAppBar({
    Key key,
    this.title,
    this.leading,
    this.actions,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      previousPageTitle: title,
      leading: leading
    );
  }
}
