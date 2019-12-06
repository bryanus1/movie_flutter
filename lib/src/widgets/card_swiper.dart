import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> images;
  const CardSwiper({Key key, @required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Swiper(
        itemCount: 3,
        itemWidth: _size.width * 0.75,
        itemHeight: _size.height * 0.50,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.network(
              "http://via.placeholder.com/288x188",
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}