import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_catalog_app/core/store.dart';
import 'package:tech_catalog_app/models/cart.dart';
import 'package:tech_catalog_app/models/catalog.dart';
import 'package:tech_catalog_app/utils/routes.dart';
import 'package:tech_catalog_app/widgets/drawer.dart';
import 'package:tech_catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:tech_catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:tech_catalog_app/widgets/item_widgets.dart';
import 'package:tech_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final int days = 2;

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final CatalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final CatalogJson = response.body;
    final decodedData = jsonDecode(CatalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        floatingActionButton: VxBuilder(
            mutations: {AddMutation, RemoveMutation},
            builder: (BuildContext context, store, VxStatus? status) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                child: Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
                backgroundColor: Theme.of(context).buttonColor,
              ).badge(
                  color: Colors.red[500],
                  size: 22,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ));
            }),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py8().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
