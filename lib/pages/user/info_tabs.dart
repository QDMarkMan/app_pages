/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Date: 2019-07-02 10:38:19
 * @LastEditors: etongfu
 * @LastEditTime: 2019-07-02 12:01:09
 * @Description: Info tabs for user
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';

class InfoTabs extends StatefulWidget {
  @override
  _InfoTabsState createState() => _InfoTabsState();
}

class _InfoTabsState extends State<InfoTabs> with SingleTickerProviderStateMixin  {

  TabController controller;

  @override
  void initState() { 
    super.initState();
    controller = TabController(initialIndex: 0, length: 3, vsync: this);
  }
  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
        child: Container(
        height: 300,
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
              controller: controller,
              tabs: <Widget>[
                Tab(text: "信息",),
                Tab(text: "信息",),
                Tab(text: "信息",)
              ],
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              labelColor: Theme.of(context).primaryColor,
              indicatorPadding: EdgeInsets.only(top: 3),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: <Widget>[
                  Container(
                    child: Text('1'),
                  ),
                  Container(
                    child: Text('2'),
                  ),
                  Container(
                    child: Text('3'),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
