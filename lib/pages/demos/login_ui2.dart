/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-04 10:10:39
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-28 10:14:08
 * @Description: 
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginUI2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginApp();
  }
}

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {

  bool _isSelected = false;


  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 初始化
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1350, allowFontScaling: true);

    Widget _radioButton (bool isSelect) => Container(
      width: 16,
      height: 16,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.black)
      ),
      child: isSelect ? Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black 
        ),
      ) : Container()  
    );

    // horizationline
    Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(110),
        height: 1,
        color: Colors.black12.withOpacity(.2),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Image.asset("assets/images/sun.png"),
                  
                )
                // Image.asset(name)
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top:60, left:10, right: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/images/logo.png",
                          width: ScreenUtil.getInstance().setWidth(110),
                          height:ScreenUtil.getInstance().setHeight(110),
                        ),
                        Text('LOGO', style: TextStyle (
                          fontFamily: "Poppins-Bold",
                          fontSize: ScreenUtil.getInstance().setSp(46),
                          letterSpacing: 6,
                          fontWeight: FontWeight.bold
                        ))
                      ],
                    ),
                    // 登陆框
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(200),
                    ),
                    LoginCard(),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(30),
                    ),
                    // remember me
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: _radio,
                              child: _radioButton(_isSelected),
                            ),
                            SizedBox(width: 10,),
                            Text('Remember me', style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Poppins-Medium",
                            ),),
                          ],
                        ),
                        //
                        InkWell(
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(330),
                            height: ScreenUtil.getInstance().setHeight(100),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff17ead9),
                                  Color(0xff6078ea),
                                ]
                              ),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff6078ea).withOpacity(.3),
                                  offset: Offset(8, 8),
                                  blurRadius: 8
                                )
                              ]
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                child: Center(
                                  child: Text(
                                    'SIGNIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Bold",
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                ),
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        horizontalLine(),
                        Text('Social Login', style: TextStyle(
                          fontSize:16, 
                          fontFamily: "Poppins-Medium",
                        ),),
                        horizontalLine()
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Socialcons(
                          colors: [
                            Color(0xff102397),
                            Color(0xff187adf),
                            Color(0xff00eaf8)
                          ],
                          iconData: Icons.face,
                          onPressed: () {

                          },
                        ),
                        Socialcons(
                          colors: [
                            Color(0xFFff4f38),
                            Color(0xFFff355d)
                          ],
                          iconData: Icons.group_work,
                          onPressed: () {

                          },
                        ),
                        Socialcons(
                          colors: [
                            Color(0xFF17ead9),
                            Color(0xFF6078ea)
                          ],
                          iconData: Icons.payment,
                          onPressed: () {

                          },
                        ),
                        Socialcons(
                          colors: [
                            Color(0xFF00c6fb),
                            Color(0xFF0056ea)
                          ],
                          iconData: Icons.linked_camera,
                          onPressed: () {

                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('New User ?',  style: TextStyle(
                          fontFamily: "Poppins-Medium",
                        ),),
                        InkWell(
                          child:  Text(' SignUp',  style: TextStyle(
                          color: Colors.blue, 
                          fontFamily: "Poppins-Medium",
                        ),),
                        )
                      ],
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
/// 登陆卡片
class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(500),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 15),
            blurRadius: 15
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -10),
            blurRadius: 10
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsets.only(top:16, left: 16, right:16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Login', style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: ScreenUtil.getInstance().setSp(45),
              letterSpacing: .6,
              fontWeight: FontWeight.bold
            )),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text('Username', style: TextStyle(
              fontFamily: "Poppins-Medium",
              fontSize: ScreenUtil.getInstance().setSp(26),
            )),
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
                )
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text('Password', style: TextStyle(
              fontFamily: "Poppins-Medium",
              fontSize: ScreenUtil.getInstance().setSp(26),
            )),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
                )
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Forgot Password?', style:TextStyle(
                  color: Colors.blue,
                  fontFamily: "Poppins-Medium",
                  fontSize: ScreenUtil.getInstance().setSp(26),
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 登陆Icons
class Socialcons extends StatelessWidget {

  final List<Color> colors;
  final IconData iconData;
  final Function onPressed;
  Socialcons({
    this.colors,
    this.iconData,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors,
            tileMode: TileMode.clamp
          )
        ),
        child: RawMaterialButton(
          onPressed: onPressed,
          shape: CircleBorder(),
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}

// icon数据
class CustomIcons {
  static const IconData twitter = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData facebook = IconData(0xe901, fontFamily: "CustomIcons");
  static const IconData google = IconData(0xe902, fontFamily: "CustomIcons");
  static const IconData linkedin = IconData(0xe903, fontFamily: "CustomIcons");
}