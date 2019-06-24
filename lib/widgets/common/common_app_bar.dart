/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @LastEditors: etongfu
 * @Description: 通用appBar
 * @youWant: add you want info here
 * @Date: 2019-04-24 09:29:19
 * @LastEditTime: 2019-04-24 09:59:10
 */
import 'package:flutter/material.dart';
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget leading; 
  final String title;
  final List<Widget> actions;
  final bool autoShowBack;

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  

  CommonAppBar({
    Key key,
    this.title,
    this.leading,
    this.actions,
    this.autoShowBack
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

