import 'package:flutter/material.dart';
import 'package:app_pages/widgets/bottom_bar.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  /* Widget _current = Scaffold(); // 当前组件

  void initState(){ 
    super.initState();
    setPage();
  }
  // =========== 根据登陆状态设置当前页面 ===========
  setPage () async{
    var value = await UserStatus().getLoginStatus();
    if (value == true) {
      setState(() {
        _current = BottomBar();
      });
    } else {
      setState(() {
        _current= LoginPage(); 
      });
    }
  } */
  @override
  Widget build(BuildContext context) {
    return BottomBar();
  }
}