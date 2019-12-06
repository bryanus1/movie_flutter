import 'package:flutter/material.dart';
import 'package:movie_flutter/src/pages/home.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
      Home.routeName: ( BuildContext context ) => Home(),
  };
}