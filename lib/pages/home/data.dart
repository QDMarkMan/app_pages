/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-27 10:21:12
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-27 11:52:29
 * @Description: 示例页面列表
 * @youWant: add you want info here
 */
// 类型枚举
enum Types {
  Page, // 页面
  Component // 组件
}

List demos = [
  {
    "title": "Guide",
    "des": "app guide",
    "type": 0,
    "url": ""
  }
];

class DemoItem{
  String imageUrl; // 图片地址
  String path; // 页面路径
  String title;// 标题
  String des; // 描述
  Types type; // 类型 
  DemoItem(this.imageUrl, this.path, this.title, this.des, this.type);
}
var pages = [

  DemoItem("assets/images/screens/guide_page.png", "/guide", "Guide", "app guide", Types.Page),
  DemoItem("assets/images/screens/shopping_page.png", "/shopping", "Shopping", "shopping ui 1 guide", Types.Page),
  DemoItem("assets/images/screens/card_page.png", "/card", "Card", "card page", Types.Page),

];