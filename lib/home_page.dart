import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);
  final int days = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Catalogs"),
        ),
        body: Container(
          child: Center(
            child: Text('it $days'),
          ),
        ),
      ),
    );
  }
}
