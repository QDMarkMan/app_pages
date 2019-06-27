import 'package:flutter/material.dart';
import 'data.dart';

class ShoppintUiPage extends StatefulWidget {
  @override
  _ShoppintUiPageState createState() => _ShoppintUiPageState();
}

class _ShoppintUiPageState extends State<ShoppintUiPage> {

  int _currnetIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f3f8),
      body: AppPage(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _currnetIndex,
        onTap: (index) {
          setState(() {
            _currnetIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.panorama_horizontal),
            title: Container(height: 0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.panorama_horizontal),
            title: Container(height: 0,)
          )
        ],
      ),
      floatingActionButton: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: Color(0xFFfa7b58),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFf78a6c).withOpacity(.6),
              offset: Offset(0, 10),
              blurRadius: 10
            )
          ]
        ),
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white,),
          onPressed: () {},
        ),
      ),
      // 移动fab 还有这种操作
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// App 部分
class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  /// 生成渐变背景
  ///
  Widget _buildGradientContainer (double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFfbfcfd),
              Color(0xFFf2f3f8)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1.0]
          )
        ),
      ),
    );
  } 


  /// 生成标题
  Widget _buildTitle (double height) => Positioned(
    top: height * .2,
    left: 30,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Woodren China", style: TextStyle(fontSize: 20, fontFamily: "Montserrat-Bold", fontWeight: FontWeight.bold)),
        Text("Lorean Crease", style: TextStyle(fontSize: 16, fontFamily: "Montserrat-Bold"))
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    // 一个可以返回一个根据父view 的size 创建的view 的方法 
    return LayoutBuilder(
      builder: (context, constraints){
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // 渐变色背景栏
            _buildGradientContainer(width, height),
            // 自定义appbar
            TopAppBar(),
            //title
            _buildTitle(height),
            // 内容
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: height * .6,
                child: ListView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 35, bottom: 60, right: 10),
                      child: SizedBox(
                        width: 200,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: (index % 2 == 0) ? Colors.white: Color(0xFF2a2d3f),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 10),
                                      blurRadius: 10
                                    )
                                  ]
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(images[index], width: 172, height: 198,),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(titles[index], style: TextStyle(fontSize: 16, color: (index % 2 == 0) ? Color(0xFF2a2d3f) : Colors.white, fontFamily: "Montserrat-Bold", fontWeight: FontWeight.bold)),
                                    Text("Lorean", style: TextStyle(fontSize: 12, color: (index % 2 == 0) ? Color(0xFF2a2d3f) : Colors.white, fontFamily: "Montserrat-Bold"))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(prices[index] + "\$", style: TextStyle(fontSize: 26,color: (index % 2 == 0) ? Color(0xFF2a2d3f) : Colors.white, fontFamily: "Montserrat-Bold"))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

// 顶部appbar
class TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 15,
      right: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}