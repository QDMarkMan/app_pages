import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:app_pages/routes/application.dart';
import 'package:app_pages/routes/routes.dart';
// App入口文件
main(List<String> args) {
  /// 强制设置竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  /// 初始化状态栏设置
  if (Platform.isAndroid) {
    // 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  // 启动Spp
  runApp(PagesApp());
}

class PagesApp extends StatelessWidget {
    PagesApp(){
    // 初始化路由
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  // 初始化组件
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child:  MaterialApp(
        title: 'app-pages',
        theme: ThemeData(
          primaryColor: Color(0xFF1891ac)
        ),
        // 由fluro接管路由
        onGenerateRoute: Application.router.generator
      ),
    );
  }
}