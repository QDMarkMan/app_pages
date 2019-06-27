/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-18 09:31:59
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-26 10:32:42
 * @Description: 仿 Netflix 主页 
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';
/// 图片列表
List<String> images = [
  "images/cards/01.png",
  "images/cards/02.png",
  "images/cards/03.png",
  "images/cards/04.png",
];
// 标题部分
List<String> titles = [
  "What IS This",
  "Real Life",
  "Show Me The World",
  "This Is Flutter"
];

/// app
class NetflixPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetflixApp(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFE52020),),
            title: Text('Home', style:TextStyle(color: Color(0xFFE52020)))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Text('Bookmark')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile')
          )
        ],
      ),
    );
  }
}
/// 核心页面
/// app page
class NetflixApp extends StatefulWidget {
  @override
  _NetflixAppState createState() => _NetflixAppState();
}

class _NetflixAppState extends State<NetflixApp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ScreenTop(),
          ScreenBottom()
        ],
      ),
    );
  }
}
/// 屏幕上部分
class ScreenTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: TopClipper(),
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10
                  )
                ]
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset("images/sun.png",fit:BoxFit.cover, width: double.infinity),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x00000000),
                          const Color(0xD9333333)
                        ],
                        stops: [0.0, 0.9],
                        begin: FractionalOffset(0, 0),
                        end: FractionalOffset(0, 1)
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 100,left: 90),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('WATCH BEFOR EVERONE', style: TextStyle(color: Colors.white, fontSize: 15),),
                          Text('The Punissher: Season2',style: TextStyle(color: Colors.white, fontSize: 35),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // 观看按钮
          Positioned(
            top: 260,
            right: -20,
            // ??? 这是个什么组件 ？
            child: FractionalTranslation(
              translation: Offset(0, .5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: (){},
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add, color: Color(0xFFE52020),),
                  ),
                  SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      onPressed: (){},
                      color: Color(0xFFE52020),
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Row(
                        children: <Widget>[
                          Text('Watch Now', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 8,),
                          Icon(
                            Icons.arrow_forward,
                            color:Colors.white,
                            size:15
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
/// 剪裁组件
class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.width - 100);

    var controlPoient = Offset(35, size.height);
    var endPoint= Offset(size.width / 2, size.height);

    path.quadraticBezierTo(controlPoient.dx, controlPoient.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}
/// 屏幕底部
class ScreenBottom extends StatelessWidget {

  List<Widget> movies () {
    List<Widget> _movieList = List();

    for (var i = 0; i < images.length; i++) {
      var movie = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          height: 200,
          width: 135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 10)
              )
            ]
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                child: Image.asset(images[i], fit: BoxFit.cover,width: double.infinity,height: 140,)),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8 , top: 4),
                child: Text(titles[i], textAlign: TextAlign.center, style: TextStyle(fontSize:16)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(i == 0 ? "Season 2:": "", style: TextStyle(color: Colors.grey),),
              )
            ],
          ),
        ),
      );
      _movieList.add(movie);
    }

    return _movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Watch Now', style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),),
                FlatButton(
                  onPressed: (){},
                  child: Text('View more', style: TextStyle(color: Colors.grey),),
                )
              ],
            ),
          ),
          Container(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies(),
            ),
          )
        ],
      ),
    );
  }
}