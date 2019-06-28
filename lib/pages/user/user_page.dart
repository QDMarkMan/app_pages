/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-28 10:35:09
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-28 12:01:15
 * @Description: User Center Page
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

import 'package:app_pages/routes/application.dart';


class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserApp(),
    );
  }
}

class UserApp extends StatefulWidget {
  @override
  _UserAppState createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  String  _regionName = 'ETongFu'; // 用户名称



  final double _offsetLeft = 17; 
  double _imageHeight = 0.0; // 下拉高度
  int animatedTime = 300;
  bool isVibrated = false; // 当前次是否已经震动过了

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 异步获取当前的电池电量
  }
  // 设置透明度
  double _setOpacity () {
    if (_imageHeight >= 40 ) {
      return 1;
    } else {
      return 0;
    }
  }
  //　跳转页面
  void toNextPage (String path) {
    Application.router.navigateTo(context, path);
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    double startIndex = 0.0; // 起始位置

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Listener(
          onPointerDown: (event) {
            var position = event.position.distance;
            startIndex = position;
            // 重置动画时间
            setState(() {
              animatedTime = 300; 
            });
          },
          // 监听下拉
          onPointerMove: (event) {
              var position = event.position.distance;
              var detal = position - startIndex;
              // 赋值
              if (detal > 100) {
                setState(() {
                  _imageHeight = detal; 
                });
                setState(() {
                  _imageHeight = _imageHeight / 10;
                });
              }
              // 调用震动
              if (_imageHeight > 80 && !isVibrated) {
                // 调用震动
                Vibrate.feedback(FeedbackType.light);
                setState(() {
                  isVibrated = true; 
                });
              }
          },
          onPointerUp: (event) {
            setState(() {
              isVibrated = false; 
            });
            // 下拉高度大于50的时候展开加载
            if (_imageHeight > 50 ) {
                setState(() {
                  _imageHeight = 40;
                  animatedTime = 500;
                });
              Future.delayed(Duration(seconds: 2), () {
                // 添加判断是为了fix `setState() called after dispose()` 这个错误
                if (mounted) {
                  setState(() {
                    _imageHeight = 0; 
                  });
                }
              });
            } else {
              if (mounted) {
                setState(() {
                  _imageHeight = 0;
                });
              }
            }
          },
          child: Column(
            children: <Widget>[
              // ============ 用户信息 ============
              ClipPath(
                clipper: HomeClipper(),
                child: AnimatedContainer(
                  curve: Curves.linearToEaseOut,
                  duration: Duration(milliseconds: animatedTime),
                  width: _screenSize.width, // 兼容处理宽度
                  height: (_screenSize.height / 2.5) + _imageHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset('assets/images/user_bg.jpg').image
                    )
                  ),
                  child: Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      // ============ 圆形头像 ============
                      Positioned(
                        left: 17,
                        bottom: 40,
                        child: ClipOval(
                            child: FadeInImage(
                              placeholder: AssetImage("assets/images/loading.gif"),
                              fit: BoxFit.fitWidth,
                              image: AssetImage("assets/images/avator.jpg"),
                              width: 60.0,
                              height: 60.0,
                            ),
                        )
                      ),
                      // ============ 用户名 ============
                      Positioned(
                        right: 10,
                        bottom: 60,
                        child: Text(
                          _regionName,
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ============ loading ============
                      Positioned(
                        top: 10,
                        child: Container(
                          width: _screenSize.width,
                          alignment: Alignment.center,
                          child: AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: _setOpacity(),
                            // child: Icon(Icons.ac_unit, size: 35, color: Colors.white,)
                            child: Icon(
                              Icons.cloud_circle,
                              size: 35.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 300,
                color: Colors.transparent,
                child: Center(
                  child: Text('In development'),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


class HomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var _path =Path();
    _path.lineTo(0, size.height-60);
    var firstPoint = Offset(size.width / 4.2, size.height);
    var firstEndPoint =Offset(size.width / 2.25, size.height-30);
    _path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondPoint = Offset(size.width/4*3,size.height-80);
    var secondEndPoint =Offset(size.width, size.height-30);    
    _path.quadraticBezierTo(secondPoint.dx, secondPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    
    _path.lineTo(size.width, size.height-40);
    _path.lineTo(size.width, 0);

    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}