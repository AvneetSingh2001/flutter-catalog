import 'package:flutter/material.dart';
import 'package:tech_catalog_app/pages/home_page.dart';
import 'package:tech_catalog_app/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => homePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
