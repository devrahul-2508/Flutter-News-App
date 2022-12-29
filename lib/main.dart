import 'package:flutter/material.dart';
import 'package:flutter_news_app/pages/homepage.dart';
import 'package:flutter_news_app/pages/homepage.dart';
import 'package:flutter_news_app/pages/news_detail_page.dart';
import 'package:flutter_news_app/provider/appstatenotifier.dart';
import 'package:flutter_news_app/themes/themes.dart';
import 'package:provider/provider.dart';

import 'pages/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider<AppStateProvider>(
      child: MyApp(), create: (_) => AppStateProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
  
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        return MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
         themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
     
    );
  }
}
