/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-14 10:08:09
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-27 10:19:47
 * @Description: 引导页数据
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';

class PageModel {

  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient;
  PageModel(this.imageUrl, this.title, this.body, this.titleGradient);
}

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)]

];

var pages = [
  PageModel("assets/images/cats/004.png", "APP", "THIS IS A VUE GUIDE PAGE", gradients[0]),
  PageModel("assets/images/cats/002.png", "PAGES", "MY DATA PAGE", gradients[1]),
  PageModel("assets/images/cats/006.png", "DEMO", "MY IOS GUIDE PAGE", gradients[2])
];