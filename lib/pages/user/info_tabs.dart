/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Date: 2019-07-02 10:38:19
 * @LastEditors: etongfu
 * @LastEditTime: 2019-07-04 11:40:55
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
    return  Container(
        //　暂时不用Tabs了
        /* child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
              controller: controller,
              tabs: <Widget>[
                Tab(text: "信息",),
                Tab(text: "动态",),
                Tab(text: "其他",)
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
                  // 个人信息
                  Container(
                    child: UserInfo(),
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
        ) */
        child: UserInfo(),
      );
  }
}

class UserInfo extends StatelessWidget {

  final _fontStyle = TextStyle(color: Colors.black, fontSize: 14); 
  final _fontInfoStyle = TextStyle(color: Colors.black45, fontSize: 14); 

  /// 生成单个选项
  Widget _buildItem (String title, {Widget trailing = const Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 15,), Function tap}) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: tap,
          dense: true,
          title: Text(title, style: _fontStyle,),
          trailing: trailing
        ),
        Divider(height: 1,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          _buildItem("修改头像", trailing: ClipOval(
              child: FadeInImage(
                placeholder: AssetImage("assets/images/loading.gif"),
                fit: BoxFit.fitWidth,
                image: AssetImage("assets/images/avator.jpg"),
                width: 35.0,
                height: 35.0,
              ),
          )),
          _buildItem("个人信息", tap: () {
            print('To User Info');
          }),
          _buildItem("最近动态"),
          _buildItem("其他"),
        ],
      ),
    );
  }
}
