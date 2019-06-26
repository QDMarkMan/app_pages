/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-26 09:14:56
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-26 11:08:53
 * @Description: Home 内容
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';


class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Text('Demos'),
        ),
        Container(
          height: size.height / 3.3,
          padding: EdgeInsets.only(left: 10, bottom: 20),
          color: Colors.white,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return PageItem();
            }
          ),
        )
      ],
    );
  }
}

/// 单个展示项
class PageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 5),
                      blurRadius: 10
                    )
                  ]
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // 具体内容
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    // 类型图标
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Icon(Icons.pages, size: 14, color: Colors.white,),
                    ),
                    // 内容部分
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 50,
                      child: BottomTitle(),
                    )
                  ],
                ),
            ),
    ),
      );
  }
}
/// 单个demo的内部样式
class BottomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(.4),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Title', style: TextStyle(fontSize: 18, color: Colors.white ,fontWeight: FontWeight.bold, fontFamily: 'Helvetica')),
                Text('des', style: TextStyle(fontSize: 15, color: Colors.white70)),
              ],
            ),
          );
  }
}