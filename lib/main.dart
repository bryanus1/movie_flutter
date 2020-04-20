import 'package:flutter/material.dart';
import 'package:movie_flutter/src/pages/home.dart';
import 'package:movie_flutter/src/routes/routes.dart';
import 'package:movie_flutter/src/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: Utils.isInDebugMode,
      title: 'Movie Flutter',
      initialRoute: Home.routeName,
      routes: getApplicationRoutes()
    );
  }
}
