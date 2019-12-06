import 'package:flutter/material.dart';
import 'package:movie_flutter/src/resources/resources.dart';
import 'package:movie_flutter/src/widgets/card_swiper.dart';

class Home extends StatefulWidget {
  static final routeName = "home";
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resources.blueColor,
        title: Text("Movie Flutter"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: CardSwiper(images: [],),
    );
  }
}