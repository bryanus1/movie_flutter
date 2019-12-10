import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_flutter/src/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> images;
  const CardSwiper({Key key, @required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: _size.height * 0.5,
      child: Swiper(
        itemCount: images.length,
        itemWidth: _size.width * 0.75,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: FadeInImage(
              placeholder: AssetImage('lib/assets/img/no-image.jpg'),
              image: NetworkImage(images[index].getImagePath()),
            )
          );
        },
      ),
    );
  }
}