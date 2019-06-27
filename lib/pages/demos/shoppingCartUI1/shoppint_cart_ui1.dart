/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-13 10:00:37
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-13 11:33:20
 * @Description: 快速开发购物车模块
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';

class ShoppingCart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Cart1Page(),
      bottomNavigationBar: CartBottomApp(),
    );
  }
}

// 页面部分
class Cart1Page extends StatefulWidget {
  @override
  _Cart1PageState createState() => _Cart1PageState();
}

class _Cart1PageState extends State<Cart1Page> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: 
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Image.asset("images/nike_logo.jpg",width: 62, height: 43),
              ),
            ),
            ProductCard(
              imageUrl: "images/nike/shoes.png",
              title: "Nike React",
              oldPrice: '999.0',
              price: "256",
            ),
            SizedBox(
              height: 10,
            ),
            ProductCard(
              imageUrl: "images/nike/shoes02.png",
              title: "Nike Air Force",
              oldPrice: '999.0',
              price: "199",
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String oldPrice;
  final String price;

  ProductCard({
    this.imageUrl,
    this.title,
    this.oldPrice,
    this.price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 245,
      decoration: BoxDecoration(
        color: Color(0xFFfaecfb),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)
      ),
      child: Column(
        children: <Widget>[
          Image.asset(imageUrl, width: 250, height: 140,),
          Text(title, style: TextStyle(fontSize: 25, fontFamily: "Raleway")),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {

                  },
                ),
                Column(
                  children: <Widget>[
                    Text(oldPrice, style:TextStyle(
                      fontSize: 16,
                      color: Color(0xFFfeb8ba),
                      fontFamily: "Helvetica"
                    )),
                    SizedBox(
                      height: 6,
                    ),
                    Text('\$$price', style:TextStyle(
                      fontSize: 26,
                      fontFamily: "Helvetica"
                    )),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {

                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CartBottomApp extends StatefulWidget {
  @override
  _CartBottomAppState createState() => _CartBottomAppState();
}

List iconList = [
  Icon(Icons.home),
  Icon(Icons.search),
  Icon(Icons.shopping_cart),
  Icon(Icons.person_outline)
];

class _CartBottomAppState extends State<CartBottomApp> {
  int _currnetIndex = 0;
  @override
  Widget build(BuildContext context) {
    /* return BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _currnetIndex,
        onTap: (index) {
          setState(() {
            _currnetIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Container(height: 0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Container(height: 0,)
          )
        ],
      ); */
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.065),
            offset: Offset(0, -3),
            blurRadius: 10
          )
        ]
      ),
      child: Row(
        children: iconList.map((icon) {
          var index = iconList.indexOf(icon);
          return Expanded(
            child: GestureDetector(
              onTap: () {
                print(index);
              },
              child: icon,
            ),
          );
        }).toList(),
      ),
    );
  }
}