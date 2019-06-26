import 'package:flutter/material.dart';
// 页面组件
import 'home_swiper.dart';
import 'home_icons.dart';
import 'home_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: HomeApp(),
        );
  }
}
/// app 标题
class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Logo and title
            Image.asset("assets/images/logo.png", height: 30, width: 30, fit: BoxFit.cover,),
            SizedBox(
              width: 2,
            ),
            Container(
              height: 23,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Pages",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12
                ),
              ),
            ),
            // Search 
            Expanded(
              child: 
              Container(
                margin: EdgeInsets.only(left: 10),
                color: Colors.grey.withOpacity(.3),
                child: ConstrainedBox(
                  // 通过这个方法来限制输入框的高度
                  constraints: BoxConstraints(
                    maxHeight: 25
                  ),
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                      border: InputBorder.none, //隐藏下划线
                      prefixIcon: Icon(Icons.search, size: 16,),
                      fillColor: Theme.of(context).primaryColor
                    ),
                  ),
                ),
              )
            ),
            // Search Icon
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Icon(IconData(0xe89f, fontFamily: "Iconfonts")),
            ),
            // Message
            Padding(
              padding: EdgeInsets.only(left:15, right: 5),
              child: Icon(IconData(0xe8b0, fontFamily: "Iconfonts")),
            )
          ],
        ),
      );
  }
}
/// 核心部分
class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  // 创建渐变背景
  Widget _buildGradientContainer (double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFfbfcfd),
              Color(0xFFf2f3f8)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1.0]
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
             // 渐变色背景栏
            _buildGradientContainer(width, height),
            //
            Container(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // real content
                  children: <Widget>[
                    // 标题栏目
                    AppTitle(),
                    // Swiper
                    HomeSwiper(),
                    // Icons
                    HomeIcons(),
                    // Content 内容部分
                    HomeContent()
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}


