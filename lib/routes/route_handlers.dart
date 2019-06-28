import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:app_pages/pages/index.dart';
import 'package:app_pages/pages/home/home_page.dart';
// 示例页面
import 'package:app_pages/pages/demos/guide/guide_page.dart';
import 'package:app_pages/pages/demos/shoppingUI/shopping.dart';
import 'package:app_pages/pages/demos/card_page.dart';
import 'package:app_pages/pages/demos/netflix/netflix_page.dart';
import 'package:app_pages/pages/demos/music_view.dart';
import 'package:app_pages/pages/demos/login_ui2.dart';



// =========== 登陆处理句柄 ===========
var IndexHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});


var HomeHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});


var GuideHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return GuidePage();
});
var ShoppingHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ShoppintUiPage();
});
var CardHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return CardPage();
});
var NetFlixHandle = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return NetflixPage();
  }
);
var MusicHandle = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MusicView();
  }
);
var LoginUIHandle = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginUI2();
  }
);