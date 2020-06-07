import 'package:flutter/material.dart';
import 'package:youtube/Home.dart';
void main() => runApp(MaterialApp(
  initialRoute: "/",
  home: Home(),
  routes: {
    "/home": (context) => Home(),
  },
));