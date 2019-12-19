import 'package:flutter/material.dart';
import 'package:movie_flutter/src/pages/home.dart';
import 'package:movie_flutter/src/pages/movie_detail.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
      Home.routeName: (BuildContext context) => Home(),
      MovieDetail.routeName: (BuildContext context) => MovieDetail()
  };
}