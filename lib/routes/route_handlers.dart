import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:app_pages/pages/index.dart';
import 'package:app_pages/pages/home/home_page.dart';

// =========== 登陆处理句柄 ===========
var IndexHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});


var HomeHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});