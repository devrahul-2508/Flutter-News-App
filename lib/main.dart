import 'package:flutter/material.dart';
import 'package:flutter_news_app/pages/homepage.dart';
import 'package:flutter_news_app/pages/news_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
