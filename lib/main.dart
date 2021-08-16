import 'package:flutter/material.dart';
import 'package:tech_catalog_app/pages/home_page.dart';
import 'package:tech_catalog_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_catalog_app/utils/routes.dart';
import 'package:tech_catalog_app/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => homePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
