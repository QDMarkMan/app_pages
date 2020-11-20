/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-28 10:35:09
 * @LastEditors: etongfu
 * @LastEditTime: 2019-09-13 16:16:52
 * @Description: User Center Page ==> should check
 * @youWant: add you want info here
 */
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:vibrate/vibrate.dart';
import 'info_tabs.dart';

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

class _UserAppState extends State<UserApp> with TickerProviderStateMixin {
  String  _regionName = 'Mark'; // 用户名称

  // final double _offsetLeft = 17; 
  double _imageHeight = 0.0; // 下拉高度
  double _completed = 0.0; // 下拉完成部分
  int animatedTime = 300; // 动画时间
  bool isVibrated = false; // 当前次是否已经震动过了
  AnimationController controller;//动画控制器
  Animation<double> curved;// 


  @override
  void initState() {
    super.initState();
    //初始化动画
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800 ),
    );
    
    // 动画监听器
    controller.addListener(() {
      if (controller.isCompleted) {
        controller.forward();
      }
    });

    curved = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  // 设置透明度
  double _setOpacity () {
    if (_imageHeight > 20 ) {
      return 1;
    } else {
      return 0;
    }
  }

  double _setComplete (double height) {
    setState(() {
      _completed =  (height / 60) * 100;
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    double startIndex = 0.0; // 开始滑动的位置

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Listener(
          onPointerDown: (event) {
            var position = event.position.dy;
            startIndex = position;
            // 重置动画时间
            setState(() {
              animatedTime = 300; 
            });
          },
          // 监听下拉
          onPointerMove: (event) {
              Offset _detal = event.delta;
              // 取消X轴滑动的情况 ==> 
              if( _detal.dx < -0.1 || _detal.dx > 0.1) {
                return;
              }
              // 取消向上滑动动作
              if (_detal.dy <= 0) {
                return;
              }
              var position = event.position.dy;
              // 下拉距离  (当前位置 - 开始位置)
              var detal = position - startIndex;
              _setComplete(detal / 10);
              // 赋值
              if (detal > 100) {
                setState(() {
                  _imageHeight = detal / 10;
                });
              }
              // 调用震动
              if (_imageHeight > 60 && !isVibrated) {
                // 调用震动
                // Vibrate.feedback(FeedbackType.light);
                setState(() {
                  isVibrated = true; 
                });
              }
          },
          onPointerUp: (event) {
            setState(() {
              isVibrated = false; 
            });
            if (_imageHeight == 60) {
              controller.forward(); // 开始旋转动画
            }
            // 下拉高度大于50的时候展开加载
            if (_imageHeight > 60 ) {
                setState(() {
                  _imageHeight = 60;
                  animatedTime = 500;
                });
              Future.delayed(Duration(seconds: 2), () {
                // 添加判断是为了fix `setState() called after dispose()` 这个错误
                if (mounted) {
                  setState(() {
                    _imageHeight = 0; 
                  });
                  _setComplete(0);
                }
              });
            } else {
              // 没有触发loading的时候
              if (mounted) {
                setState(() {
                  _imageHeight = 0;
                });
                _setComplete(0);
              }
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ============ 头像和背景图 ============
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
                      // ============ avator ============
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
                      // ============ username ============
                      Positioned(
                        right: 10,
                        bottom: 60,
                        child: Text(
                          _regionName,
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ============ top loading ============
                      Positioned(
                        top: 10,
                        child: Container(
                          width: _screenSize.width,
                          alignment: Alignment.center,
                          child: AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: _setOpacity(),
                            // opacity: 1,
                            child: Container(
                              height: 30,
                              width: 30,
                              child: CustomPaint(
                                foregroundPainter: LoadingPainter(
                                  lineColor: Colors.transparent,
                                  completeColor: Colors.white,
                                  completePercent: _completed,
                                  width: 2
                                ),
                                child: Container(
                                  child: RotationTransition(//旋转动画
                                          turns: curved,
                                          child: Center(
                                            child: Icon(Icons.track_changes,color: Colors.white),
                                          ),
                                  ),
                                )
                              ),
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // info tabs
              InfoTabs()
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

// 加载loading canvas
class LoadingPainter extends CustomPainter {
  
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  LoadingPainter({
    this.lineColor,
    this.completeColor,
    this.completePercent,
    this.width
  });

  @override
  void paint(Canvas canvas, Size size) {
    // canvas paint
    Paint line = Paint()
    ..color = lineColor
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2); // 圆心

    double radius = min(size.width / 2, size.height / 2); // 半径

    canvas.drawCircle(center, radius, line);

    double arcAngle = 2*pi*(completePercent / 100);
    // 绘制已完成的部分
    Paint complete = Paint()
            ..color = completeColor
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke
            ..strokeWidth = width;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi/2,  //  从正上方开始
        arcAngle,
        false,
        complete
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  
} 