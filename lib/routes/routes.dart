import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'route_handlers.dart';

class Routes {
  static String root = "/";
  static String homePage = "/home";

  static void configureRoutes(Router router) async{
    // 404 page
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: IndexHandle, transitionType:TransitionType.inFromRight);
    router.define(homePage, handler: HomeHandle, transitionType:TransitionType.inFromRight);
  }
}