import 'package:flutter/material.dart';
import 'package:tech_catalog_app/core/store.dart';
import 'package:tech_catalog_app/models/catalog.dart';
import 'package:tech_catalog_app/pages/cart_page.dart';
import 'package:tech_catalog_app/pages/home_detail_page.dart';
import 'package:tech_catalog_app/pages/home_page.dart';
import 'package:tech_catalog_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_catalog_app/utils/routes.dart';
import 'package:tech_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => homePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
