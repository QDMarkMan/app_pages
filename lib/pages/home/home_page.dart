import 'package:flutter/material.dart';
// 页面组件
import 'home_swiper.dart';
import 'home_icons.dart';

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
        child: Text(
          "Pages",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30
          ),
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


