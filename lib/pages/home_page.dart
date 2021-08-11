import 'package:flutter/material.dart';
import 'package:tech_catalog_app/widgets/drawer.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);
  final int days = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogs"),
      ),
      body: Container(
        child: Center(
          child: Text('HomePage'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
