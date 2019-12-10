import 'package:flutter/material.dart';
import 'package:movie_flutter/src/providers/movies_provider.dart';
import 'package:movie_flutter/src/resources/resources.dart';
import 'package:movie_flutter/src/widgets/card_swiper.dart';

class Home extends StatefulWidget {
  static final routeName = "home";
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MoviesProvider moviesProvider = MoviesProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resources.blueColor,
        title: Text("Movie Flutter"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => moviesProvider.getNowPlaying(),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _cardSwipe(),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              "Popular Movies:",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
                color: Resources.blueColor
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardSwipe(){
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot snapshot){

        final _size = MediaQuery.of(context).size;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Container(
              height: _size.height * 0.5,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Resources.blueColor)
                ),
              ),
            );
          case ConnectionState.active:
            return Container(
              height: _size.height * 0.5,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Resources.blueColor)
                ),
              ),
            );
          case ConnectionState.waiting:
            return Container(
              height: _size.height * 0.5,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Resources.blueColor)
                ),
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            return CardSwiper(images: snapshot.data,);
          default:
            return Container();
        }
      },
    );
  }
}