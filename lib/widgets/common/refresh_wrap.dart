/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @LastEditors: etongfu
 * @Description: 下拉加载和上拉刷新组件
 * @youWant: add you want info here
 * @Date: 2019-04-10 10:13:02
 * @LastEditTime: 2019-06-19 11:19:08
 * @Document: https://pub.dartlang.org/packages/flutter_easyrefresh
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// 当前颜色
const Color primaryColor = Color.fromRGBO(0, 177, 8, 1);
// 下拉刷新/上拉加载 外包裹层
class RefreshWrap extends StatefulWidget {
  final Widget widget;
  final bool hasMore; // 加载更多
  final refreshCallBack; // refresh
  final loadCallBack; // refresh bool中是否还有数据

  RefreshWrap({Key key, this.widget, this.hasMore: true , this.loadCallBack, this.refreshCallBack}) : super(key: key);
  @override
  _RefreshWrapState createState() => _RefreshWrapState();
}

class _RefreshWrapState extends State<RefreshWrap> {
  // 刷新的 key
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =  GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
          key: _easyRefreshKey,
          // firstRefresh: true,
          refreshHeader: ClassicsHeader(
            key: _headerKey,
            refreshText: "下拉刷新",
            refreshReadyText: "释放刷新",
            refreshingText: "正在加载中" + "...",
            refreshedText: "刷新完成",
            moreInfo: "更新于: %T",
            bgColor: Colors.transparent,
            textColor: Theme.of(context).primaryColor,
            moreInfoColor: Theme.of(context).primaryColor,
            showMore: true,
          ),
          refreshFooter: ClassicsFooter(
            key: _footerKey,
            loadText: "上拉加载",
            loadReadyText: "释放加载",
            loadingText: "正在加载中" + "...",
            loadedText: "加载完成",
            noMoreText: "暂无更多",
            moreInfo: "加载于: %T",
            bgColor: Colors.transparent,
            textColor: Theme.of(context).primaryColor,
            moreInfoColor: Theme.of(context).primaryColor,
            showMore: true,
          ),
          // ============ 无数据的时候展示的组件 ============
          emptyWidget: Container(
            width: double.infinity,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Icon(
                  Icons.inbox,
                  size: 50.0,
                  color: Colors.grey,
                ),
                Text(
                  "暂无数据",
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                )
              ],
            ),
          ),
          // ============ 下拉刷新 ============
          onRefresh: widget.refreshCallBack,
          // ============ 加载更多 ============
          loadMore:  widget.hasMore ? widget.loadCallBack : null,
          behavior: ScrollBehavior(),
          // 子组件
          child: widget.widget,
        )
    );
  }
}
