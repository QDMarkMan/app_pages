import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

// 数据部分
/// 图片列表
List<String> images = [
  "assets/images/cards/01.png",
  "assets/images/cards/02.png",
  "assets/images/cards/03.png",
  "assets/images/cards/04.png",
];
// 标题部分
List<String> titles = [
  "What IS This",
  "Real Life",
  "Show Me The World",
  "This Is Flutter"
];

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardApp();
  }
}

// 主要页面部分
class CardApp extends StatefulWidget {
  @override
  _CardAppState createState() => _CardAppState();
}

class _CardAppState extends State<CardApp> {

  /// 当前页
  var _currentPage = images.length -1.0;

  @override
  Widget build(BuildContext context) {

    /// ★ 需要学习
    PageController pageController = PageController(initialPage: images.length-1);
    pageController.addListener((){
      setState(() {
        _currentPage = pageController.page; 
      });
    });

    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            // top icon
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom:8, left:12, right:12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.format_align_left, color: Colors.white,size: 30,),
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white,size: 30,),
                    onPressed: () {

                    },
                  )
                ],
              ),
            ),
            // 标题部分
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Trending', style: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontFamily: "Calibre-Semibold"
                  )),
                  IconButton(
                    icon: Icon(Icons.more_horiz,color: Colors.white,),
                    onPressed: () {

                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFff6e6e),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Text(
                          'Animated',
                          style: TextStyle (
                            color: Colors.white
                          )
                        ),
                      ),
                    )
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('25+ Stories', style: TextStyle(color: Colors.blueAccent))
                ],
              )
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(_currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: pageController,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
            // favorite 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Favorite', style: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontFamily: "Calibre-Semibold"
                  )),
                  IconButton(
                    icon: Icon(Icons.more_horiz,color: Colors.white,),
                    onPressed: () {

                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Text(
                          'Latest',
                          style: TextStyle (
                            color: Colors.white
                          )
                        ),
                      ),
                    )
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('9+ Stories', style: TextStyle(color: Colors.blueAccent))
                ],
              )
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/cards/01.png", fit: BoxFit.cover,width: 200, height: 160,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {

  final currentPage;
  final padding = 20.0;
  final verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    /// AspectRatio的用处是什么 ？
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      /// LayoutBuilder怎么用？
      child: LayoutBuilder(
        builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height -2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizInset = primaryCardLeft / 2;
          List<Widget> list = List();
          for (var i = 0; i < images.length; i++) {
            var delta = i - currentPage;
            var onRight = delta > 0;

            var start = padding + max(primaryCardLeft - horizInset * -delta * (onRight ? 15: 1), 0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0),
              bottom: padding + verticalInset * max(-delta, 0),
              start: start,
              textDirection: TextDirection.rtl,
              /// ClipRRect ? 这又是个啥
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3, 6),
                        blurRadius: 10
                      )
                    ]
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(images[i], fit: BoxFit.cover),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                                child: Text(titles[i], style:TextStyle(color: Colors.white, fontSize: 25, fontFamily:"SF-Pro-Text-Regular")),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: EdgeInsets.only(left: 12, bottom: 12),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text('Read Later', style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            list.add(cardItem);
          }
          return Stack(
            children: list,
          );
        },
      ),
    );
  }
}