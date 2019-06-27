import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'route_handlers.dart';

class Routes {
  static String root = "/";
  static String homePage = "/home";
  // 示例页面
  static String guidePage = "/guide";
  static String shoppingPage = "/shopping";
  static String cardPage = "/card";


  static void configureRoutes(Router router) async{
    // 404 page
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: IndexHandle, transitionType:TransitionType.inFromRight);
    router.define(homePage, handler: HomeHandle, transitionType:TransitionType.inFromRight);
    // 示例页面
    router.define(guidePage, handler: GuideHandle, transitionType:TransitionType.inFromRight);
    router.define(shoppingPage, handler: ShoppingHandle, transitionType:TransitionType.inFromRight);
    router.define(cardPage, handler: CardHandle, transitionType:TransitionType.inFromRight);

  }
}