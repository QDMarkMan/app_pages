/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-26 09:14:56
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-27 11:18:38
 * @Description: Home 内容
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';
import 'package:app_pages/routes/application.dart';
import 'data.dart';
import 'package:app_pages/constants/icons.dart';
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
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Text('Demos'),
        ),
        Container(
          height: size.height / 3,
          padding: EdgeInsets.only(left: 10, bottom: 20),
          color: Colors.white,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              return PageItem(pages[index]);
            }
          ),
        )
      ],
    );
  }
}

/// 单个展示项
class PageItem extends StatelessWidget {

  final DemoItem pageModel;

  PageItem(this.pageModel);

  @override
  Widget build(BuildContext context) {
    return  
    InkWell(
          onTap: () {
            Application.router.navigateTo(context, pageModel.path);
          },
          child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  width: 100,
                  decoration: BoxDecoration(
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
                      // 图片展示
                      Container(
                        child: Image.asset(pageModel.imageUrl, fit: BoxFit.cover,),
                      ),
                      // 类型标识图标
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Icon(CustomIcons.iconCircle, size: 14, color: Colors.white,),
                      ),
                      // 内容部分
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 50,
                        child: BottomTitle(
                          title: pageModel.title,
                          des: pageModel.des,
                        ),
                      )
                    ],
                  ),
              ),
      ),
        ),
    );
  }
}
/// 单个demo的内部样式
class BottomTitle extends StatelessWidget {
  final String title;
  final String des;

  BottomTitle({
    this.title,
    this.des
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 15, color: Colors.white ,fontWeight: FontWeight.bold, fontFamily: 'Helvetica')),
                SizedBox(height: 10,)
                // Text(des, style: TextStyle(fontSize: 13, color: Colors.white70,), overflow: TextOverflow.ellipsis,),
              ],
            ),
          );
  }
}