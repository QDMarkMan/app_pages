import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const List<Color> colors = [Colors.amberAccent, Colors.blueAccent, Colors.greenAccent];
// swiper 部分
class HomeSwiper extends StatefulWidget {
  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 150,
          child: Swiper(
            itemBuilder: (BuildContext context,int index){
              return Container(
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 3),
                      blurRadius: 3
                    )
                  ]
                ),
              );
            },
            autoplay: true,
            itemCount: 3,
            viewportFraction: 0.8,
            scale: 0.9,
            pagination: SwiperPagination(
              builder: SwiperPagination.dots
            ),
            // control: SwiperControl(),
          ),
        ),
    );
  }
}