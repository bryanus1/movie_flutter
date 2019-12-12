import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/movie.dart';

class ListCard extends StatelessWidget {
  final List<Movie> images;
  const ListCard({Key key, @required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: _size.height * 0.21,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('lib/assets/img/no-image.jpg'),
                image: NetworkImage(images[index].getImagePath()),
                height: 160.0,
              ),
            ),
          );
        },
      ),
    );
  }
}