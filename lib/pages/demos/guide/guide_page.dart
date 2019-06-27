/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-14 09:56:06
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-17 11:01:56
 * @Description: 引导页
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';
import 'data.dart';
import 'gradient_text.dart';
// 页面
class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GuideApp(),
    );
  }
}

class GuideApp extends StatefulWidget {
  @override
  _GuideAppState createState() => _GuideAppState();
}

class _GuideAppState extends State<GuideApp> with TickerProviderStateMixin {

  PageController _pageController;
  int _index = 0;
  bool _isLast = false;
  AnimationController _buttonController;
  Animation<double> _scaleAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _index);
    _buttonController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this
    );
    _scaleAnim = Tween(begin: 0.6, end: 1.0).animate(_buttonController);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    _buttonController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF485563), Color(0xFF29323C)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          stops: [0.0, 1.0]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pages.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _index = index; 
                  // 是否是最后一页
                  _isLast = _index == pages.length -1 ? true : false;
                  if (_isLast ) {
                    _buttonController.forward();
                  }
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        var page = pages[index];
                        double delta;
                        var y = 1.0;
                        // 定义动画
                        if (_pageController.position.haveDimensions) {
                          delta = _pageController.page - index;
                          y = 1 - delta.abs().clamp(0, 1);
                          print(y);
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(page.imageUrl, height: 300,),
                            Container(
                              height: 100,
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.1,
                                    child: GradientText(
                                        page.title,
                                        gradient: LinearGradient(colors: page.titleGradient),
                                        style: TextStyle(
                                          fontSize: 90,
                                          fontFamily: "Montserrat-Black",
                                          letterSpacing: 1.0
                                        ),
                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 30, left: 22),
                                      child: GradientText(
                                        page.title,
                                        gradient: LinearGradient(colors: page.titleGradient),
                                        style: TextStyle(
                                          fontSize: 70,
                                          fontFamily: "Montserrat-Black",
                                          letterSpacing: 1.0
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12, left: 22),
                              child: Transform(
                                transform: Matrix4.translationValues(0, 50* (1-y), 0),
                                child: Text(
                                page.body,
                                style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Montserrat-Black",
                                          letterSpacing: 1.0,
                                          color: Color(0xFF9B9B9B)
                                        ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            ),
            Positioned(
              left: 20,
              bottom: 55,
              child: Container(
                width: 160,
                child: PageIndicator(_index, pages.length),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 30,
              // 缩放过渡组件
              child: ScaleTransition(
                scale: _scaleAnim,
                child: _isLast ? FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward, color: Colors.black,),
                  onPressed: () {
                    
                  },
                ) : Container()
              )
            )
          ],
        ),
      ),
    );
  }
}


class PageIndicator extends StatelessWidget {

  final int index;
  final int total;


  PageIndicator (
    this.index, this.total
  );
  

  _indicator (bool active) => Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: active ? Colors.white: Color(0xFFF3E4750),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 2
            )
          ]
        ),
      ),
    ),
  );

  _buildIndicators () {
    List<Widget> inditors = [];
    for (var i = 0; i < total; i++) {
      inditors.add(i == index ? _indicator(true) : _indicator(false) );
    }
    return inditors;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildIndicators(),
    );
  }
}

