/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-03 09:54:42
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-28 10:15:29
 * @Description: 概念音乐页面
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'dart:math';

class MusicView extends StatefulWidget {
  @override
  _MusicViewState createState() => _MusicViewState();
}


class _MusicViewState extends State<MusicView> {
    double _thumbPercent = 0.4;

    Widget _buildSeekBar () {
      // 使用fluttery_seekbar创建的圆形seekbar
      return RadialSeekBar(
        trackColor: Colors.red.withOpacity(.5),
        trackWidth: 2.0,
        progressColor: Color(0xFFFE1483),
        progressWidth: 5.0,
        progress: _thumbPercent,
        thumb: CircleThumb(
          color: Color(0xFFFE1483),
          diameter: 17.0,
        ),
        thumbPercent: _thumbPercent,
        onDragUpdate: (double percent) {
          setState(() {
            _thumbPercent = percent;
          });
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    const _coloredStyle  = TextStyle(color: Color(0xFFFE1483), fontFamily: "Nexa");
    const _color = Color(0xFFFE1483);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Music World', style: _coloredStyle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFFE1483)),
          onPressed: () {
            
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: _color,),
            onPressed: () {
              
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          // 使用SizedBox 来占领高度 也可以使用Padding
          SizedBox(
            height: 5,
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: _color.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: _buildSeekBar(),
                    )
                  ),
                  Center(
                    child: Container(
                      height: 180,
                      width: 180,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: ClipOval(
                            clipper: ImageClipper(),
                            child: Image.asset("assets/images/bg.jpg", fit: BoxFit.cover,),
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // 歌曲标题部分
          Column(children: <Widget>[
            Text('Justin Bieber XXX fit. never say', style: TextStyle(color: _color, fontSize: 20, fontFamily: 'Nexa'),),
            SizedBox(
              height: 8,
            ),
            Text(
              'The Weekend',
              style: TextStyle(color: _color.withOpacity(0.5), fontSize: 18, fontFamily: 'NexaLight'),
            )
          ],),
          SizedBox(height: 5,),
          // 播放器控制部分
          Container(
            height: 150,
            width: 350,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(height: 65, width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: _color, width: 2),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:  Row(
                      children: <Widget>[
                        Icon(Icons.fast_rewind, color: _color, size: 50,),
                        Expanded(
                          child: Container(),
                        ),
                        Icon(Icons.fast_forward, color: _color, size: 50,),
                      ],
                    ),
                    )
                  ),
                ),
                // center circle
                // 按钮部分
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: _color,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.pause, size: 35, color: Colors.white,),
                      onPressed: () {

                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          // 下面推荐歌曲部分
          Container(
            height: 130,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: -25,
                  child: Container(
                    height: 130,
                    width: 50,
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                      )
                    ),
                  ),
                ),
                Positioned(
                  right: -25,
                  child: Container(
                    height: 130,
                    width: 50,
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)
                      )
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      song('assets/images/cards/01.png', 'Bieber', 'This Is Song'),
                      song('assets/images/cards/02.png', 'Bieber', 'This Is Song')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
// 通过函数生成组件
Widget song (String image, String title, String subTitle) {
  return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: 35,
            height: 35,
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(color: Color(0xFFFE1483)),),
              Text(subTitle, style: TextStyle(color: Color(0xFFFE1483)),),
            ],
          )
        ],
      ),
    );
}
// 剪裁类
class ImageClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}